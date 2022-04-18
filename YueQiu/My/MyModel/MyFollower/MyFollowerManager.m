//
//  MyFollowerManager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

#import "MyFollowerManager.h"
static MyFollowerManager* manager = nil;
@implementation MyFollowerManager
+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [MyFollowerManager new];
        });
    }
    return manager;
}


- (void)getFollowerWithData:(GetFollowerBlock)getFollowerBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/relation/getFollow"];
    NSURL* url = [NSURL URLWithString:string];
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"GET"];
    
    [mutableRequest addValue:self.mobileToken forHTTPHeaderField:@"mobileToken"];
    [mutableRequest addValue:self.uid forHTTPHeaderField:@"uid"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:mutableRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            MyFollowerModel* myFollower = [[MyFollowerModel alloc] initWithData:data error:nil];
            getFollowerBlock(myFollower);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

- (void)cancelFollowWithData:(CancelFollowBlock)cancelFollowBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/relation/cancelFollow/%@",self.otherUid];
    
    NSURL* urlString = [NSURL URLWithString:string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"POST"];
    
    [request addValue:self.mobileToken forHTTPHeaderField:@"mobileToken"];
    [request addValue:self.uid forHTTPHeaderField:@"uid"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            CancelFollowModel* cancelFollowModel = [[CancelFollowModel alloc] initWithData:data error:nil];
            cancelFollowBlock(cancelFollowModel);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
