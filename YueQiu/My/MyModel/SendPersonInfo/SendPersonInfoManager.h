//
//  SendPersonInfoManager.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/23.
//

#import <Foundation/Foundation.h>
#import "SendPersonInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^SendPersonInfoBlock) (SendPersonInfoModel * _Nullable sendPersonInfoModel);
typedef void (^SendLabelBlock) (SendLabelModel * _Nullable sendLabelModel);
typedef void (^ErrorBlock) (NSError * _Nullable error);
@interface SendPersonInfoManager : NSObject

@property (nonatomic, strong)NSString* uidString;
@property (nonatomic, strong)NSString* nameString;
@property (nonatomic, strong)NSString* birthString;
@property (nonatomic, strong)NSString* emaileString;
@property (nonatomic, strong)NSString* signatureString;
@property (nonatomic, strong)NSString* labelString;
@property NSInteger sex;

+ (instancetype)shareManager;

- (void)sendPersonInfoWithData:(SendPersonInfoBlock)sendPersonInfoBlock andError:(ErrorBlock)errorBlock;
- (void)sendLabelWithData:(SendLabelBlock)sendLabelBlock andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
