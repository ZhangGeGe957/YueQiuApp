//
//  SendComment.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/5/5.
//

#import "SendComment.h"

static SendComment *manager = nil;

@implementation SendComment

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [SendComment new];
        });
    }
    return manager;
}

- (void)AddCommentWithData:(AddCommentModelBlock)sendCommentBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/article/addComment"];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:self.mobileToken forHTTPHeaderField:@"mobileToken"];
    [request addValue:self.uid forHTTPHeaderField:@"uid"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:self.articleId forKey:@"articleId"];
    [dic setValue:self.comment forKey:@"comment"];
    NSData *dictPhoneData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
    [request setHTTPBody:dictPhoneData];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            AddArticleJSONModel *addMessage = [[AddArticleJSONModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            sendCommentBlock(addMessage);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

- (void)GetCommentWithData:(GetCommentModelBlock)getCommentBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/article/getArticle/%@", self.articleId];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"GET"];
    [request addValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:self.mobileToken forHTTPHeaderField:@"mobileToken"];
    [request addValue:self.uid forHTTPHeaderField:@"uid"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            GetCommentJSONModel *addMessage = [[GetCommentJSONModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            getCommentBlock(addMessage);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
