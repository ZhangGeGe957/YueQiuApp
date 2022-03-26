//
//  LogoffManager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/26.
//

#import "LogoffManager.h"
static LogoffManager* manager = nil;
@implementation LogoffManager
+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [LogoffManager new];
        });
    }
    return manager;
}

- (void)LogoffWithData:(LogoffBlock)logoffBlock andError:(ErrorBlock)errorBlock {
    NSString* urlString = [NSString stringWithFormat:@"http://47.116.14.251:8888/login/logoff/%@", self.token];
    NSURL* url = [NSURL URLWithString:urlString];
    NSMutableURLRequest* mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"POST"];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:mutableRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            LogoffModel* logoffModel = [[LogoffModel alloc] initWithData:data error:nil];
            logoffBlock(logoffModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
