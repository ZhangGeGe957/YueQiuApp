//
//  HomePageUIView.h
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import <UIKit/UIKit.h>
#import "HomePageTableViewCell.h"


extern NSString *const identityHomePageViewNotice;

NS_ASSUME_NONNULL_BEGIN

@interface HomePageUIView : UIView
<UITableViewDelegate,
UITableViewDataSource,
MAMapViewDelegate>


@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIViewController* controller;
@property (nonatomic, strong) UILabel* titleLabel;

@property (nonatomic, strong) NSMutableArray* locationArray;
@property (nonatomic, strong) NSMutableArray* nameArray;
@property (nonatomic, strong) NSMutableArray* placeArray;
@property (nonatomic, strong) NSMutableArray* distanceArray;
@property (nonatomic, strong) NSMutableArray* typeArray;
@property (nonatomic, strong) NSMutableArray* priceArray;

@property (nonatomic, strong) HomePageTableViewCell *homeCell;
@property (nonatomic, strong) NSMutableDictionary *transDataDictionary;

@end

NS_ASSUME_NONNULL_END
