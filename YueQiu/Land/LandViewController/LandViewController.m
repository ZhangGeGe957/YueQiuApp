//
//  LandViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/18.
//

#import "LandViewController.h"
#import "HomePageViewController.h"
#import "TrainViewController.h"
#import "NewsViewController.h"
#import "MyViewController.h"
#import "RegisterViewController.h"
#import "ForgetViewController.h"
#import "SetPasswordViewController.h"
#import "LandModel.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

NSString *const identityAuthentication = @"ZhangGeGe";

@interface LandViewController ()

//初始化视图
@property (nonatomic, strong) HomePageViewController *homePageView;
@property (nonatomic, strong) TrainViewController *trainView;
@property (nonatomic, strong) NewsViewController *newsView;
@property (nonatomic, strong) MyViewController *myView;
@property (nonatomic, strong) RegisterViewController *registerView;
@property (nonatomic, strong) ForgetViewController *forgetView;
@property (nonatomic, strong) SetPasswordViewController *setPasswordView;
//初始化导航控制器
@property (nonatomic, strong) UINavigationController *homePageNavigationController;
@property (nonatomic, strong) UINavigationController *trainNavigationController;
@property (nonatomic, strong) UINavigationController *newsNavigationController;
@property (nonatomic, strong) UINavigationController *myNavigationController;
//存储导航控制器的数组
@property (nonatomic, copy) NSArray *viewArray;
//分栏控制器
@property (nonatomic, strong) UITabBarController *tabBarController;
//登陆状态
@property NSInteger landCode;

@end

@implementation LandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设备唯一标识
    self.identificationString = [[UUIDStrengthen alloc] getDeviceIDInKeychain];
    NSLog(@"--------------------------");
    NSLog(@"%@", self.identificationString);
    NSLog(@"--------------------------");
    
    //启动页
    self.startUpImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    self.startUpImageView.image = [UIImage imageNamed:@"startUP.png"];
    [self.view addSubview:self.startUpImageView];
    //启动计时器
    self.startShowImageViewTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeEnd:) userInfo:identityAuthentication repeats:YES];
}

//定时器函数
- (void)timeEnd:(NSTimer *)timer {
    //移除启动页
    for (UIView *view in [self.view subviews]) {
        [view removeFromSuperview];
    }
    
    //注销定时器
    [self.startShowImageViewTimer invalidate];
    self.startShowImageViewTimer = nil;
    
    //注册通知
    [self p_addNotification];
    
    //初始化view
    self.landView = [[LandView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.landView.landButton addTarget:self action:@selector(landMainView:) forControlEvents:UIControlEventTouchUpInside];
    [self.landView.registerButton addTarget:self action:@selector(p_presentRegisterView:) forControlEvents:UIControlEventTouchUpInside];
    [self.landView.forgetButton addTarget:self action:@selector(p_presentForgetView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.landView];
}

//注册通知
- (void)p_addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_backMassage:) name:backMassage object:nil];
}

//判断通知
- (void)p_backMassage:(NSNotification *)sender {
    self.setPasswordView = [[SetPasswordViewController alloc] init];
    self.setPasswordView.modalPresentationStyle = UIModalPresentationFullScreen;
    self.setPasswordView.phoneNumber = [NSString stringWithFormat:@"%@", sender.userInfo[@"content"]];
    [self presentViewController:self.setPasswordView animated:YES completion:nil];
}

//推出注册页面
- (void)p_presentRegisterView:(UIButton *)button {
    self.registerView = [[RegisterViewController alloc] init];
    self.registerView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:self.registerView animated:YES completion:nil];
}

//推出忘记页面
- (void)p_presentForgetView:(UIButton *)button {
    self.forgetView = [[ForgetViewController alloc] init];
    self.forgetView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:self.forgetView animated:YES completion:nil];
}

//登陆按钮
- (void)landMainView:(UIButton *)button {
    if ([self.landView.accountTextField.text isEqualToString:@""] || [self.landView.passwordTextField.text isEqualToString:@""]) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入手机号和密码！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else if (self.landView.accountTextField.text.length != 11) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else {
        //登陆请求
        [self landNetRequest];
    }
}

//发送登陆网络请求
- (void)landNetRequest {
    LandModel *landNetWork = [LandModel shareManager];
    landNetWork.userNumber = [self.landView.accountTextField.text copy];
    landNetWork.passwordNumber = [self.landView.passwordTextField.text copy];
    landNetWork.tokenNumber = [self.identificationString copy];
    
    [[LandModel shareManager] LandAccountWithData:^(LandJSONModel * _Nullable LandAccountModel) {
        NSLog(@"%@   %@   %ld", LandAccountModel.data, LandAccountModel.msg, LandAccountModel.code);
        self.landCode = LandAccountModel.code;
        if (LandAccountModel.code == 400) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //弹窗提示
                self.sendAlertView = [UIAlertController alertControllerWithTitle:@"检查你的账号是否注册并输入正确的账号和密码！" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                [self presentViewController:self.sendAlertView animated:true completion:nil];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //推出主界面
                [self p_presentMainView];
            });
        }
    } andError:^(NSError * _Nullable error) {
        NSLog(@"获取失败！");
    }];
}

//推出主界面
- (void)p_presentMainView {
    //初始化视图
    self.homePageView = [[HomePageViewController alloc] init];
    self.trainView = [[TrainViewController alloc] init];
    self.newsView = [[NewsViewController alloc] init];
    self.myView = [[MyViewController alloc] init];
    self.homePageView.title = @"首页";
    self.trainView.title = @"训练";
    self.newsView.title = @"球局";
    self.myView.title = @"我的";
    
    //初始化导航控制器
    self.homePageNavigationController = [[UINavigationController alloc] initWithRootViewController:self.homePageView];
    self.trainNavigationController = [[UINavigationController alloc] initWithRootViewController:self.trainView];
    self.newsNavigationController = [[UINavigationController alloc] initWithRootViewController:self.newsView];
    self.myNavigationController = [[UINavigationController alloc] initWithRootViewController:self.myView];
    
    //存储导航控制器的数组
    self.viewArray = [[NSArray alloc] initWithObjects:self.homePageNavigationController,self.trainNavigationController, self.newsNavigationController, self.myNavigationController, nil];
    
    //分栏控制器
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.tabBar.tintColor = [UIColor orangeColor];
    self.tabBarController.viewControllers = self.viewArray;
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.view.backgroundColor = [UIColor whiteColor];
    
    //推出视图
    self.tabBarController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:self.tabBarController animated:YES completion:nil];
}

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.landView.accountTextField resignFirstResponder];
    [self.landView.passwordTextField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
