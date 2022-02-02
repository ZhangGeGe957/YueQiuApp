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

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIViewController* controller;
@property (nonatomic, strong) UILabel* titleLabel;


@property (nonatomic, copy) NSArray* nameArray;
@property (nonatomic, copy) NSArray* placeArray;
@property (nonatomic, copy) NSArray* distanceArray;
@property (nonatomic, copy) NSArray* typeArray;
@property (nonatomic, copy) NSArray* priceArray;

@end

NS_ASSUME_NONNULL_END
