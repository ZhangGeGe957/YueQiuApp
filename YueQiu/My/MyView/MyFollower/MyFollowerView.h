//
//  MyFollowerView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyFollowerView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic, strong)UITableView* tableView;
@property(nonatomic, strong)NSMutableArray* dataArray;
@end

NS_ASSUME_NONNULL_END
