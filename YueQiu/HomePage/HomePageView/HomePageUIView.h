//
//  HomePageUIView.h
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import <UIKit/UIKit.h>
#import "HomePageTableViewCell.h"
#import <CoreLocation/CoreLocation.h>

extern NSString *const identityHomePageViewNotice;

NS_ASSUME_NONNULL_BEGIN

@interface HomePageUIView : UIView
<UITableViewDelegate,
UITableViewDataSource, CLLocationManagerDelegate>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIViewController* controller;
@property (nonatomic, strong) UILabel* titleLabel;


@property (nonatomic, copy) NSArray* nameArray;
@property (nonatomic, copy) NSArray* placeArray;
@property (nonatomic, copy) NSArray* distanceArray;
@property (nonatomic, copy) NSArray* typeArray;
@property (nonatomic, copy) NSArray* priceArray;

@property (nonatomic, strong) HomePageTableViewCell *homeCell;
@property (nonatomic, strong) NSMutableDictionary *transDataDictionary;

@property (nonatomic, retain) CLLocationManager *getLocation;  //获取位置信息
@property (nonatomic, strong) CLGeocoder *geoCoder;  //地理信息

@end

NS_ASSUME_NONNULL_END


