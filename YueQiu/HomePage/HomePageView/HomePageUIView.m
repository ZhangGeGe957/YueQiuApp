//
//  HomePageUIView.m
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import "HomePageUIView.h"
#import "Masonry.h"
#import "HQBSearchViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

NSString *const identityHomePageViewNotice = @"homePage";

@implementation HomePageUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    //初始化数据
//    [self p_initAllData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, self.frame.size.height) style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"imageView"];
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"stadium"];
    

    
    return self;
}

- (void)touchSearch{
    self.controller = [self viewController];
    HQBSearchViewController* searchViewController = [[HQBSearchViewController alloc] init];
    [self.controller.navigationController pushViewController:searchViewController animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return [self.nameArray count];
    } else {
        return 1;
    }
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        self.homeCell = [self.tableView dequeueReusableCellWithIdentifier:@"stadium"];
        self.homeCell.nameLabel.text = self.nameArray[indexPath.row];
        
        
        self.homeCell.placeLabel.text = self.placeArray[indexPath.row];
        
        
        //没有数据就弄默认值
        if (self.distanceArray.count == 0) {
            self.homeCell.distanceLabel.text = @"";
        } else {  //数据传过来了再进行赋值
            self.homeCell.distanceLabel.text = self.distanceArray[indexPath.row];
        }
        
//        self.homeCell.typeLabel.text = self.typeArray[indexPath.row];
        
//        self.homeCell.priceLabel.text = @"0";
        
        self.homeCell.scheduleButton.tag = indexPath.row;
        [self.homeCell.scheduleButton addTarget:self action:@selector(touchToSchedule:) forControlEvents:UIControlEventTouchUpInside];
        
        self.homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return self.homeCell;
    } else {
        HomePageTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"imageView"];
        cell.mapView.delegate = self;
        for(int i = 0; i < _locationArray.count; i++) {
            MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
            pointAnnotation.coordinate = CLLocationCoordinate2DMake([_locationArray[i] latitude], [_locationArray[i] longitude]);
            
            [cell.mapView addAnnotation:pointAnnotation];
        }
        return cell;
    }

}


- (void)touchButton:(UIButton*)button {
    
}

- (void)touchToSchedule:(UIButton*)button {
    //传递的数据
    self.transDataDictionary = [[NSMutableDictionary alloc] init];
    [self.transDataDictionary setValue:self.nameArray[button.tag] forKey:@"name"];
    [self.transDataDictionary setValue:self.placeArray[button.tag] forKey:@"place"];
    [self.transDataDictionary setValue:self.distanceArray[button.tag] forKey:@"distance"];
    [self.transDataDictionary setValue:self.typeArray[button.tag] forKey:@"type"];
    [self.transDataDictionary setValue:self.priceArray[button.tag] forKey:@"price"];
    
    //通知调回
    [[NSNotificationCenter defaultCenter] postNotificationName:identityHomePageViewNotice object:nil userInfo:self.transDataDictionary];
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



//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
//        if ([annotation isKindOfClass:[MAPointAnnotation class]])
//        {
//            static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//            MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//            if (annotationView == nil)
//            {
//                annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//            }
//            annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//            annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//            annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//            annotationView.pinColor = MAPinAnnotationColorPurple;
//            return annotationView;
//        }
//        return nil;
//}

@end
