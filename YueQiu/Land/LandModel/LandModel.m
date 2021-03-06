//
//  LandModel.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/19.
//

#import "LandModel.h"

static LandModel* manager = nil;

@implementation LandModel

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [LandModel new];
            
        });
    }
    return manager;
}

- (void)LandAccountWithData:(LandAccountBlock)LandModelBolck andError:(ErrorBlock)errorBlock {
    NSString *json = [[NSString alloc] initWithFormat:@"http://47.116.14.251:8888/login/logon/%@/%@/%@", self.userNumber, self.passwordNumber, self.tokenNumber];
    json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *netWorkDataURL = [NSURL URLWithString:json];
    NSMutableURLRequest *netWorkDataRequest = [NSMutableURLRequest requestWithURL:netWorkDataURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [netWorkDataRequest setHTTPMethod:@"POST"];
    NSURLSession *netWorkDataSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *netWorkDataTask = [netWorkDataSession dataTaskWithRequest:netWorkDataRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            
            LandJSONModel *getMessage = [[LandJSONModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            LandModelBolck(getMessage);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [netWorkDataTask resume];
}

- (void)detectLoginWithData:(DetectLoginBlock)detectLoginBlock andError:(ErrorBlock)errorBlock {
    NSString* urlString = [NSString stringWithFormat:@"http://47.116.14.251:8888/login/state/%@", self.tokenNumber];
    NSURL* url = [NSURL URLWithString:urlString];
    NSMutableURLRequest* mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"POST"];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:mutableRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            DetectLoginModel* detectLoginModel = [[DetectLoginModel alloc] initWithData:data error:nil];
            detectLoginBlock(detectLoginModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
