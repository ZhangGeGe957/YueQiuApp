//
//  SendMessageManager.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/13.
//

#import <Foundation/Foundation.h>
#import "SendMessageJSONModel.h"

typedef void (^SendMessageBlock)(SendMessageJSONModel * _Nullable sendMessageModel);
typedef void (^ErrorBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface SendMessageManager : NSObject

@property (nonatomic, strong) NSString *userNumber;

+ (instancetype)shareManager;
- (void)SendMessageWithData:(SendMessageBlock)sendMessageModelBolck andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
