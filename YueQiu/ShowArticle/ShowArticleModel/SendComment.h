//
//  SendComment.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/5/5.
//

#import <Foundation/Foundation.h>
#import "AddArticleJSONModel.h"
#import "GetCommentJSONModel.h"

typedef void (^AddCommentModelBlock)(AddArticleJSONModel * _Nullable addCommentModel);
typedef void (^GetCommentModelBlock)(GetCommentJSONModel * _Nullable addCommentModel);
typedef void (^ErrorBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface SendComment : NSObject

@property (nonatomic, strong) NSString *mobileToken;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *articleId;
@property (nonatomic, strong) NSString *comment;

+ (instancetype)shareManager;
- (void)AddCommentWithData:(AddCommentModelBlock)sendCommentBlock andError:(ErrorBlock)errorBlock;
- (void)GetCommentWithData:(GetCommentModelBlock)getCommentBlock andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
