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
}

- (void)initAllReserveUI {
    self.reserveView = [[ReserveView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.reserveView.backButton addTarget:self action:@selector(p_ReserveBack:) forControlEvents:UIControlEventTouchUpInside];
    self.reserveView.locationLabel.text = self.stadiumLocation;
    self.reserveView.nameLabel.text = self.stadiumName;
    self.reserveView.pointAnnotation.title = self.stadiumName;
    
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
