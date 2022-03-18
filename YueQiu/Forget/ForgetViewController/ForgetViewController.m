//
//  ForgetViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import "ForgetViewController.h"
#import "ForgetManager.h"

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
    ForgetManager* forgetManager = [ForgetManager sharedManager];
    forgetManager.codeNumber = [self.forgetView.codeTextField.text copy];
    forgetManager.userNumber = [self.forgetView.phoneTextField.text copy];
    [[ForgetManager sharedManager] verifyCodeNumberWithData:^(ForgetJsonModel * _Nonnull forgetModel) {
        self.msgCode = forgetModel.code;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self judgeNext];
        });
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
    
}

- (void)judgeNext{
    if(self.msgCode == 200) {
        [self dismissViewControllerAnimated:YES completion:nil];
        //发送推出新视图的通知
        [[NSNotificationCenter defaultCenter] postNotificationName:backMassage object:nil userInfo:@{@"content":self.forgetView.phoneTextField.text}];
    } else if (self.msgCode == 400) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
    } else if(self.msgCode == 410) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码已过期" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
    }
}
//验证码
- (void)pressSend:(UIButton *)button {
    if (self.forgetView.phoneTextField.text.length != 11) {
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号！" preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else {
        self.sendButtonTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
        [self.forgetView.sendButton setEnabled:NO];
        self.allTime = 60;
        
        //发送短信验证网络请求
        [self sendMessageCode];
    }
}
- (void)countDown:(NSTimer *)timer {
    if (self.allTime == 0) {
        [self.sendButtonTimer invalidate];
        self.sendButtonTimer = nil;
        [self.forgetView.sendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self.forgetView.sendButton setEnabled:YES];
    } else {
        NSString *tempString = [[NSString alloc] initWithFormat:@"%ld", self.allTime];
        [self.forgetView.sendButton setTitle:tempString forState:UIControlStateNormal];
        self.allTime = self.allTime - 1;
    }
}

//返回按钮事件
- (void)pressBack:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.forgetView.phoneTextField resignFirstResponder];
    [self.forgetView.codeTextField resignFirstResponder];
}

//发送短信验证网络请求
- (void)sendMessageCode {
    
    ForgetManager *manager = [ForgetManager sharedManager];
    manager.userNumber = [self.forgetView.phoneTextField.text copy];
    
    [[ForgetManager sharedManager] SendMessageWithData:^(ForgetJsonModel * _Nonnull forgetModel) {
        NSLog(@"%@ %ld", forgetModel.msg, forgetModel.code);
        NSLog(@"获取成功");
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
}

@end
