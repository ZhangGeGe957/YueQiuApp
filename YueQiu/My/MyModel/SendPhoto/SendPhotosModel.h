//
//  SendPhotosModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/23.
//

#import <Foundation/Foundation.h>
#import "SendPhotosJSONModel.h"

typedef void (^SendPhotosBlock)(SendPhotosJSONModel * _Nullable sendPhotosModel);
typedef void (^ErrorBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface SendPhotosModel : NSObject

@property (nonatomic, strong) NSString *onlyUid;  //唯一标识
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSData *sendPhotosFile;  //图片的二进制流
@property (nonatomic, strong) NSString *transPhotosType;  //传输图片的类型
@property (nonatomic, strong) NSString *savedImagePath;  //图片的路径
+ (instancetype)shareManager;
//登陆
- (void)SendPhotosWithData:(SendPhotosBlock)sendPhotosModelBlock andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
