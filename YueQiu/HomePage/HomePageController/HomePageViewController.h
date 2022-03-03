//
//  HomePageViewController.h
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import <UIKit/UIKit.h>
#import "HomePageUIView.h"
#import <CoreLocation/CoreLocation.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

extern NSString *const identityHomePageControllerNotice;

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewController : UIViewController
<CLLocationManagerDelegate,
AMapSearchDelegate>

@property (strong, nonatomic) CLLocationManager *locManager;
@property (nonatomic) AMapSearchAPI* search;
@property (nonatomic, strong) HomePageUIView* homePageView;
@property (nonatomic, retain) CLLocationManager *getLocation;  //获取位置信息
@property (nonatomic, strong) CLGeocoder *geoCoder;  //地理信息
@property (nonatomic, retain) CLLocation *myLocation;  //我的位置
@property (nonatomic, strong) NSMutableArray *locationArray;  //地点位置
@property (nonatomic, strong) NSMutableArray *distanceArray;  //计算距离

@end

NS_ASSUME_NONNULL_END
