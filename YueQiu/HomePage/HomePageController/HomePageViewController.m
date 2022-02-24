//
//  HomePageViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "HomePageViewController.h"
#import "Masonry.h"
#import "HQBSearchViewController.h"
#import "ReserveViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

NSString *const identityHomePageControllerNotice = @"homePage";

@interface HomePageViewController ()

@property (nonatomic, strong) ReserveViewController *reserveView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化数据
    [self p_initAllData];
    
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem* search = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sousuo.png"] style:UIBarButtonItemStylePlain target:self action:@selector(touchSearch)];
    search.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = search;
    
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.layer.cornerRadius = 20;
    leftButton.layer.masksToBounds = YES;
    [leftButton setImage:[UIImage imageNamed:@"head的副本.jpeg"] forState:UIControlStateNormal];
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //注册通知
    [self registrationNotice];
    
    //获取用户位置
    [self getMoreInformation];
    
    //初始化界面
    self.homePageView = [[HomePageUIView alloc] initWithFrame:CGRectMake(0, 0, W, H - [self hGetTabHeight] - [self hGetStatusbarHeight])];
    [self.view addSubview:self.homePageView];
}

- (float)hGetStatusbarHeight {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *hStatusBarManager =  windowScene.statusBarManager;
    return hStatusBarManager.statusBarFrame.size.height;
}

//获取导航栏高度
- (float)hGetNavigationbarHeight {
    return self.navigationController.navigationBar.frame.size.height;
}
//获取tabBar的高度
- (float)hGetTabHeight {
    return self.tabBarController.tabBar.frame.size.height;
}

- (void)touchSearch {
    HQBSearchViewController* searchController = [[HQBSearchViewController alloc] init];
    [self.navigationController pushViewController:searchController animated:YES];
}
- (void)touchHead {
    
}

//注册通知
- (void)registrationNotice {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homePageNoticeEvent:) name:identityHomePageControllerNotice object:nil];
}
- (void)homePageNoticeEvent:(NSNotification *)sender {
    self.reserveView = [[ReserveViewController alloc] init];
    self.reserveView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:self.reserveView animated:YES completion:nil];
}

//一个获取位置信息函数
- (void)getMoreInformation {
    self.getLocation = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        self.getLocation.delegate = self;
        //精确度获取到米
        self.getLocation.desiredAccuracy = kCLLocationAccuracyBest;
        //设置过滤器为无
        self.getLocation.distanceFilter = kCLDistanceFilterNone;
        // 取得定位权限，有两个方法，取决于你的定位使用情况
        //一个是requestAlwaysAuthorization，一个是requestWhenInUseAuthorization
        // 这句话ios8以上版本使用。
        [self.getLocation requestWhenInUseAuthorization];
        //开始获取定位
        [self.getLocation startUpdatingLocation];
        //地理信息
        self.geoCoder = [[CLGeocoder alloc] init];
    } else {
        NSLog(@"error");
    }
}
//设置获取位置信息的代理方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%lu", (unsigned long)locations.count);
    self.myLocation = locations.lastObject;
    NSLog(@"经度：%f 纬度：%f", _myLocation.coordinate.longitude, _myLocation.coordinate.latitude);
    
    //计算距离
    CLLocation *before = [[CLLocation alloc] initWithLatitude:39.91667 longitude:116.41667];
    CLLocationDistance meters = [self.myLocation distanceFromLocation:before];
    NSLog(@"相距：%f", meters);
    for (int i = 0; i < self.locationArray.count; i++) {
        CLLocationDistance tempDistance = [self.myLocation distanceFromLocation:self.locationArray[i]];
        NSString *tempString = [[NSString alloc] initWithFormat:@"<%.0fkm", tempDistance / 1000 + 1];
        [self.distanceArray addObject:tempString];
    }
    self.homePageView.distanceArray = [self.distanceArray mutableCopy];
    [self.homePageView.tableView reloadData];
    
    [self.geoCoder reverseGeocodeLocation:self.myLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSLog(@"%@", placemark.name);
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            // 位置名
            NSLog(@"name, %@", placemark.name);
            // 街道
            NSLog(@"thoroughfare, %@", placemark.thoroughfare);
            // 子街道
            NSLog(@"subThoroughfare, %@", placemark.subThoroughfare);
            // 市
            NSLog(@"locality, %@", placemark.locality);
            // 区
            NSLog(@"subLocality, %@", placemark.subLocality);
            // 国家
            NSLog(@"country, %@", placemark.country);
        } else if (error == nil && [placemarks count] == 0) {
            NSLog(@"No results were returned.");
        } else if (error != nil) {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    //不用的时候关闭更新位置服务，不关闭的话这个 delegate 隔一定的时间间隔就会有回调
    [self.getLocation stopUpdatingLocation];
}
//问题函数
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (error) {
        NSLog(@"%ld", (long)error.code);
    }
}

//初始化数据
- (void)p_initAllData {
    //获取到的球馆位置
    self.locationArray = [[NSMutableArray alloc] init];
    CLLocation *oneLocation = [[CLLocation alloc] initWithLatitude:34.213528 longitude:108.94883];
    CLLocation *twoLocation = [[CLLocation alloc] initWithLatitude:34.153885 longitude:108.89072];
    CLLocation *threeLocation = [[CLLocation alloc] initWithLatitude:34.386534 longitude:109.28537];
    [self.locationArray addObject:oneLocation];
    [self.locationArray addObject:twoLocation];
    [self.locationArray addObject:threeLocation];
    
    //存储距离数组
    self.distanceArray = [[NSMutableArray alloc] init];
}

@end
