//
//  HQBDatePickerView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/22.
//

#import "HQBPickerView.h"

NS_ASSUME_NONNULL_BEGIN
@class HQBPickerView;
@protocol  PickerDateViewDelegate<NSObject>
- (void)pickerDateView:(HQBPickerView *)pickerDateView selectYear:(NSInteger)year selectMonth:(NSInteger)month selectDay:(NSInteger)day;

@end
@interface HQBDatePickerView : HQBPickerView
<UIPickerViewDelegate,
UIPickerViewDataSource>
@property(nonatomic, weak)id <PickerDateViewDelegate>delegate ;

/** 选择的年 */
@property (nonatomic, assign)NSInteger selectYear;
/** 选择的月 */
@property (nonatomic, assign)NSInteger selectMonth;
/** 选择的日 */
@property (nonatomic, assign)NSInteger selectDay;

@property (nonatomic, assign)NSInteger currentYear;
@property (nonatomic, assign)NSInteger currentMonth;
@property (nonatomic, assign)NSInteger currentDay;
@property (nonatomic, assign)NSInteger defaultYear;
@property (nonatomic, assign)NSInteger defaultMonth;
@property (nonatomic, assign)NSInteger defaultDay;

@property (nonatomic, assign)NSInteger minShowYear;

@property (nonatomic, assign)NSInteger yearSum;

-(void)setDefaultTSelectYear:(NSInteger)defaultSelectYear defaultSelectMonth:(NSInteger)defaultSelectMonth defaultSelectDay:(NSInteger)defaultSelectDay;
@end

NS_ASSUME_NONNULL_END
