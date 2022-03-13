//
//  SendMessageJSONModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/13.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SendMessageJSONModel : JSONModel

@property (nonatomic, strong) NSString *msg;
@property NSInteger code;

@end

NS_ASSUME_NONNULL_END
