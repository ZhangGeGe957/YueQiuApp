//
//  LandView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/18.
//

#import "LandView.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation LandView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor whiteColor];
    [self p_initUI];
    
    return self;
}

- (void)p_initUI {
    //图标
    self.basketballImageView = [[UIImageView alloc] init];
    self.basketballImageView.image = [UIImage imageNamed:@"lanqiu-copy.png"];
    [self addSubview:self.basketballImageView];
    [self.basketballImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(myHeight / 5.5));
        make.left.equalTo(self.mas_centerX).offset(-100);
        make.size.equalTo(@75);
    }];
    //标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"约球";
    [self.titleLabel setFont:[UIFont systemFontOfSize:55]];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(myHeight / 5.5));
        make.left.equalTo(self.basketballImageView.mas_right).offset(18);
        make.height.equalTo(@75);
        make.width.equalTo(@120);
    }];
    
    //账号框
    self.accountTextField = [[UITextField alloc] init];
    self.accountTextField.placeholder = @"请输入账号/手机号";
    self.accountTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.accountTextField.layer.cornerRadius = 25;
    self.accountTextField.layer.masksToBounds = YES;
    self.accountTextField.layer.borderWidth = 0.5;
    [self addSubview:self.accountTextField];
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(myHeight / 3);
        make.centerX.equalTo(self);
        make.width.equalTo(@250);
        make.height.equalTo(@50);
    }];
    
    //密码框
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.placeholder = @"请输入密码";
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.layer.cornerRadius = 25;
    self.passwordTextField.layer.masksToBounds = YES;
    self.passwordTextField.layer.borderWidth = 0.5;
    [self addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountTextField).offset(88);
        make.centerX.equalTo(self);
        make.width.equalTo(@250);
        make.height.equalTo(@50);
    }];
    
    //登陆按钮
    self.landButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.landButton setTitle:@"登陆" forState:UIControlStateNormal];
    self.landButton.backgroundColor = [UIColor orangeColor];
    self.landButton.tintColor = [UIColor whiteColor];
    self.landButton.layer.masksToBounds = YES;
    self.landButton.layer.cornerRadius = 15;
    self.landButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [self addSubview:self.landButton];
    [self.landButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField).offset(100);
        make.centerX.equalTo(self);
        make.width.equalTo(@120);
        make.height.equalTo(@50);
    }];
    
    //注册按钮
    self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
    self.registerButton.tintColor = [UIColor blackColor];
    [self addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.landButton).offset(80);
        make.right.equalTo(self.mas_centerX).offset(-50);
        make.width.equalTo(@100);
        make.height.equalTo(@25);
    }];
    
    //忘记密码按钮
    self.forgetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.forgetButton.tintColor = [UIColor blackColor];
    [self addSubview:self.forgetButton];
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.landButton).offset(80);
        make.left.equalTo(self.mas_centerX).offset(50);
        make.width.equalTo(@100);
        make.height.equalTo(@25);
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
