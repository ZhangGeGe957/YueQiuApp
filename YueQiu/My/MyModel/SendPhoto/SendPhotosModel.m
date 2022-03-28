//
//  SendPhotosModel.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/23.
//

#import "SendPhotosModel.h"
#import "AFNetworking.h"

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
    NSString *tempString = [[NSString alloc] initWithFormat:@"http://47.116.14.251:8888/info/%@", self.transPhotosType];
    NSMutableString *myString = [[NSMutableString alloc] init];
    if ([self.transPhotosType isEqualToString:@"updateBack"]) {
        myString = [[NSMutableString alloc] initWithString:@"background"];
    } else {
        myString = [[NSMutableString alloc] initWithString:@"headSculpture"];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.token forKey:@"mobileToken"];
    [dict setValue:self.onlyUid forKey:@"uid"];
    [manager POST:tempString parameters:nil headers:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        [formData appendPartWithFileData:self.sendPhotosFile name:myString fileName:fileName mimeType:@"image/png"];
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传成功 %@", responseObject);
        
        SendPhotosJSONModel *getMessage = [[SendPhotosJSONModel alloc] init];
        getMessage.data = responseObject[@"data"];
        getMessage.code = 200;
        getMessage.msg = responseObject[@"msg"];
        sendPhotosModelBlock(getMessage);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
