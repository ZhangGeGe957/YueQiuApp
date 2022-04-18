//
//  MyFollowerManager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

#import <Foundation/Foundation.h>
#import "MyFollowerModel.h"
#import "CancelFollowModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^GetFollowerBlock) (MyFollowerModel * _Nullable myFollowerModel);
typedef void (^CancelFollowBlock) (CancelFollowModel * _Nullable cancelFollowModel);
typedef void (^ErrorBlock) (NSError * _Nullable error);

@interface MyFollowerManager : NSObject
@property(nonatomic, strong)NSString* uid;
@property(nonatomic, strong)NSString* mobileToken;
@property(nonatomic, strong)NSString* otherUid;
+ (instancetype)shareManager;

- (void)getFollowerWithData:(GetFollowerBlock)getFollowerBlock andError:(ErrorBlock)errorBlock;
- (void)cancelFollowWithData:(CancelFollowBlock)cancelBlock andError:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
