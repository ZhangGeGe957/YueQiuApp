//
//  SetPasswordManager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/17.
//

#import <Foundation/Foundation.h>
#include "SetPasswordJsonModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^SetPasswordSucceedBlock)(SetPasswordJsonModel * _Nonnull setPasswordModel);
typedef void (^ErrorBlock)(NSError * _Nonnull error);

@interface SetPasswordManager : NSObject

//电话号码
@property (nonatomic, strong) NSString *userNumber;
//新密码
@property (nonatomic, strong) NSString *passwordNumber;

+ (instancetype)sharedManager;
- (void)ChangePasswordWithData:(SetPasswordSucceedBlock)sendChangedPasswordBlock andError:(ErrorBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
