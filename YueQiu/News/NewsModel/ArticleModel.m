//
//  ArticleModel.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/25.
//

#import "ArticleModel.h"

static ArticleModel* manager = nil;

@implementation ArticleModel

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [ArticleModel new];
        });
    }
    return manager;
}

- (void)getMessageWithData:(GetModelBlock)getMessageBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/article/getArticle/%@", self.uid];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"POST"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            ArticleJSONModel *getMessage = [[ArticleJSONModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            getMessageBlock(getMessage);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
