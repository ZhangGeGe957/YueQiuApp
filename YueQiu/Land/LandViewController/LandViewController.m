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

@end

@implementation LandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    //注册通知
    [self p_addNotification];
    
    //初始化view
    self.landView = [[LandView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.landView.landButton addTarget:self action:@selector(p_presentMainView:) forControlEvents:UIControlEventTouchUpInside];
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

//推出主界面
- (void)p_presentMainView:(UIButton *)button {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
