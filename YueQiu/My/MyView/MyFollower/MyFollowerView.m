//
//  MyFollowerView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

#import "MyFollowerView.h"
#import "MyFollowerCell.h"
#import "SDWebImage.h"
@implementation MyFollowerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyFollowerCell class] forCellReuseIdentifier:@"1"];
    [self addSubview:self.tableView];
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyFollowerCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
    [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[self.dataArray[indexPath.row] valueForKey:@"headSculpture"]]];
    cell.nameLabel.text = [self.dataArray[indexPath.row] valueForKey:@"username"];
    cell.followButton.tag = 101 + indexPath.row;
    if ([[self.dataArray[indexPath.row] valueForKey:@"isFollow"]isEqualToString:@"1"]) {
        [cell.followButton setTitle:@"取消关注" forState:UIControlStateNormal];
        [cell.followButton addTarget:self action:@selector(cancelFollow:) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [cell.followButton setTitle:@"关注" forState:UIControlStateNormal];
        cell.followButton.backgroundColor = [UIColor colorWithRed:0.7 green:0 blue:0 alpha:0.2];
        [cell.followButton addTarget:self action:@selector(addFollow:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return cell;
}

- (void)cancelFollow:(UIButton*)button {
    [self.dataArray[button.tag - 101] setValue:@"0" forKey:@"isFollow"];
    [self.tableView reloadData];
}

- (void)addFollow:(UIButton*)button {
    [self.dataArray[button.tag - 101] setValue:@"1" forKey:@"isFollow"];
    [self.tableView reloadData];
}

@end
