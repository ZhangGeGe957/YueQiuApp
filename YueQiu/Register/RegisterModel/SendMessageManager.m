//
//  SendMessageManager.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/13.
//

#import "SendMessageManager.h"

static SendMessageManager* manager = nil;

@implementation SendMessageManager

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [SendMessageManager new];
            
        });
    }
    return manager;
}

- (void)SendMessageWithData:(SendMessageBlock)sendMessageModelBolck andError:(ErrorBlock)errorBlock {
    NSString *json = [[NSString alloc] initWithFormat:@"http://47.116.14.251:8888/login/sendsms/%@", self.userNumber];
    json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *netWorkDataURL = [NSURL URLWithString:json];
    NSURLRequest *netWorkDataRequest = [NSURLRequest requestWithURL:netWorkDataURL];
    NSURLSession *netWorkDataSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *netWorkDataTask = [netWorkDataSession dataTaskWithRequest:netWorkDataRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            SendMessageJSONModel *getMessage = [[SendMessageJSONModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            sendMessageModelBolck(getMessage);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [netWorkDataTask resume];
}

@end