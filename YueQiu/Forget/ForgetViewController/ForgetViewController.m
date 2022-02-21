//
//  ForgetViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import "ForgetViewController.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

NSString *const backMassage = @"backMassage";

@interface ForgetViewController ()

@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_initUI];
}

//初始化UI
- (void)p_initUI {
    self.forgetView = [[ForgetView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.forgetView.backButton addTarget:self action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.forgetView.sendButton addTarget:self action:@selector(pressSend:) forControlEvents:UIControlEventTouchUpInside];
    [self.forgetView.sureButton addTarget:self action:@selector(pressSure:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.forgetView];
}

//确认按钮事件
- (void)pressSure:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //发送推出新视图的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:backMassage object:nil userInfo:nil];
}

//验证码
- (void)pressSend:(UIButton *)button {
    NSLog(@"验证码");
}

//返回按钮事件
- (void)pressBack:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
