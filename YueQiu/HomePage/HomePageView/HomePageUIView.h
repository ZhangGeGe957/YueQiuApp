//
//  HomePageUIView.h
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePageUIView : UIView
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) NSMutableArray* searchArray;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UISearchController* searchController;


@end

NS_ASSUME_NONNULL_END
