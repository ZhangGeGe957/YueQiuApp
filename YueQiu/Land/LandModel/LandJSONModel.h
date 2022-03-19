//
//  LandJSONModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/19.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LandJSONModel : JSONModel

@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) NSString *msg;
@property NSInteger code;

@end

NS_ASSUME_NONNULL_END
