//
//  EditController.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditController : UIViewController
<UITextViewDelegate>
@property (nonatomic, strong)NSString* titleString;
@property (nonatomic, strong)NSString* valueString;

@property (nonatomic, strong)UITextView* textView;

@property(nonatomic,strong)UILabel *placeHolderLabel;
@property(nonatomic,strong)UILabel *residueLabel;// 输入文本时剩余字数

@end

NS_ASSUME_NONNULL_END
