//
//  ReleaseGameView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/26.
//

#import "ReleaseGameView.h"
#import "Masonry.h"
#import "ReleaseGameCell.h"
#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ReleaseGameView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    //初始化控件
    [self p_initReleaseUI];

    
    return self;
}

- (void)tableViewInit {
    
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, myWidth / 4 + 30, myWidth, myHeight / 2) style:UITableViewStylePlain];
    }
}

- (void)p_initReleaseUI {
    //图标
    self.locationImageView = [[UIImageView alloc] init];
    self.locationImageView.image = [UIImage imageNamed:@"weizhi.png"];
    [self addSubview:self.locationImageView];
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(myWidth / 4);
        make.size.equalTo(@30);
    }];
    self.timeImageView = [[UIImageView alloc] init];
    self.timeImageView.image = [UIImage imageNamed:@"shijian.png"];
    [self addSubview:self.timeImageView];
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.locationImageView.mas_left);
        make.top.equalTo(self.locationImageView.mas_bottom).offset(20);
        make.size.equalTo(@30);
    }];
    
    //label
    self.locationTextField = [[UITextField alloc] init];
    self.locationTextField.placeholder = @"请输入位置";
    self.locationTextField.layer.borderWidth = 0.5;
    self.locationTextField.layer.cornerRadius = 10;
    self.locationTextField.layer.masksToBounds = YES;
    self.locationTextField.tag = 999;
    [self.locationTextField setFont:[UIFont systemFontOfSize:20]];
    self.locationTextField.delegate = self;
    self.locationTextField.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.locationTextField];
    [self.locationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.locationImageView.mas_right).offset(10);
        make.top.equalTo(self.locationImageView.mas_top);
        make.right.equalTo(self).offset(-10);
        make.height.equalTo(@30);
    }];

    //时间选择器按钮
    self.showDatePicker = [[UIDatePicker alloc] init];
    self.showDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.showDatePicker.layer.borderWidth = 0.5;
    self.showDatePicker.layer.cornerRadius = 10;
    self.showDatePicker.layer.masksToBounds = YES;
    self.showDatePicker.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.showDatePicker];
    [self.showDatePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.timeImageView.mas_top);
        make.height.equalTo(@30);
    }];
    
    //输入内容框
    self.contentTextField = [[UITextField alloc] init];
    self.contentTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.contentTextField.placeholder = @"请输入你要发送的内容!";
    self.contentTextField.textAlignment = NSTextAlignmentLeft;
    self.contentTextField.delegate = self;
    [self addSubview:self.contentTextField];
    [self.contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.locationImageView.mas_left);
        make.top.equalTo(self.timeImageView.mas_bottom).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(@(myHeight / 8));
    }];
    
    //发布按钮
    self.sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.sendButton.backgroundColor = [UIColor orangeColor];
    [self.sendButton setTitle:@"发表" forState:UIControlStateNormal];
    [self.sendButton setTintColor:[UIColor whiteColor]];
    self.sendButton.layer.masksToBounds = YES;
    self.sendButton.layer.cornerRadius = 15;
    [self addSubview:self.sendButton];
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.contentTextField.mas_bottom).offset(30);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
    }];
}
//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.contentTextField resignFirstResponder];
    [self.locationTextField resignFirstResponder];
    [self.tableView removeFromSuperview];
}


- (void)createTableView {
    [self tableViewInit];
    //搜索UITableView
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ReleaseGameCell class] forCellReuseIdentifier:@"1"];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    if (textField.tag == 999) {
        [self createTableView];
        if (self.locationTextField.text != nil && self.locationTextField.text.length > 0) {
            self.locationArray = [[NSMutableArray alloc] init];
            self.searchArray = [[NSMutableArray alloc] init];
            self.typeAndPlaceArray = [[NSMutableArray alloc] init];
            //存储距离数组
            self.distanceArray = [[NSMutableArray alloc] init];
            [self getMoreInformation];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReleaseGameCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
    if (self.searchArray.count != 0) {
        cell.nameLabel.text = self.searchArray[indexPath.row];
        cell.typeAndPlaceLabel.text = self.typeAndPlaceArray[indexPath.row];
        cell.distanceLabel.text = self.distanceArray[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.locationArray.count != 0) {
        self.locationTextField.text = self.searchArray[indexPath.row];
    }
    [self.tableView removeFromSuperview];
}
- (void)searchPOI:(NSString*)keyWords {
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
    request.location = [AMapGeoPoint locationWithLatitude:_myLocation.coordinate.latitude longitude:_myLocation.coordinate.longitude];
    request.keywords = keyWords;
    request.types = @"体育休闲服务";
    request.sortrule = 0;
    request.requireExtension = YES;
    request.cityLimit  = YES;
    request.requireSubPOIs = YES;
    [self.search AMapPOIKeywordsSearch:request];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.myLocation = locations.lastObject;
    [self searchPOI:self.locationTextField.text];
}
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
    } else {
        NSLog(@"error");
    }
}

- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response {

    if (response.pois.count == 0) {
        NSLog(@"没有查询到相关场所");
    } else {
        [response.pois enumerateObjectsUsingBlock:^(AMapPOI *obj, NSUInteger idx, BOOL *stop) {
            int flag = 0;
            for (int i = 0; i < obj.type.length; i++) {
                if([obj.type characterAtIndex:i] == ';') {
                    flag++;
                }
                if(flag == 2) {
                    flag = i;
                    break;
                }
            }
            NSString* typeAndPlaceString = [NSString stringWithFormat:@"%@ | %@", [obj.type substringFromIndex:flag + 1], obj.address];
            [self.typeAndPlaceArray addObject:typeAndPlaceString];
            [self.searchArray addObject:obj.name];
    
            CLLocation *location = [[CLLocation alloc] initWithLatitude:obj.location.latitude longitude:obj.location.longitude];
            [self.locationArray addObject:location];
        }];
        
        //计算距离
        for (int i = 0; i < self.locationArray.count; i++) {
            CLLocationDistance tempDistance = [self.myLocation distanceFromLocation:self.locationArray[i]];
            NSString *tempString = [[NSString alloc] initWithFormat:@"%dm", (int)tempDistance];
            [self.distanceArray addObject:tempString];
        }
        [self.tableView reloadData];
    }
}
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}
@end
