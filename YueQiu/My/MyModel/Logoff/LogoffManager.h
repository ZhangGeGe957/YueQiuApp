//
//  LogoffManager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/26.
//

#import <Foundation/Foundation.h>
#import "LogoffModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^LogoffBlock)(LogoffModel * _Nullable logoffModel);
typedef void(^ErrorBlock)(NSError * _Nullable errorBlock);
@interface LogoffManager : NSObject

@property (nonatomic, strong) NSString* token;

+ (instancetype)shareManager;

- (void)LogoffWithData:(LogoffBlock)logoffBlock andError:(ErrorBlock)errorBlock;


@end

NS_ASSUME_NONNULL_END
