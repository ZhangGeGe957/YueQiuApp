//
//  LogoffModel.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/26.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LogoffModel : JSONModel
@property(nonatomic, strong) NSString* msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
