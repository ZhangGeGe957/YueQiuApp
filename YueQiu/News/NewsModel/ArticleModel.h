//
//  ArticleModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/25.
//

#import <Foundation/Foundation.h>
#import "ArticleJSONModel.h"
#import "AddArticleJSONModel.h"

typedef void (^GetModelBlock)(ArticleJSONModel * _Nullable articleModel);
typedef void (^MessageModelBlock)(AddArticleJSONModel * _Nullable returnMessageModel);
typedef void (^ErrorBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArticleModel : NSObject

@property (nonatomic, strong) NSString *mobileToken;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *articleId;

+ (instancetype)shareManager;
- (void)getMessageWithData:(GetModelBlock)getMessageBlock andError:(ErrorBlock)errorBlock;
- (void)delectMessageWithData:(MessageModelBlock)returnMessageBlock andError:(ErrorBlock)errorBlock;
- (void)getMyAllData:(GetModelBlock)getMessageBlock andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
