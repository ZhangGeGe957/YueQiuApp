//
//  SendPersonInfoManager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/23.
//

#import "SendPersonInfoManager.h"
static SendPersonInfoManager *manager = nil;
@implementation SendPersonInfoManager
+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [SendPersonInfoManager new];
        });
    }
    return manager;
}

- (void)sendPersonInfoWithData:(SendPersonInfoBlock)sendPersonInfoBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/info/updateOthers"];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest* mutableRequest = [[NSMutableURLRequest alloc] initWithURL:urlString];
    [mutableRequest setHTTPMethod:@"POST"];
    [mutableRequest addValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    [mutableRequest addValue:self.token forHTTPHeaderField:@"mobileToken"];
    [mutableRequest addValue:self.uidString forHTTPHeaderField:@"uid"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.birthString forKey:@"birthday"];
    [dict setValue:self.emaileString forKey:@"email"];
    [dict setValue:@(self.sex) forKey:@"sex"];
    [dict setValue:self.signatureString forKey:@"signature"];
    [dict setValue:self.nameString forKey:@"username"];
    NSData *dictPhoneData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:dictPhoneData options:0 error:nil]);
    [mutableRequest setHTTPBody:dictPhoneData];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:mutableRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            SendPersonInfoModel* sendPersonInfo = [[SendPersonInfoModel alloc] initWithData:data error:nil];
            sendPersonInfoBlock(sendPersonInfo);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
    
}
- (void)sendLabelWithData:(SendLabelBlock)sendLabelBlock andError:(ErrorBlock)errorBlock  {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/info/updateLabel"];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest* mutableRequest = [[NSMutableURLRequest alloc] initWithURL:urlString];
    [mutableRequest addValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    [mutableRequest addValue:self.token forHTTPHeaderField:@"mobileToken"];
    [mutableRequest addValue:self.uidString forHTTPHeaderField:@"uid"];
    [mutableRequest setHTTPMethod:@"POST"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.uidString forKey:@"uid"];
    [dict setValue:self.labelString forKey:@"label"];
    NSData *dictPhoneData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    [mutableRequest setHTTPBody:dictPhoneData];
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:mutableRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            SendLabelModel* sendLabel = [[SendLabelModel alloc] initWithData:data error:nil];
            sendLabelBlock(sendLabel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
