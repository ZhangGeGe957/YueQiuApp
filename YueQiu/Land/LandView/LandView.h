//
//  LandView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/18.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface LandView : UIView

@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *landButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *forgetButton;
@property (nonatomic, strong) UIImageView *basketballImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
