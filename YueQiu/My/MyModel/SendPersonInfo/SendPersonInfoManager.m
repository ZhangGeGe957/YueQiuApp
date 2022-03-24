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
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/info/updateothers"];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest* mutableRequest = [[NSMutableURLRequest alloc] initWithURL:urlString];
    [mutableRequest setHTTPMethod:@"POST"];
    NSNumber *codeTest = [NSNumber numberWithInteger:self.sex];
//    NSDictionary *dict = @{@"uid":self.uidString, @"username":self.labelString, @"signature":self.signatureString, @"sex":codeTest, @"email":self.emaileString, @"birthday":self.birthString};
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:self.uidString,@"uid", self.labelString,@"username", self.signatureString, @"signature", codeTest, @"sex", self.emaileString,@"email", self.birthString, @"birthday", nil];
    NSData *dictPhoneData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    [mutableRequest setHTTPBody:dictPhoneData];
//    [mutableRequest addValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    
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
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/info/updatelabel"];
    NSURL* urlString = [NSURL URLWithString:string];
    NSMutableURLRequest* mutableRequest = [[NSMutableURLRequest alloc] initWithURL:urlString];
    [mutableRequest setHTTPMethod:@"POST"];
//    NSDictionary *dict = @{@"uid":self.uidString, @"label":self.labelString};
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:self.uidString, @"uid", self.labelString, @"label", nil];
    NSData *dictPhoneData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    [mutableRequest setHTTPBody:dictPhoneData];
//    [mutableRequest addValue:@"application/json;UTF-8" forHTTPHeaderField:@"Content-Type"];
    
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
