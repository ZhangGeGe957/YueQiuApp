//
//  ArticleModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/25.
//

#import <Foundation/Foundation.h>
#import "ArticleJSONModel.h"

typedef void (^GetModelBlock)(ArticleJSONModel * _Nullable articleModel);
typedef void (^ErrorBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArticleModel : NSObject

@property (nonatomic, strong) NSString* uid;

+ (instancetype)shareManager;
- (void)getMessageWithData:(GetModelBlock)getMessageBlock andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
