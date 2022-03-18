//
//  ForgetJsonModel.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/17.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForgetJsonModel : JSONModel
@property (nonatomic, copy) NSString* msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
