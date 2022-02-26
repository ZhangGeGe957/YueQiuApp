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
    [self dismissViewControllerAnimated:YES completion:nil];
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
