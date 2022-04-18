//
//  FolloerManager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import "FollowerManager.h"

static FollowerManager* manager = nil;
@implementation FollowerManager

+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [FollowerManager new];
        });
    }
    return manager;
}


- (void)getMessageWithData:(FollowBlock)followBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/info/getInfo/%@",self.uid];
    
    NSURL* urlString = [NSURL URLWithString:string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"GET"];
    
    [request addValue:self.token forHTTPHeaderField:@"mobileToken"];
    [request addValue:self.myUid forHTTPHeaderField:@"uid"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            FollowerModel* followerModel = [[FollowerModel alloc] initWithData:data error:nil];
            //使用Block传值将值传回去
            followBlock(followerModel);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

- (void)addFollowWithData:(AddBlock)addBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/relation/follow/%@",self.uid];
    
    NSURL* urlString = [NSURL URLWithString:string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"POST"];
    
    [request addValue:self.token forHTTPHeaderField:@"mobileToken"];
    [request addValue:self.myUid forHTTPHeaderField:@"uid"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            AddAndCancelModel* addModel = [[AddAndCancelModel alloc] initWithData:data error:nil];
            addBlock(addModel);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
- (void)cancelFollowWithData:(CancelBlock)cancelBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/relation/cancelFollow/%@",self.uid];
    
    NSURL* urlString = [NSURL URLWithString:string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    [request setHTTPMethod:@"POST"];
    
    [request addValue:self.token forHTTPHeaderField:@"mobileToken"];
    [request addValue:self.myUid forHTTPHeaderField:@"uid"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            AddAndCancelModel* cancelModel = [[AddAndCancelModel alloc] initWithData:data error:nil];
            cancelBlock(cancelModel);
        } else {
            //使用Block传值将值传回去
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
