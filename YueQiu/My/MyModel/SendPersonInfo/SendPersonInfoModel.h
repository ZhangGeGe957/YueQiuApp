//
//  SendPersonInfoModel.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/23.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data : JSONModel

@end

@interface SendPersonInfoModel : JSONModel
@property (nonatomic, strong) NSString *msg;
//@property (nonatomic, strong) Data *data;
@property NSInteger code;

@end
@interface SendLabelModel : JSONModel
@property (nonatomic, strong) NSString *msg;
@property NSInteger code;
@end
NS_ASSUME_NONNULL_END
