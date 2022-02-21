//
//  SettingView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSArray* array;
@end

NS_ASSUME_NONNULL_END
