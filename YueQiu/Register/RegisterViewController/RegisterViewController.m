//
//  RegisterViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import "RegisterViewController.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_initUI];
}

//初始化UI
- (void)p_initUI {
    self.registerView = [[RegisterView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.registerView.backButton addTarget:self action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerView.circleButton addTarget:self action:@selector(pressSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerView.agreementButton addTarget:self action:@selector(pressAgreement:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerView.haveButton addTarget:self action:@selector(pressHave:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerView.sendButton addTarget:self action:@selector(pressSend:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerView];
}

//验证码
- (void)pressSend:(UIButton *)button {
    NSLog(@"验证码");
}

//返回按钮事件
- (void)pressBack:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//已有账号按钮
- (void)pressHave:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//协议按钮
- (void)pressAgreement:(UIButton *)button {
    NSLog(@"协议");
}

//协议选择按钮
- (void)pressSelect:(UIButton *)button {
    if (button.selected) {
        [button setImage:[UIImage imageNamed:@"xuanzeweixuanze.png"] forState:UIControlStateNormal];
        button.selected = NO;
    } else {
        [button setImage:[UIImage imageNamed:@"xuanzeyixuanze.png"] forState:UIControlStateNormal];
        button.selected = YES;
    }
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
