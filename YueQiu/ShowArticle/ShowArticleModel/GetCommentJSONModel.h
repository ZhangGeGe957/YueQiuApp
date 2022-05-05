//
//  GetCommentJSONModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/5/5.
//

#import "JSONModel.h"
#import "ArticleJSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetCommentJSONModel : JSONModel
@property (nonatomic, strong) ArticleContent *data;
@property (nonatomic, strong) NSString *msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
