//
//  SetPasswordViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/18.
//

#import "SetPasswordViewController.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface SetPasswordViewController ()

@end

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSetUI];
    
}

//初始化UI
- (void)initSetUI {
    self.setPasswordView = [[SetPasswordView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.setPasswordView.backButton addTarget:self action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.setPasswordView.sureButton addTarget:self action:@selector(pressSure:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.setPasswordView];
}

//返回按钮事件
- (void)pressBack:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//确认按钮
- (void)pressSure:(UIButton *)button {
    if ([self.setPasswordView.passwordTextField.text isEqualToString:@""] || [self.setPasswordView.againTextField.text isEqualToString:@""]) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入新密码！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else if (![self.setPasswordView.passwordTextField.text isEqualToString:self.setPasswordView.againTextField.text]) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不一致请重新输入！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"密码修改成功！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
        self.backTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startBackTimer:) userInfo:@"ZhangGeGe" repeats:YES];
    }
}

//定时器函数
- (void)startBackTimer:(NSTimer *)timer {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.backTimer invalidate];
    self.backTimer = nil;
}

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.setPasswordView.passwordTextField resignFirstResponder];
    [self.setPasswordView.againTextField resignFirstResponder];
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
