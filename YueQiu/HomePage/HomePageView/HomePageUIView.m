//
//  HomePageUIView.m
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import "HomePageUIView.h"

#import "HomePageTableViewCell.h"
#import "Masonry.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation HomePageUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    
    
    self.nameArray = [NSArray arrayWithObjects:@"韦曲球馆", @"万科球馆", @"GOGO球馆", nil];
    self.placeArray = [NSArray arrayWithObjects:@"韦曲南街", @"万科广场", @"GOGO商场", nil];
    self.distanceArray = [NSArray arrayWithObjects:@"<5km", @"<1km", @"<2km", nil];

    self.priceArray = [NSArray arrayWithObjects:@"10元/h", @"20元/h", @"15元/h", nil];
    self.typeArray = [NSArray arrayWithObjects:@"篮球", @"乒乓球", @"羽毛球", nil];

    [self createUI];
    return self;
}

- (void)createUI {

    
    self.tableView = [[UITableView alloc] init];
    self.tableView.tag = 999;
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.left.equalTo(self).offset(0);
            make.width.mas_offset(W);
            make.height.mas_offset(H / 2);
    }];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"0"];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/YueQiuApp-1/图库/TrainPhotos/2-1.png"]];
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tableView.mas_top).offset(H / 6);
            make.left.equalTo(self.tableView.mas_left).offset(W / 20);
            make.size.mas_equalTo(CGSizeMake(W * 18 / 20, H / 4.5));
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    self.titleLabel.text = @"附近球馆";
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(H / 50);
            make.left.equalTo(self.imageView.mas_left).offset(W / 20);
            make.size.mas_equalTo(CGSizeMake(W * 8 / 10, H / 20));
    }];
    self.titleLabel.font = [UIFont systemFontOfSize:25];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.layer.cornerRadius = 20;
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.layer.borderWidth = 1;
    
    UIView* viewBackground = [[UIView alloc] init];
    [self addSubview:viewBackground];
    viewBackground.backgroundColor = [UIColor grayColor];
    [viewBackground mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
            make.left.equalTo(self.titleLabel.mas_left);
            make.size.mas_equalTo(CGSizeMake(W * 8 / 10, H / 2.3));
    }];
    viewBackground.layer.borderWidth = 1;
    viewBackground.layer.cornerRadius = 20;
    viewBackground.layer.masksToBounds = YES;
    
    self.stadiumTableView = [[UITableView alloc] init];
    [viewBackground addSubview:self.stadiumTableView];
    [self.stadiumTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewBackground.mas_top).offset(H / 50);
        make.left.equalTo(viewBackground.mas_left).offset(W / 20);
        make.size.mas_equalTo(CGSizeMake(W * 7 / 10, H / 2.3 - H / 25));
    }];
    self.stadiumTableView.delegate = self;
    self.stadiumTableView.dataSource = self;
    self.stadiumTableView.tag = 998;
    [self.stadiumTableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"stadium"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 999) {
        if(self.searchController.active) {
            return [self.dataArray count];
        } else {
            return [self.searchArray count];
        }
    } else {
        return [self.nameArray count];
    }
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView.tag == 999) {
        HomePageTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0"];
        return cell;
    } else {
        HomePageTableViewCell* cell = [self.stadiumTableView dequeueReusableCellWithIdentifier:@"stadium"];
        [cell.nameButton setTitle:self.nameArray[indexPath.row] forState:UIControlStateNormal];
        cell.nameButton.tag = 101 + indexPath.row * 3;
        [cell.nameButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.placeButton setTitle:self.placeArray[indexPath.row] forState:UIControlStateNormal];
        cell.placeButton.tag = 101 + indexPath.row * 3 + 1;
        [cell.placeButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.distanceButton setTitle:self.distanceArray[indexPath.row] forState:UIControlStateNormal];
        cell.distanceButton.tag = 101 + indexPath.row * 3 + 2;
        [cell.distanceButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.typeButton setTitle:self.typeArray[indexPath.row] forState:UIControlStateNormal];
        [cell.priceButton setTitle:self.priceArray[indexPath.row] forState:UIControlStateNormal];
        cell.scheduleButton.tag = 201 + indexPath.row;
        [cell.scheduleButton addTarget:self action:@selector(touchToSchedule:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 998) {
        
    }
}
- (void)touchButton:(UIButton*)button {
    
}

- (void)touchToSchedule:(UIButton*)button {
    
}
@end
