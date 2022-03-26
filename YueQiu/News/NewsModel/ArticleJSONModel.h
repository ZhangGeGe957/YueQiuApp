//
//  ArticleJSONModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/25.
//

@protocol ArticleComment
@end

@protocol ArticleContent
@end

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleComment: JSONModel
@property NSInteger comment_id;
@property (nonatomic, strong) NSString* uid;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* head_sculpture;
@property (nonatomic, strong) NSString* article_id;
@property (nonatomic, strong) NSString* comment;
@property (nonatomic, strong) NSDate *gmt_create;
@end

@interface ArticleContent: JSONModel
@property (nonatomic, strong) NSString* article_id;
@property (nonatomic, strong) NSString* uid;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* head_sculpture;
@property (nonatomic, strong) NSString* article_name;
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSString* address;
@property (nonatomic, strong) NSDate *gmt_create;
@property NSInteger is_delete;
@property (nonatomic, strong) NSArray<ArticleComment> *comment;
@end

@interface ArticleJSONModel: JSONModel
@property (nonatomic, strong) ArticleContent* data;
@property (nonatomic, strong) NSString *msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
