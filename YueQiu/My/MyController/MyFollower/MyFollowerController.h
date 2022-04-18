//
//  MyFollowerController.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

#import <UIKit/UIKit.h>
#import "MyFollowerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyFollowerController : UIViewController
@property(nonatomic, strong)NSString* uid;
@property(nonatomic, strong)NSString* mobileToken;

@property(nonatomic, strong)MyFollowerView* myFollowerView;
@end

NS_ASSUME_NONNULL_END
