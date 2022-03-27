//
//  AddArticleModel.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import "AddArticleModel.h"

static AddArticleModel *manager = nil;

@implementation AddArticleModel

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [AddArticleModel new];
        });
    }
    return manager;
}

- (void)AddArticleWithData:(AddModelBlock)getMessageBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/article/addArticle"];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:self.mobileToken forHTTPHeaderField:@"mobileToken"];
    [request addValue:self.uid forHTTPHeaderField:@"uid"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:self.content forKey:@"content"];
    [dic setValue:self.address forKey:@"address"];
    [dic setValue:self.time forKey:@"time"];
    NSData *dictPhoneData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
    [request setHTTPBody:dictPhoneData];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            AddArticleJSONModel *addMessage = [[AddArticleJSONModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            getMessageBlock(addMessage);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
