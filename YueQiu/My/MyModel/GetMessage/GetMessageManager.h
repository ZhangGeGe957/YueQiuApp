//
//  GetMessageManager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/23.
//

#import <Foundation/Foundation.h>
#import "GetMessageModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^GetMessageBlock) (GetMessageModel * _Nullable getMessageModel);
typedef void (^ErrorBlock) (NSError * _Nullable error);
@interface GetMessageManager : NSObject

@property (nonatomic, strong) NSString* uid;

+ (instancetype)shareManager;
//登陆
- (void)getMessageWithData:(GetMessageBlock)getMessageBlock andError:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
