//
//  ForgetManager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/17.
//

#import <Foundation/Foundation.h>
#include "ForgetJsonModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^ForgetSucceedBlock)(ForgetJsonModel * _Nonnull forgetModel);
typedef void (^ErrorBlock)(NSError * _Nonnull error);

@interface ForgetManager : NSObject

//电话号码
@property (nonatomic, strong) NSString *userNumber;

//验证码
@property (nonatomic, strong) NSString *codeNumber;

+ (instancetype)sharedManager;
//发送短信验证码
- (void)SendMessageWithData:(ForgetSucceedBlock)sendMessageModelBolck andError:(ErrorBlock)errorBlock;

- (void)verifyCodeNumberWithData:(ForgetSucceedBlock)verifyCodeBolck andError:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
