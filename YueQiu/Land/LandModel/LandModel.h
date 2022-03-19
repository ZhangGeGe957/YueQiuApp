//
//  LandModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/19.
//

#import <Foundation/Foundation.h>
#import "LandJSONModel.h"

typedef void (^LandAccountBlock)(LandJSONModel * _Nullable LandAccountModel);
typedef void (^ErrorBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface LandModel : NSObject

//电话号码
@property (nonatomic, strong) NSString *userNumber;
//密码
@property (nonatomic, strong) NSString *passwordNumber;
//设备码
@property (nonatomic, strong) NSString *tokenNumber;


+ (instancetype)shareManager;
//登陆
- (void)LandAccountWithData:(LandAccountBlock)LandModelBolck andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
