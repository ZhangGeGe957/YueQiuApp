//
//  ForgetView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import "ForgetView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ForgetView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    [self initAllUI];
    
    return self;
}

//初始化控件
- (void)initAllUI {
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
    self.titleLabel.text = @"忘记密码";
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
        make.top.equalTo(self).offset(myHeight / 5);
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
    
    //确认按钮
    self.sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sureButton setTitle:@"下一步" forState:UIControlStateNormal];
    self.sureButton.tintColor = [UIColor whiteColor];
    self.sureButton.backgroundColor = [UIColor orangeColor];
    self.sureButton.layer.masksToBounds = YES;
    self.sureButton.layer.cornerRadius = 20;
    [self addSubview:self.sureButton];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.codeTextField.mas_bottom).offset(30);
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
