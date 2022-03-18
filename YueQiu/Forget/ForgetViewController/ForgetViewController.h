//
//  ForgetViewController.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/17.
//

#import <UIKit/UIKit.h>
#import "ForgetView.h"

extern NSString *const backMassage;

NS_ASSUME_NONNULL_BEGIN

@interface ForgetViewController : UIViewController

@property (nonatomic, strong) ForgetView *forgetView;
@property (nonatomic, weak) NSTimer *sendButtonTimer;
@property NSInteger allTime;
@property (nonatomic, retain) UIAlertController* sendAlertView;  //提示框
@property NSInteger msgCode;
//发送短信验证网络请求
- (void)sendMessageCode;

@end

NS_ASSUME_NONNULL_END
