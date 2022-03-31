//
//  AddArticleJSONModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface AddArticleJSONModel : JSONModel

@property (nonatomic, strong) NSString *msg;
@property NSInteger code;

@end

NS_ASSUME_NONNULL_END
