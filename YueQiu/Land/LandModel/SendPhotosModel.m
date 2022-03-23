//
//  SendPhotosModel.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/23.
//

#import "SendPhotosModel.h"

static SendPhotosModel* manager = nil;

@implementation SendPhotosModel

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [SendPhotosModel new];
            
        });
    }
    return manager;
}

- (void)SendPhotosWithData:(SendPhotosBlock)sendPhotosModelBlock andError:(ErrorBlock)errorBlock {
    NSString *tempString = [[NSString alloc] initWithFormat:@"http://47.116.14.251:8888/info/%@/%@", self.transString, self.onlyUid];
    NSLog(@"%@", tempString);
    NSURL *url = [NSURL URLWithString:tempString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    //-------------
    //声明结束符：--thisend--
    NSString *end = [[NSString alloc]initWithFormat:@"--thisend--"];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData = [[NSMutableData alloc] init];
    //将image的data加入
    [myRequestData appendData:self.sendPhotosFile];
    //加入结束符--thisend--
    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    //设置HTTPHeader中Content-Type的值
    NSString *content = [[NSString alloc] initWithFormat:@"multipart/form-data; boundary=%@", end];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //-------------
    NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:self.sendPhotosFile options:0 error:nil]);
    NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:myRequestData options:0 error:nil]);
    [request setHTTPBody:myRequestData];
    [request setHTTPMethod:@"POST"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            SendPhotosJSONModel *getMessage = [[SendPhotosJSONModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            sendPhotosModelBlock(getMessage);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
