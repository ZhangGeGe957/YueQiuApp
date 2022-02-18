//
//  SetPasswordView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/18.
//

#import "SetPasswordView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation SetPasswordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    //初始化控件
    [self p_initAllUI];
    
    return self;
}

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
    self.titleLabel.text = @"设置密码";
    [self.titleLabel setFont:[UIFont systemFontOfSize:32]];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(self.rectStatus.size.height + 20);
    }];
    
    //输入框
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.placeholder = @"密码";
    self.passwordTextField.layer.masksToBounds = YES;
    self.passwordTextField.layer.cornerRadius = 20;
    self.passwordTextField.layer.borderWidth = 0.5;
    [self addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(myHeight / 5);
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
    self.passwordImageView = [[UIImageView alloc] init];
    self.passwordImageView.image = [UIImage imageNamed:@"tubiao202.png"];
    [self addSubview:self.passwordImageView];
    [self.passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.passwordTextField.mas_left).offset(-20);
        make.top.equalTo(self.passwordTextField);
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
    
    //确认按钮
    self.sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
    self.sureButton.tintColor = [UIColor whiteColor];
    self.sureButton.backgroundColor = [UIColor orangeColor];
    self.sureButton.layer.masksToBounds = YES;
    self.sureButton.layer.cornerRadius = 20;
    [self addSubview:self.sureButton];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.againTextField.mas_bottom).offset(30);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
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
