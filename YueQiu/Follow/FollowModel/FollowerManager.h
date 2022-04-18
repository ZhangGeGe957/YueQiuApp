//
//  FolloerManager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import <Foundation/Foundation.h>
#import "FollowerModel.h"
#import "AddAndCancelModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^FollowBlock) (FollowerModel * _Nullable followerModel);
typedef void (^AddBlock) (AddAndCancelModel * _Nullable addModel);
typedef void (^CancelBlock) (AddAndCancelModel * _Nullable cancelModel);
typedef void (^ErrorBlock) (NSError * _Nullable error);
@interface FollowerManager : NSObject

@property (nonatomic, strong) NSString* uid;
@property (nonatomic, strong) NSString* myUid;
@property (nonatomic, strong) NSString* token;
+ (instancetype)shareManager;
//登陆
- (void)getMessageWithData:(FollowBlock)followBlock andError:(ErrorBlock)errorBlock;
- (void)addFollowWithData:(AddBlock)addBlock andError:(ErrorBlock)errorBlock;
- (void)cancelFollowWithData:(CancelBlock)cancelBlock andError:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
