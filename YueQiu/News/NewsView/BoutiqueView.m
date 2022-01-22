//
//  BoutiqueView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/21.
//

#import "BoutiqueView.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation BoutiqueView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self p_initBoutiqueUI];
    
    return self;
}

- (void)p_initBoutiqueUI {
    self.showBoutiqueTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight / 1.23) style:UITableViewStylePlain];
    self.showBoutiqueTableView.delegate = self;
    self.showBoutiqueTableView.dataSource = self;
    self.showBoutiqueTableView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.showBoutiqueTableView];
    [self.showBoutiqueTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"show"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [self.showBoutiqueTableView dequeueReusableCellWithIdentifier:@"show" forIndexPath:indexPath];
    [cell.headButton setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
    cell.titleNameLabel.text = @"抛物线篮球场";
    cell.locationLabel.text = @"星火路抛物线篮球场";
    cell.timeLabel.text = @"1月18日 19:00";
    cell.teamLabel.text = @"邮电计算机院院队";
    cell.contentLabel.text = @"5V5交流切磋赛，欢迎切磋！";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
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
