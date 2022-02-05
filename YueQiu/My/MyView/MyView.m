//
//  MyView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/3.
//

#import "MyView.h"
#import "MyTableViewCell.h"
#import "Masonry.h"

#define W self.frame.size.width
#define H self.frame.size.height
@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.courseArray = [NSArray arrayWithObjects:@"篮球基础训练", @"足球基础训练", @"乒乓球基础训练", nil];
    self.stadiumArray = [NSArray arrayWithObjects:@"韦曲球馆", @"万科球馆", @"GOGO球馆", nil];
    self.stadiumPlaceArray = [NSArray arrayWithObjects:@"韦曲南街", @"万科广场", @"GOGO商场", nil];
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, W, H)];
    [self addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(W, H * 1.5);
    scrollView.tag = 101;
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beijing.jpeg"]];
    [scrollView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_top).offset(0);
        make.left.equalTo(scrollView.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(W, H / 3));
    }];
    
    self.buttonHead = [UIButton buttonWithType:UIButtonTypeCustom];
    [scrollView addSubview:self.buttonHead];
    [self.buttonHead setImage:[UIImage imageNamed:@"head.jpeg"] forState:UIControlStateNormal];
    [self.buttonHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(20);
        make.left.equalTo(imageView.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    self.buttonHead.layer.cornerRadius = 50;
    self.buttonHead.layer.masksToBounds = YES;
    [self.buttonHead addTarget:self action:@selector(touchToChangeHead:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelName = [[UILabel alloc] init];
    [scrollView addSubview:self.labelName];
    self.labelName.text = @"Fahaxiki";
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttonHead.mas_top).offset(10);
        make.left.equalTo(self.buttonHead.mas_right).offset(20);
        make.size.mas_equalTo(CGSizeMake(W / 3, 30));
    }];
    self.labelName.textAlignment = NSTextAlignmentLeft;
    self.labelName.font = [UIFont systemFontOfSize:23];
    
    self.labelUID = [[UILabel alloc] init];
    [scrollView addSubview:_labelUID];
    [_labelUID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labelName.mas_top).offset(0);
        make.left.equalTo(_labelName.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(W / 3, 30));
    }];
    _labelUID.text = @"UID:000001";
    _labelUID.textAlignment = NSTextAlignmentLeft;
    
    self.labelPersonalSignature = [[UILabel alloc] init];
    [scrollView addSubview:self.labelPersonalSignature];
    [self.labelPersonalSignature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelName.mas_bottom).offset(10);
        make.left.equalTo(self.labelName.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(W * 2 / 3, 30));
    }];
    self.labelPersonalSignature.numberOfLines = 1;
    self.labelPersonalSignature.text = @"年龄永远不是衡量一个人的刻度,只有责任的叠加才会让人逐渐成长。";
    self.labelPersonalSignature.font = [UIFont systemFontOfSize:15];
    
    
    
    
//    self.courseTableView = [[UITableView alloc] initWithFrame:CGRectMake(W / 20, 0, W, H / 2) style:UITableViewStylePlain];
    self.courseTableView = [[UITableView alloc] init];
    self.courseTableView.delegate = self;
    self.courseTableView.dataSource = self;
    self.courseTableView.tag = 102;
    self.courseTableView.layer.borderWidth = 1;
    [self.courseTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"course"];
    [scrollView addSubview:self.courseTableView];
    [self.courseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_buttonHead.mas_bottom).offset(40);
        make.left.equalTo(_buttonHead.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(W - 40, self.courseArray.count * 60));
    }];
    UILabel* courseLabel = [[UILabel alloc] initWithFrame:CGRectMake(W / 5, 10, W / 2, 40)];
    courseLabel.layer.borderWidth = 1;
    self.courseTableView.tableHeaderView = courseLabel;
    courseLabel.text = @"我的课程列表";
    
    
    self.stadiumTableView = [[UITableView alloc] init];
    self.stadiumTableView.delegate = self;
    self.stadiumTableView.dataSource = self;
    self.stadiumTableView.tag = 103;
    self.stadiumTableView.layer.borderWidth = 1;
    [self.stadiumTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"stadium"];
    [scrollView addSubview:self.stadiumTableView];
    [self.stadiumTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_courseTableView.mas_bottom).offset(50);
        make.left.equalTo(_courseTableView.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(W - 40, self.stadiumArray.count * 70));
    }];
    UILabel* stadiumLabel = [[UILabel alloc] initWithFrame:CGRectMake(W / 5, 10, W / 2, 40)];
    stadiumLabel.layer.borderWidth = 1;
    self.stadiumTableView.tableHeaderView = stadiumLabel;
    stadiumLabel.text = @"我收藏的球馆";
    return self;
}

- (void)touchToChangeHead:(UIButton*)button {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 102) {
        return self.courseArray.count;
    } else {
        return self.stadiumArray.count;
    }
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView.tag == 102) {
        MyTableViewCell* cell = [self.courseTableView dequeueReusableCellWithIdentifier:@"course"];
        cell.courseLabel.text = self.courseArray[indexPath.row];
        cell.progressView.progress = 0.5;
        return cell;
    } else {
        MyTableViewCell* cell = [self.stadiumTableView dequeueReusableCellWithIdentifier:@"stadium"];
        cell.stadiumLabel.text = self.stadiumArray[indexPath.row];
        cell.stadiumPlaceLabel.text = self.stadiumPlaceArray[indexPath.row];
        return cell;
    }
    
}
@end
