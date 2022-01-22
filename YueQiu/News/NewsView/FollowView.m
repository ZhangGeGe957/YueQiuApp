//
//  FollowView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/21.
//

#import "FollowView.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation FollowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self p_initFollowUI];
    
    return self;
}

- (void)p_initFollowUI {
    self.showFollowTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight / 1.23) style:UITableViewStylePlain];
    self.showFollowTableView.delegate = self;
    self.showFollowTableView.dataSource = self;
    self.showFollowTableView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.showFollowTableView];
    [self.showFollowTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"show"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [self.showFollowTableView dequeueReusableCellWithIdentifier:@"show" forIndexPath:indexPath];
    [cell.headButton setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
    cell.titleNameLabel.text = @"NBA分部";
    cell.locationLabel.text = @"西安邮电大学体育场";
    cell.timeLabel.text = @"1月20日 9:00";
    cell.teamLabel.text = @"安岳南楼5层NBA分部";
    cell.contentLabel.text = @"5V5交流切磋赛，欢迎切磋！欢迎大家来被我们打爆";
    cell.VIPImageView.hidden = YES;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
