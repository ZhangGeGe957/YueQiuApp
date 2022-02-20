//
//  MyView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyView : UIView
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, strong) NSArray* menuArray;

@property (nonatomic, strong) UIViewController* controller;

@end

NS_ASSUME_NONNULL_END
