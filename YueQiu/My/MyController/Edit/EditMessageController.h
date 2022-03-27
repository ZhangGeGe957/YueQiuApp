//
//  EditMessageController.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/22.
//

#import <UIKit/UIKit.h>
#include "EditMessageView.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditMessageController : UIViewController
@property (nonatomic, strong)EditMessageView* editMessageView;
@property (nonatomic, strong)NSString* uid;
@property (nonatomic, strong)NSString* token;
@property (nonatomic, strong)NSString* nameString;
@property (nonatomic, strong)NSString* birthString;
@property (nonatomic, strong)NSString* emaileString;
@property (nonatomic, strong)NSString* signatureString;
@property NSInteger sex;
@end

NS_ASSUME_NONNULL_END
