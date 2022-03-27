//
//  EditMessageView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/22.
//

#import <UIKit/UIKit.h>
#import "HQBDatePickerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditMessageView : UIView
<UITableViewDelegate,
UITableViewDataSource,
UIPickerViewDelegate,
UIPickerViewDataSource,
PickerDateViewDelegate>
@property (nonatomic, strong)NSMutableArray* menuArray;
@property (nonatomic, strong)NSMutableArray* sexArray;
@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, strong)NSString* nameString;
@property (nonatomic, strong)NSString* birthString;
@property (nonatomic, strong)NSString* emaileString;
@property (nonatomic, strong)NSString* signatureString;
@property NSInteger sex;

@property (nonatomic, strong)UIViewController* viewController;

@property (nonatomic, strong)UIPickerView* sexPickerView;
@property (nonatomic, strong)UIPickerView* datePickerView;
@property (nonatomic, strong)UIView* contentView;


@end

NS_ASSUME_NONNULL_END
