//
//  FollowView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import "FollowView.h"
#import "FollowerTableViewCell.h"
#import "SDWebImage.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation FollowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[FollowerTableViewCell class] forCellReuseIdentifier:@"background"];
    [self.tableView registerClass:[FollowerTableViewCell class] forCellReuseIdentifier:@"other"];
    [self.tableView registerClass:[FollowerTableViewCell class] forCellReuseIdentifier:@"follow"];
    [self addSubview:self.tableView];
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return H / 2;
    } else if(indexPath.row == 1){
        return 50;
    } else {
        return H * 2 / 3 - 50;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        FollowerTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"background"];
        [cell.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:self.backgroundString]];
        [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:self.headString]];
        cell.nameLabel.text = [NSString stringWithFormat:@"%@ | %ld岁", self.name, [self calculateAge]];
        
        if (self.sex == 0) {
            [cell.sexImageView setImage:[UIImage imageNamed:@"nv.png"]];
        } else {
            [cell.sexImageView setImage:[UIImage imageNamed:@"nannan.png"]];
        }
        
        return cell;
    } else if (indexPath.row == 1) {
        FollowerTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"other"];
        
        cell.contentLabel.text = self.signature;
        return cell;
    } else {
        FollowerTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"follow"];
        if (self.isFollow == 2) {
            
        } else if(self.isFollow == 1) {
            [cell.followButton setTitle:@"取消关注" forState:UIControlStateNormal];
            cell.followButton.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.6];
            
            [cell.followButton addTarget:self action:@selector(cancelFollow) forControlEvents:UIControlEventTouchUpInside];
        } else {
            [cell.followButton setTitle:@"关注" forState:UIControlStateNormal];
            [cell.followButton addTarget:self action:@selector(addFollow) forControlEvents:UIControlEventTouchUpInside];
        }
        [cell.followButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        return cell;
    }
    
}

- (void)cancelFollow {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cancel" object:nil userInfo:nil];
    
}

- (void)addFollow {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"add" object:nil userInfo:nil];
}

- (NSInteger)calculateAge {
    NSCalendar *calendar = [NSCalendar currentCalendar];//定义一个NSCalendar对象
         
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        //生日
    NSDate *birthDay = [dateFormatter dateFromString:self.birth];
         
        //用来得到详细的时差
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *date = [calendar components:unitFlags fromDate:birthDay toDate:nowDate options:0];
    return date.year;
    
}
@end

