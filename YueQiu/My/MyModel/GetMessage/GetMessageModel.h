//
//  GetMessageModel.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/23.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data : JSONModel
@property (nonatomic, strong) NSString* uid;
@property (nonatomic, strong) NSString* phone_numbers;
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* signature;
@property (nonatomic, strong) NSString* label;//标签/爱好
@property NSInteger sex;
@property (nonatomic, strong) NSString* email;//邮箱
@property (nonatomic, strong) NSString* birthday;//生日
@property (nonatomic, strong) NSString* headSculpture;//头像
@property (nonatomic, strong) NSString* background;//背景
@property int isFollow;  //判断是否关注，未关注为0，已关注为1，用户本人为2
@end

@interface GetMessageModel : JSONModel
@property (nonatomic, strong) Data* data;
@property (nonatomic, strong) NSString *msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
