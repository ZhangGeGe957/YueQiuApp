//
//  Manager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/13.
//

#import <Foundation/Foundation.h>
#import "Model.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^GetMessageBlock) (Model * _Nullable getMessageModel);

typedef void (^ErrorBlock) (NSError * _Nullable error);

@interface Manager : NSObject

@property (nonatomic, strong) NSString *imageBase;
@property (nonatomic, strong) NSString *access_token;
+ (instancetype)shareManager;
- (void)sendPersonInfoWithData:(GetMessageBlock)getMessageBlock andError:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
