//
//  MyPickerView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;  //选择器
@property (nonatomic, strong) UIButton *cancelButton;  //关闭按钮
@property (nonatomic, strong) UIButton *sureButton;  //确认按钮
@property (nonatomic, strong) NSString *timeString;  //最终的时间

@property NSInteger one;
@property NSInteger two;
@property NSInteger three;
@property NSInteger four;

//判断是否要显示视图
- (void)isShowOnView:(BOOL)select;

@end

NS_ASSUME_NONNULL_END
