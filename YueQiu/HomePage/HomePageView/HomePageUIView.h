//
//  HomePageUIView.h
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePageUIView : UIView
<UIScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) NSMutableArray* searchArray;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UISearchController* searchController;
@property (nonatomic, strong) UITableView* stadiumTableView;
@property (nonatomic, strong) UIImageView* imageView;

@property (nonatomic, strong) UILabel* titleLabel;

@property (nonatomic, copy) NSArray* nameArray;
@property (nonatomic, copy) NSArray* placeArray;
@property (nonatomic, copy) NSArray* distanceArray;
@property (nonatomic, copy) NSArray* typeArray;
@property (nonatomic, copy) NSArray* priceArray;
@end

NS_ASSUME_NONNULL_END
