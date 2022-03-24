//
//  GetMessageManager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/23.
//

#import "GetMessageManager.h"
static GetMessageManager* manager = nil;
@implementation GetMessageManager

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [GetMessageManager new];
        });
    }
    return manager;
}


- (void)getMessageWithData:(GetMessageBlock)getMessageBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/info/getinfo/%@", self.uid];
    
    NSURL* urlString = [NSURL URLWithString:string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    request.HTTPMethod = @"POST";
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            GetMessageModel *getMessage = [[GetMessageModel alloc] initWithData:data error:nil];
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
