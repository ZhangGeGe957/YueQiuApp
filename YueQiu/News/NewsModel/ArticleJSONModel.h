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
@property NSInteger commentId;
@property (nonatomic, strong) NSString* uid;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* headSculpture;
@property (nonatomic, strong) NSString* articleId;
@property (nonatomic, strong) NSString* comment;
@property (nonatomic, strong) NSString *gmtCreate;
@end

@interface ArticleContent: JSONModel
@property (nonatomic, strong) NSString* articleId;
@property (nonatomic, strong) NSString* uid;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* headSculpture;
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSString* address;
@property (nonatomic, strong) NSString* time;
@property (nonatomic, strong) NSString *gmtCreate;
@property NSInteger state;  //是否结束
@property (nonatomic, strong) NSArray<ArticleComment> *comment;
@end

@interface ArticleJSONModel: JSONModel
@property (nonatomic, strong) NSArray<ArticleContent> *data;
@property (nonatomic, strong) NSString *msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
