//
//  RegisterView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import "RegisterView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    [self p_initAllUI];
    
    return self;
}

//初始化UI
- (void)p_initAllUI {
    //返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui2.png"] forState:UIControlStateNormal];
    [self addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.rectStatus.size.height + 20);
        make.left.equalTo(self).offset(20);
        make.size.equalTo(@30);
    }];
    
    //标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"注册";
    [self.titleLabel setFont:[UIFont systemFontOfSize:32]];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(self.rectStatus.size.height + 20);
    }];
    
    //输入框
    self.phoneTextField = [[UITextField alloc] init];
    self.phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.phoneTextField.placeholder = @"手机号";
    self.phoneTextField.layer.masksToBounds = YES;
    self.phoneTextField.layer.cornerRadius = 20;
    self.phoneTextField.layer.borderWidth = 0.5;
    [self addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(myHeight / 3.5);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    self.codeTextField = [[UITextField alloc] init];
    self.codeTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.codeTextField.placeholder = @"验证码";
    self.codeTextField.layer.masksToBounds = YES;
    self.codeTextField.layer.cornerRadius = 20;
    self.codeTextField.layer.borderWidth = 0.5;
    [self addSubview:self.codeTextField];
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.phoneTextField.mas_bottom).offset(30);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.placeholder = @"密码";
    self.passwordTextField.layer.masksToBounds = YES;
    self.passwordTextField.layer.cornerRadius = 20;
    self.passwordTextField.layer.borderWidth = 0.5;
    [self addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.codeTextField.mas_bottom).offset(30);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    self.againTextField = [[UITextField alloc] init];
    self.againTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.againTextField.placeholder = @"请再次输入密码";
    self.againTextField.layer.masksToBounds = YES;
    self.againTextField.layer.cornerRadius = 20;
    self.againTextField.layer.borderWidth = 0.5;
    [self addSubview:self.againTextField];
    [self.againTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(30);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    
    //图标
    self.phoneImageView = [[UIImageView alloc] init];
    self.phoneImageView.image = [UIImage imageNamed:@"yonghu.png"];
    [self addSubview:self.phoneImageView];
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.phoneTextField.mas_left).offset(-20);
        make.top.equalTo(self.phoneTextField);
        make.size.equalTo(@40);
    }];
    self.codeImageView = [[UIImageView alloc] init];
    self.codeImageView.image = [UIImage imageNamed:@"yanzhengma.png"];
    [self addSubview:self.codeImageView];
    [self.codeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneImageView);
        make.top.equalTo(self.phoneImageView.mas_bottom).offset(30);
        make.size.equalTo(@40);
    }];
    self.passwordImageView = [[UIImageView alloc] init];
    self.passwordImageView.image = [UIImage imageNamed:@"tubiao202.png"];
    [self addSubview:self.passwordImageView];
    [self.passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.codeImageView);
        make.top.equalTo(self.codeImageView.mas_bottom).offset(30);
        make.size.equalTo(@40);
    }];
    self.againImageView = [[UIImageView alloc] init];
    self.againImageView.image = [UIImage imageNamed:@"yuechi.png"];
    [self addSubview:self.againImageView];
    [self.againImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordImageView);
        make.top.equalTo(self.passwordImageView.mas_bottom).offset(30);
        make.size.equalTo(@40);
    }];
    
    //协议
    self.agreementButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.agreementButton setTitle:@"我同意《XXX协议》" forState:UIControlStateNormal];
    [self.agreementButton setTintColor:[UIColor blackColor]];
    [self addSubview:self.agreementButton];
    [self.agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.againTextField.mas_bottom).offset(30);
        make.centerX.equalTo(self);
        make.height.equalTo(@30);
    }];
    self.circleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.circleButton setImage:[UIImage imageNamed:@"xuanzeweixuanze.png"] forState:UIControlStateNormal];
    self.circleButton.selected = NO;
    [self addSubview:self.circleButton];
    [self.circleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.agreementButton.mas_top);
        make.right.equalTo(self.agreementButton.mas_left).offset(-10);
        make.size.equalTo(@30);
    }];
    
    //确认按钮
    self.sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sureButton setTitle:@"登陆" forState:UIControlStateNormal];
    self.sureButton.tintColor = [UIColor whiteColor];
    self.sureButton.backgroundColor = [UIColor orangeColor];
    self.sureButton.layer.masksToBounds = YES;
    self.sureButton.layer.cornerRadius = 20;
    [self addSubview:self.sureButton];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.agreementButton.mas_bottom).offset(30);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];
    
    //已有账号按钮
    self.haveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.haveButton setTitle:@"已有账号，直接登陆？" forState:UIControlStateNormal];
    self.haveButton.tintColor = [UIColor blackColor];
    [self addSubview:self.haveButton];
    [self.haveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.sureButton.mas_bottom).offset(20);
        make.height.equalTo(@30);
    }];
    
    //验证码按钮
    self.sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.sendButton.layer.masksToBounds = YES;
    self.sendButton.layer.cornerRadius = 20;
    self.sendButton.layer.borderWidth = 0.5;
    [self.sendButton setTintColor:[UIColor whiteColor]];
    self.sendButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.sendButton];
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.codeTextField.mas_right);
        make.top.equalTo(self.codeTextField.mas_top);
        make.height.equalTo(@40);
        make.width.equalTo(@90);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
