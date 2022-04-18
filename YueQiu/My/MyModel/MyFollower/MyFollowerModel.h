//
//  MyFollowerModel.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

@protocol Data
@end
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data : JSONModel
@property(nonatomic, strong)NSString* uid;
@property(nonatomic, strong)NSString* username;
@property(nonatomic, strong)NSString* headSculpture;
@end

@interface MyFollowerModel : JSONModel
@property(nonatomic, strong) NSArray<Data> *data;
@property(nonatomic, strong) NSString* msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
