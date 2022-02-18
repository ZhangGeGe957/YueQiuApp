//
//  SetPasswordView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetPasswordView : UIView

@property (nonatomic, strong) UIButton *backButton;  //返回按钮
@property (nonatomic, strong) UIButton *sureButton;  //确认按钮
@property (nonatomic, strong) UILabel *titleLabel;  //标题
@property (nonatomic, strong) UIImageView *passwordImageView;  //密码图片
@property (nonatomic, strong) UIImageView *againImageView;  //重复密码图片
@property (nonatomic, strong) UITextField *passwordTextField;  //密码输入
@property (nonatomic, strong) UITextField *againTextField;  //重复密码输入
@property CGRect rectStatus;  //记录状态栏高度

@end

NS_ASSUME_NONNULL_END
