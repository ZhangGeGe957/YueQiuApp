//
//  RegisterView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterView : UIView

@property (nonatomic, strong) UIButton *backButton;  //返回按钮
@property (nonatomic, strong) UIButton *sureButton;  //确认注册按钮
@property (nonatomic, strong) UIButton *circleButton; //协议前的圈
@property (nonatomic, strong) UIButton *agreementButton; //协议按钮
@property (nonatomic, strong) UIButton *haveButton;  //已有账号按钮
@property (nonatomic, strong) UIButton *sendButton;  //发送验证码按钮
@property (nonatomic, strong) UILabel *titleLabel;  //标题
@property (nonatomic, strong) UIImageView *phoneImageView;  //手机号图片
@property (nonatomic, strong) UIImageView *codeImageView;  //验证码图片
@property (nonatomic, strong) UIImageView *passwordImageView;  //密码图片
@property (nonatomic, strong) UIImageView *againImageView;  //重复密码图片
@property (nonatomic, strong) UITextField *phoneTextField;  //手机号输入
@property (nonatomic, strong) UITextField *codeTextField;  //验证码输入
@property (nonatomic, strong) UITextField *passwordTextField;  //密码输入
@property (nonatomic, strong) UITextField *againTextField;  //重复密码输入
@property CGRect rectStatus;  //记录状态栏高度


@end

NS_ASSUME_NONNULL_END
