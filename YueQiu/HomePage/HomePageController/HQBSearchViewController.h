//
//  HQBSearchViewController.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/1/29.
//

#import <UIKit/UIKit.h>
#import "HQBSearchView.h"
NS_ASSUME_NONNULL_BEGIN

@interface HQBSearchViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource,
UISearchControllerDelegate,
UISearchResultsUpdating>
@property (nonatomic, strong) HQBSearchView* searchView;
@property (nonatomic, strong) UISearchController* searchController;
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) NSMutableArray* searchArray;
@end

NS_ASSUME_NONNULL_END
