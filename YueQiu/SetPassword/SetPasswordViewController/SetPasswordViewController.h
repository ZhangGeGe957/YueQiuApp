//
//  SetPasswordViewController.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/18.
//

#import <UIKit/UIKit.h>
#import "SetPasswordView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetPasswordViewController : UIViewController

@property (nonatomic, strong) SetPasswordView *setPasswordView;
@property (nonatomic, retain) UIAlertController* sendAlertView;  //提示框
@property (nonatomic, strong) NSTimer *backTimer;  //返回计时器

@end

NS_ASSUME_NONNULL_END
