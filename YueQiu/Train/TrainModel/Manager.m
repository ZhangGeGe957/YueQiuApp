//
//  Manager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/13.
//

#import "Manager.h"
#import "AFNetworking.h"
static Manager* manager = nil;
@implementation Manager
+ (instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [Manager new];
        });
    }
    return manager;
}
- (void)sendPersonInfoWithData:(GetMessageBlock)getMessageBlock andError:(ErrorBlock)errorBlock {
    self.access_token = [NSString stringWithFormat:@"24.7edc58a8c50a04eeb647b9a0f016ce41.2592000.1652430527.282335-25946737"];
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{@"access_token":self.access_token, @"Content-Type":@"application/x-www-form-urlencoded",@"image":self.imageBase};
    [sessionManager POST:@"https://aip.baidubce.com/rest/2.0/image-classify/v2/advanced_general" parameters:paramDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        Model* model = [[Model alloc] initWithDictionary:responseObject error:nil];
        getMessageBlock(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

@end
