//
//  AddAndCancelModel.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/17.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddAndCancelModel : JSONModel
@property(nonatomic, strong) NSString* msg;
@property NSInteger code;
@end

NS_ASSUME_NONNULL_END
