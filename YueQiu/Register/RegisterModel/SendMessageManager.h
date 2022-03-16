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

//电话号码
@property (nonatomic, strong) NSString *userNumber;
//密码
@property (nonatomic, strong) NSString *passwordNumber;
//验证码
@property (nonatomic, strong) NSString *codeNumber;


+ (instancetype)shareManager;
//发送短信验证码
- (void)SendMessageWithData:(SendMessageBlock)sendMessageModelBolck andError:(ErrorBlock)errorBlock;
//发送注册的账号信息
- (void)ConfirmAccountWithData:(SendMessageBlock)confirmAccountModelBlock andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
