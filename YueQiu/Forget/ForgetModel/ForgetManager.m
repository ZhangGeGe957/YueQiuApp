//
//  ForgetManager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/17.
//

#import "ForgetManager.h"

static ForgetManager* forgetManager = nil;

@implementation ForgetManager
+ (instancetype)sharedManager {
    if(!forgetManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken,^{
            forgetManager = [ForgetManager new];
        });
    }
    return forgetManager;
}

- (void)SendMessageWithData:(ForgetSucceedBlock)sendMessageModelBolck andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/common/sendsms/%@",self.userNumber];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet] ];
    NSURL* url = [NSURL URLWithString:string];
    NSURLRequest *netWorkDataRequest = [NSURLRequest requestWithURL:url];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:netWorkDataRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            ForgetJsonModel* forgetModel = [[ForgetJsonModel alloc] init];
            sendMessageModelBolck(forgetModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
- (void)verifyCodeNumberWithData:(ForgetSucceedBlock)verifyCodeBolck andError:(ErrorBlock)errorBlock {
    
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/common/verify/%@/%@",self.userNumber,self.codeNumber];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet] ];
    NSURL* url = [NSURL URLWithString:string];
    NSURLRequest *netWorkDataRequest = [NSURLRequest requestWithURL:url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:netWorkDataRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            ForgetJsonModel* forgetModel = [[ForgetJsonModel alloc] initWithData:data error:nil];
            verifyCodeBolck(forgetModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}


@end
