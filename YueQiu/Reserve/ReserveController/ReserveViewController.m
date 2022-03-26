//
//  ReserveViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/21.
//

#import "ReserveViewController.h"
#import "Masonry.h"
#import <MapKit/MKMapItem.h>
#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface ReserveViewController ()

@end

@implementation ReserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initAllReserveUI];
    _appName = @"YueQiu";
}

- (void)initAllReserveUI {
    self.reserveView = [[ReserveView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.reserveView.backButton addTarget:self action:@selector(p_ReserveBack:) forControlEvents:UIControlEventTouchUpInside];
    self.reserveView.locationLabel.text = self.stadiumLocation;
    self.reserveView.nameLabel.text = self.stadiumName;
    self.reserveView.pointAnnotation.title = self.stadiumName;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLable)];
    tapGesture.numberOfTouchesRequired=1;
    [self.reserveView.locationLabel addGestureRecognizer:tapGesture];
    self.reserveView.locationLabel.userInteractionEnabled = YES;
    
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    NSString* placeString = [NSString stringWithFormat:@"%@",self.stadiumLocation];
    [geocoder geocodeAddressString:placeString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placemark in placemarks){
            //坐标（经纬度)
            CLLocationCoordinate2D coordinate = placemark.location.coordinate;
            self.reserveView.pointAnnotation.coordinate = coordinate;
            self.reserveView.mapView.centerCoordinate = coordinate;
        }}];
    [self.view addSubview:self.reserveView];
}

//返回事件
- (void)p_ReserveBack:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickLable{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]]) {
        UIAlertAction* appleMap = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self jumpAppleMap];
        }];
        [alert addAction:appleMap];
    }

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
        UIAlertAction* gaodeMap = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self jumpGaoDeMap];
        }];
        [alert addAction:gaodeMap];
    }

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]) {
        UIAlertAction* qqMap = [UIAlertAction actionWithTitle:@"腾讯地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self jumpQQMap];
        }];
        [alert addAction:qqMap];
    }
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)jumpAppleMap {
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
           
           //地理编码器
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString:self.stadiumLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error){
        CLPlacemark *endPlacemark  = placemarks.firstObject;
               
               //创建一个地图的地标对象
        MKPlacemark *endMKPlacemark = [[MKPlacemark alloc] initWithPlacemark:endPlacemark];
               
               //在地图上标注一个点(终点)
        MKMapItem *endMapItem = [[MKMapItem alloc] initWithPlacemark:endMKPlacemark];
               
               //MKLaunchOptionsDirectionsModeKey 指定导航模式
               //NSString * const MKLaunchOptionsDirectionsModeDriving; 驾车
               //NSString * const MKLaunchOptionsDirectionsModeWalking; 步行
               //NSString * const MKLaunchOptionsDirectionsModeTransit; 公交
        endMapItem.name = self.stadiumName;
        [MKMapItem openMapsWithItems:@[currentLocation, endMapItem] launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
    }];
}


- (void)jumpGaoDeMap {
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    NSString* placeString = self.stadiumLocation;
    [geocoder geocodeAddressString:placeString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placemark in placemarks){
                        //坐标（经纬度)
            CLLocationCoordinate2D coordinate = placemark.location.coordinate;
                        
            NSString *urlString = [[NSString stringWithFormat:@"iosamap://path?sourceApplication=%@&dlat=%f&dlon=%f&dname=%@&dev=0&t=0",self->_appName,coordinate.latitude,coordinate.longitude, self.stadiumName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) { NSLog(@"scheme调用结束"); }];
        }
    }];
}

- (void)jumpQQMap {
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    NSString* placeString = self.stadiumLocation;
    [geocoder geocodeAddressString:placeString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placemark in placemarks){
            //坐标（经纬度)
            CLLocationCoordinate2D coordinate = placemark.location.coordinate;
                        
            NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&to=%@&tocoord=%f,%f&referer=QXMBZ-SL4WK-LNPJX-AP5QU-NLFBE-TPFBQ", self.stadiumName,coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) { NSLog(@"scheme调用结束"); }];
        }
    }];
}



@end
