//
//  AddArticleModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import <Foundation/Foundation.h>
#import "AddArticleJSONModel.h"

typedef void (^AddModelBlock)(AddArticleJSONModel * _Nullable addArticleModel);
typedef void (^ErrorBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface AddArticleModel : NSObject

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *article_name;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *address;

+ (instancetype)shareManager;
- (void)AddArticleWithData:(AddModelBlock)getMessageBlock andError:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
