//
//  RegisterViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import "RegisterViewController.h"
#import "SendMessageManager.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tipString = [[NSString alloc] init];
    
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
    [self.registerView.sureButton addTarget:self action:@selector(pressSure:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerView];
}

//确认按钮
- (void)pressSure:(UIButton *)button {
    if ([self.registerView.phoneTextField.text isEqualToString:@""] || [self.registerView.codeTextField.text isEqualToString:@""]) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入手机号和验证码！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else if ([self.registerView.passwordTextField.text isEqualToString:@""] || [self.registerView.againTextField.text isEqualToString:@""]) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else if (![self.registerView.passwordTextField.text isEqualToString:self.registerView.againTextField.text]) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不一致请重新输入！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else {
        //发送账号信息给后台
        [self p_confirmAccount];
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            //弹窗提示
            self.sendAlertView = [UIAlertController alertControllerWithTitle:self.tipString message:nil preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:self.sendAlertView animated:true completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
            if ([self.tipString isEqualToString:@"账号注册成功！"]) {
                self.backTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startBackTimer:) userInfo:@"ZhangGeGe" repeats:YES];
            }
        });
    }
}

//定时器函数
- (void)startBackTimer:(NSTimer *)timer {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.backTimer invalidate];
    self.backTimer = nil;
}

//验证码
- (void)pressSend:(UIButton *)button {
    if (self.registerView.phoneTextField.text.length != 11) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else {
        self.sendButtonTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
        [self.registerView.sendButton setEnabled:NO];
        self.allTime = 60;
        
        //发送短信验证网络请求
        [self p_sendMessageCode];
    }
}
- (void)countDown:(NSTimer *)timer {
    if (self.allTime == 0) {
        [self.sendButtonTimer invalidate];
        self.sendButtonTimer = nil;
        [self.registerView.sendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self.registerView.sendButton setEnabled:YES];
    } else {
        NSString *tempString = [[NSString alloc] initWithFormat:@"%lds", self.allTime];
        [self.registerView.sendButton setTitle:tempString forState:UIControlStateNormal];
        self.allTime = self.allTime - 1;
    }
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

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.registerView.phoneTextField resignFirstResponder];
    [self.registerView.passwordTextField resignFirstResponder];
    [self.registerView.codeTextField resignFirstResponder];
    [self.registerView.againTextField resignFirstResponder];
}

//发送短信验证网络请求
- (void)p_sendMessageCode {
    
    SendMessageManager *manager = [SendMessageManager shareManager];
    manager.userNumber = [self.registerView.phoneTextField.text copy];
    
    [[SendMessageManager shareManager] SendMessageWithData:^(SendMessageJSONModel * _Nullable sendMessageModel) {
        NSLog(@"%@ %ld", sendMessageModel.msg, sendMessageModel.code);
    } andError:^(NSError * _Nullable error) {
        NSLog(@"短信发送失败！");
    }];
}

//发送账号信息给后台
- (void)p_confirmAccount {
    SendMessageManager *manager = [SendMessageManager shareManager];
    manager.userNumber = [self.registerView.phoneTextField.text copy];
    manager.passwordNumber = [self.registerView.passwordTextField.text copy];
    manager.codeNumber = [self.registerView.codeTextField.text copy];
    
    [[SendMessageManager shareManager] ConfirmAccountWithData:^(SendMessageJSONModel * _Nullable sendMessageModel) {
        NSLog(@"%@ %ld", sendMessageModel.msg, sendMessageModel.code);
        if (sendMessageModel.code == 200) {
            self.tipString = @"账号注册成功！";
        } else if (sendMessageModel.code == 400) {
            self.tipString = @"验证码错误！";
        } else if (sendMessageModel.code == 403) {
            self.tipString = @"用户已经被注册！";
        } else if (sendMessageModel.code == 410) {
            self.tipString = @"验证码过期！";
        } else {
            self.tipString = @"服务器内部错误！";
        }
    } andError:^(NSError * _Nullable error) {
        NSLog(@"请求失败");
    }];
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
