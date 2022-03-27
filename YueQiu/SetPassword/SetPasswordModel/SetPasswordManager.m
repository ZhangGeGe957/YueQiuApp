//
//  SetPasswordManager.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/17.
//

#import "SetPasswordManager.h"
static SetPasswordManager* setPasswordManager = nil;
@implementation SetPasswordManager
+ (instancetype)sharedManager {
    if(!setPasswordManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken,^{
            setPasswordManager = [SetPasswordManager new];
        });
    }
    return setPasswordManager;
}

- (void)ChangePasswordWithData:(SetPasswordSucceedBlock)sendChangedPasswordBlock andError:(ErrorBlock)errorBlock {
    NSString* string = [NSString stringWithFormat:@"http://47.116.14.251:8888/login/forget/%@/%@",self.userNumber, self.passwordNumber];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet] ];
    NSURL* url = [NSURL URLWithString:string];
    NSMutableURLRequest *netWorkDataRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [netWorkDataRequest setHTTPMethod:@"POST"];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:netWorkDataRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            SetPasswordJsonModel* setPasswordModel = [[SetPasswordJsonModel alloc] initWithData:data error:nil];
            sendChangedPasswordBlock(setPasswordModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

@end
