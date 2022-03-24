//
//  SendPhotosJSONModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/23.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SendPhotosJSONModel : JSONModel

@property (nonatomic, strong) NSURL *data;
@property (nonatomic, strong) NSString *msg;
@property NSInteger code;

@end

NS_ASSUME_NONNULL_END
