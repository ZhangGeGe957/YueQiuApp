//
//  TrainView.m
//  约球
//
//  Created by 张佳乔 on 2022/1/2.
//

#import "TrainView.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation TrainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    //初始化UI控件
    [self initUI];
    
    return self;
}

- (void)initUI {
    self.coursesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.coursesButton setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
    self.coursesButton.layer.cornerRadius = 52;
    self.coursesButton.layer.masksToBounds = YES;
    [self addSubview:self.coursesButton];
    [self.coursesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@(myWidth / 4));
        make.left.equalTo(self).offset(myWidth / 20);
        make.top.equalTo(self).offset(myHeight / 8);
    }];
    self.coursesLabel = [[UILabel alloc] init];
    self.coursesLabel.text = @"定制课程";
    self.coursesLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.coursesLabel];
    [self.coursesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(myWidth / 20);
        make.top.equalTo(self.coursesButton).offset(myHeight / 10);
        make.width.equalTo(@(myWidth / 4));
        make.height.equalTo(@(myWidth / 6));
    }];
    
    self.coachButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.coachButton setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
    self.coachButton.layer.cornerRadius = 52;
    self.coachButton.layer.masksToBounds = YES;
    [self addSubview:self.coachButton];
    [self.coachButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(myHeight / 8);
        make.centerX.equalTo(self);
        make.size.equalTo(@(myWidth / 4));
    }];
    self.coachLabel = [[UILabel alloc] init];
    self.coachLabel.text = @"个人教练";
    self.coachLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.coachLabel];
    [self.coachLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.coachButton).offset(myHeight / 10);
        make.width.equalTo(@(myWidth / 4));
        make.height.equalTo(@(myWidth / 6));
    }];
    
    self.rankingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rankingButton setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
    self.rankingButton.layer.cornerRadius = 52;
    self.rankingButton.layer.masksToBounds = YES;
    [self addSubview:self.rankingButton];
    [self.rankingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(myHeight / 8);
        make.right.equalTo(self).offset(- myWidth / 20);
        make.size.equalTo(@(myWidth / 4));
    }];
    self.rankingLabel = [[UILabel alloc] init];
    self.rankingLabel.text = @"积分排行";
    self.rankingLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.rankingLabel];
    [self.rankingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(- myWidth / 20);
        make.top.equalTo(self.rankingButton).offset(myHeight / 10);
        make.width.equalTo(@(myWidth / 4));
        make.height.equalTo(@(myWidth / 6));
    }];
    
    //设置分割线
    self.topLine = [[UILabel alloc] init];
    self.topLine.backgroundColor = [UIColor systemGrayColor];
    self.topLine.text = @"";
    [self addSubview:self.topLine];
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coachButton).offset(-myWidth / 20);
        make.left.equalTo(@0);
        make.height.equalTo(@1);
        make.width.equalTo(@(myWidth));
    }];
    
    self.choiceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.choiceButton setTitle:@"全部" forState:UIControlStateNormal];
    [self.choiceButton addTarget:self action:@selector(showProject:) forControlEvents:UIControlEventTouchUpInside];
    self.choiceButton.tintColor = [UIColor blackColor];
    [self.choiceButton.titleLabel setFont:[UIFont systemFontOfSize:22]];
    self.choiceButton.layer.cornerRadius = 6;
    self.choiceButton.layer.masksToBounds = YES;
    self.choiceButton.layer.borderWidth = 0.5;
    [self addSubview:self.choiceButton];
    [self.choiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coachLabel).offset(myWidth / 6);
        make.centerX.equalTo(self);
        make.width.equalTo(@(myWidth));
        make.height.equalTo(@(myHeight / 17));
    }];
    
    self.projectArray = [[NSArray alloc] initWithObjects:@"全部", @"篮球", @"足球", @"乒乓球", @"羽毛球", nil];
    self.projectIsShow = 0;
    
    self.projectTableView = [[UITableView alloc] init];
    self.projectTableView.delegate = self;
    self.projectTableView.dataSource = self;
    [self addSubview:self.projectTableView];
    [self.projectTableView registerClass:[ShowProjectTableViewCell class] forCellReuseIdentifier:@"project"];
    //设置tableview的默认选中
    [self.projectTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    return;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowProjectTableViewCell *projectCell = [self.projectTableView dequeueReusableCellWithIdentifier:@"project" forIndexPath:indexPath];
    projectCell.projectLabel.text = self.projectArray[indexPath.row];
    return projectCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.projectArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return myHeight / 17;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowProjectTableViewCell *nowCell = [self.projectTableView cellForRowAtIndexPath:indexPath];
    [self.choiceButton setTitle:nowCell.projectLabel.text forState:UIControlStateNormal];
    [self.projectTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.choiceButton).offset(myHeight / 17);
        make.left.equalTo(@0);
        make.width.equalTo(@0);
        make.height.equalTo(@0);
    }];
    self.projectIsShow = !self.projectIsShow;
}

- (void)showProject:(UIButton *)button {
    if (self.projectIsShow) {
        [self.projectTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.choiceButton).offset(myHeight / 17);
            make.left.equalTo(@0);
            make.width.equalTo(@0);
            make.height.equalTo(@0);
        }];
    } else {
        [self.projectTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.choiceButton).offset(myHeight / 17);
            make.left.equalTo(@0);
            make.width.equalTo(@(myWidth));
            make.height.equalTo(@(myHeight / 5));
        }];
    }
    self.projectIsShow = !self.projectIsShow;
    return;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
