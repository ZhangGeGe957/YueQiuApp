//
//  ReleaseGameViewController.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/26.
//

#import <UIKit/UIKit.h>
#import "ReleaseGameView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReleaseGameViewController : UIViewController

@property (nonatomic, strong) ReleaseGameView *releaseGameView;
@property (nonatomic, strong) NSString *uid;  //唯一uid
@property (nonatomic, strong) NSString *mobileToken;  //设备码
@property (nonatomic, retain) UIAlertController* sendAlertView;  //提示框

@end

NS_ASSUME_NONNULL_END
