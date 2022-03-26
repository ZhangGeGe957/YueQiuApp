//
//  ReserveViewController.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/21.
//

#import <UIKit/UIKit.h>
#import "ReserveView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReserveViewController : UIViewController

@property (nonatomic, strong) ReserveView *reserveView;
@property (nonatomic, strong) NSString* stadiumLocation;
@property (nonatomic, strong) NSString* stadiumName;
@property (nonatomic, strong) NSString* appName;
@end

NS_ASSUME_NONNULL_END
