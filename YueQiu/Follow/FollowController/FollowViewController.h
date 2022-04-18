//
//  FollowViewController.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import "ViewController.h"
#import "FollowView.h"
NS_ASSUME_NONNULL_BEGIN

@interface FollowViewController : ViewController
@property(nonatomic, strong)FollowView* followView;
@property(nonatomic, strong)NSString* idString;
@property(nonatomic, strong)NSString* token;
@property(nonatomic, strong)NSString* myIDString;
@end

NS_ASSUME_NONNULL_END
