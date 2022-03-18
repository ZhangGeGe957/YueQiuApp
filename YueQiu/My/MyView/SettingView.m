//
//  SettingView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/22.
//


#import "SettingView.h"
#import "SettingCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.array = [NSArray arrayWithObjects:@"账号与安全", @"夜间模式", @"通知设置", @"清理占用空间", @"反馈与帮助", @"隐私政策", @"切换账号", @"退出登陆", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionFooterHeight = 0;
    [self.tableView registerClass:[SettingCell class] forCellReuseIdentifier:@"1"];
    [self addSubview:self.tableView];
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 3;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        return 1;
    } else {
        return 40;
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W, 40)];
    if (section == 0) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, W / 3, 40)];
        label.text = @"账号";
        label.textColor = [UIColor grayColor];
        [headView addSubview:label];
    } else if (section == 1) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, W / 3, 40)];
        label.text = @"通用";
        label.textColor = [UIColor grayColor];
        [headView addSubview:label];
    } else if (section == 2) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, W / 3, 40)];
        label.text = @"关于";
        label.textColor = [UIColor grayColor];
        [headView addSubview:label];
    } else {
        headView.backgroundColor = [UIColor grayColor];
    }
    return headView;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SettingCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.array[0];
        cell.imageView.image = [UIImage imageNamed:@"zhanghaoyuanquan.png"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        SettingCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
        if (indexPath.row == 0) {
            UISwitch* nightSwitch = [[UISwitch alloc] init];
            cell.accessoryView = nightSwitch;
            cell.textLabel.text = self.array[1];
            cell.imageView.image = [UIImage imageNamed:@"yejianmoshi.png"];
        } else if (indexPath.row == 1) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = self.array[2];
            cell.imageView.image = [UIImage imageNamed:@"tongzhi.png"];

        } else {
            cell.textLabel.text = self.array[3];
            cell.imageView.image = [UIImage imageNamed:@"shanchu.png"];

        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 2) {
        SettingCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
        cell.textLabel.text = self.array[4 + indexPath.row];
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"fankui.png"];
        } else {
            cell.imageView.image = [UIImage imageNamed:@"yinsi.png"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        SettingCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
        cell.textLabel.text = self.array[6 + indexPath.row];
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"qiehuanzhanghao.png"];
        } else {
            cell.imageView.image = [UIImage imageNamed:@"tuichudenglu.png"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
}

@end
