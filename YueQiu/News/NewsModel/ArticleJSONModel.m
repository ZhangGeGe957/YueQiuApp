//
//  ArticleJSONModel.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/25.
//

#import "ArticleJSONModel.h"

@implementation ArticleComment
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation ArticleContent
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation ArticleJSONModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

