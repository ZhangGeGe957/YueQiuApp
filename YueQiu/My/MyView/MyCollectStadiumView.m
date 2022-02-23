//
//  MyCollectStadiumView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import "MyCollectStadiumView.h"
#import "CourseAndStadiumCell.h"
#import <MapKit/MKMapItem.h>
@implementation MyCollectStadiumView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.stadiumArray = [NSArray arrayWithObjects:@"星火篮城篮球馆", @"星玮篮球公园", @"路人王骏杰体育·赛汗搏林篮球公园", nil];
    self.stadiumPlaceArray = [NSArray arrayWithObjects:@"内蒙古自治区包头市昆都仑区民族东路北段珑湾花苑二楼", @"内蒙古自治区包头市东河区西脑包南三道巷", @"内蒙古自治区包头市九原区稀土高新区万青路与稀土路交叉口北200米路西大院内", nil];
    _appName = @"YueQiu";
    
    self.stadiumTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
    self.stadiumTableView.dataSource = self;
    self.stadiumTableView.delegate = self;
    [self.stadiumTableView registerClass:[CourseAndStadiumCell class] forCellReuseIdentifier:@"stadium"];
    [self addSubview:self.stadiumTableView];
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stadiumArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseAndStadiumCell* cell = [self.stadiumTableView dequeueReusableCellWithIdentifier:@"stadium"];
    cell.stadiumLabel.text = self.stadiumArray[indexPath.row];
    cell.stadiumPlaceLabel.text = self.stadiumPlaceArray[indexPath.row];
    cell.buttonGPS.tag = 101 + indexPath.row;
    [cell.buttonGPS addTarget:self action:@selector(touchGPS:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (void)touchGPS:(UIButton*)button {
//    NSLog(@"1");
    
    self.controller = [self viewController];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]]) {
        UIAlertAction* appleMap = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self jumpAppleMap:button.tag];
        }];
        [alert addAction:appleMap];
    }

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
        UIAlertAction* gaodeMap = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self jumpGaoDeMap:button.tag];
        }];
        [alert addAction:gaodeMap];
    }

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]) {
        UIAlertAction* qqMap = [UIAlertAction actionWithTitle:@"腾讯地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self jumpQQMap:button.tag];
        }];
        [alert addAction:qqMap];
    }
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    
    [self.controller presentViewController:alert animated:YES completion:nil];
}

- (void)jumpAppleMap:(NSInteger)i {
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
           
           //地理编码器
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSString* placeString = self.stadiumPlaceArray[i - 101];
    
    [geocoder geocodeAddressString:placeString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error){
        CLPlacemark *endPlacemark  = placemarks.firstObject;
               
               //创建一个地图的地标对象
        MKPlacemark *endMKPlacemark = [[MKPlacemark alloc] initWithPlacemark:endPlacemark];
               
               //在地图上标注一个点(终点)
        MKMapItem *endMapItem = [[MKMapItem alloc] initWithPlacemark:endMKPlacemark];
               
               //MKLaunchOptionsDirectionsModeKey 指定导航模式
               //NSString * const MKLaunchOptionsDirectionsModeDriving; 驾车
               //NSString * const MKLaunchOptionsDirectionsModeWalking; 步行
               //NSString * const MKLaunchOptionsDirectionsModeTransit; 公交
        endMapItem.name = self.stadiumArray[i - 101];
        [MKMapItem openMapsWithItems:@[currentLocation, endMapItem] launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
    }];
}


- (void)jumpGaoDeMap:(NSInteger)i {
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    NSString* placeString = self.stadiumPlaceArray[i - 101];
    [geocoder geocodeAddressString:placeString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placemark in placemarks){
                        //坐标（经纬度)
            CLLocationCoordinate2D coordinate = placemark.location.coordinate;
                        
            NSString *urlString = [[NSString stringWithFormat:@"iosamap://path?sourceApplication=%@&dlat=%f&dlon=%f&dname=%@&dev=0&t=0",self->_appName,coordinate.latitude,coordinate.longitude, self.stadiumArray[i - 101]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) { NSLog(@"scheme调用结束"); }];
        }
    }];
}

- (void)jumpQQMap:(NSInteger)i {
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    NSString* placeString = self.stadiumPlaceArray[i - 101];
    [geocoder geocodeAddressString:placeString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placemark in placemarks){
            //坐标（经纬度)
            CLLocationCoordinate2D coordinate = placemark.location.coordinate;
                        
            NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&to=%@&tocoord=%f,%f&referer=QXMBZ-SL4WK-LNPJX-AP5QU-NLFBE-TPFBQ", self.stadiumArray[i - 101],coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) { NSLog(@"scheme调用结束"); }];
        }
    }];
}
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
