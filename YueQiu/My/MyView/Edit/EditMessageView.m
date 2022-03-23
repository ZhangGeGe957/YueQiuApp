//
//  EditMessageView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/22.
//

#import "EditMessageView.h"
#import "EditMessageCell.h"
#import "EditController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation EditMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.menuArray = [[NSMutableArray alloc] initWithObjects:@"昵称", @"性别", @"生日", @"邮箱", @"签名", @"标签", nil];
    self.sexArray = [[NSMutableArray alloc] initWithObjects:@"女",@"男", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[EditMessageCell class] forCellReuseIdentifier:@"0"];
    [self.tableView registerClass:[EditMessageCell class] forCellReuseIdentifier:@"1"];
    [self.tableView registerClass:[EditMessageCell class] forCellReuseIdentifier:@"2"];
    [self.tableView registerClass:[EditMessageCell class] forCellReuseIdentifier:@"3"];
    [self addSubview:self.tableView];
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0 || section == 2) {
        return 1;
    } else {
        return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 3) {
        return 80;
    } else {
        return 40;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        EditMessageCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0"];
        cell.textLabel.text = self.menuArray[0];
        cell.valueLabel.text = self.nameString;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        EditMessageCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
        cell.textLabel.text = self.menuArray[indexPath.row + 1];
        if (indexPath.row == 0) {
            cell.valueLabel.text = self.sexArray[_sex];
        } else {
            cell.valueLabel.text = self.birthString;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if(indexPath.section == 2) {
        EditMessageCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"2"];
        cell.textLabel.text = self.menuArray[3];
        cell.valueLabel.text = self.emaileString;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        EditMessageCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"3"];
        cell.textLabel.text = self.menuArray[4 + indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dealData:) name:@"EditToEdit" object: nil];
    self.viewController = [self viewController];
    self.viewController.hidesBottomBarWhenPushed = YES;
    EditController* editController = [[EditController alloc] init];
    if(indexPath.section == 0) {
        editController.titleString = @"修改我的昵称";
        editController.valueString = self.nameString;
        [self.viewController.navigationController pushViewController:editController animated:YES];
        
    } else if(indexPath.section == 2) {
        editController.titleString = @"修改我的邮箱";
        editController.valueString = self.emaileString;
        [self.viewController.navigationController pushViewController:editController animated:YES];
        
    } else if(indexPath.section == 3) {
        if (indexPath.row == 0) {
            editController.titleString = @"修改个性签名";
            editController.valueString = self.signatureString;
        } else {
            editController.titleString = @"修改标签";
            editController.valueString = self.labelString;
        }
        [self.viewController.navigationController pushViewController:editController animated:YES];
    } else {
        if (indexPath.row == 0) {
            [self initPickerView];
        } else {
            HQBDatePickerView *pickerDate = [[HQBDatePickerView alloc]init];
            [pickerDate setDelegate:self];
            NSCalendar *calendar = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            // 获取当前日期
            NSDate* date = [NSDate date];
            // 指定获取指定年、月、日、时、分、秒的信息
            unsigned unitFlags = NSCalendarUnitYear |
            NSCalendarUnitMonth |  NSCalendarUnitDay;
            // 获取不同时间字段的信息
            NSDateComponents* comp = [calendar components:unitFlags fromDate:date];
            [pickerDate setDefaultTSelectYear:comp.year defaultSelectMonth:comp.month defaultSelectDay:comp.day];
            [pickerDate show];
        }
    }

}
- (UIPickerView *)sexpickerView {
    if (!_sexPickerView) {
        _sexPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, W, 200)];
        _sexPickerView.delegate = self;
        _sexPickerView.dataSource = self;
        _sexPickerView.tag = 102;
    }
    return _sexPickerView;
}


- (void)initPickerView {
    _sexPickerView = [self sexpickerView];
    if(!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, H - 250, W, 250)];
        [self addSubview:_contentView];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView addSubview:_sexPickerView];
        UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 30)];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:cancelButton];
            
        UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(W - 60, 20, 50, 30)];
        [confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [confirmButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        confirmButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [confirmButton addTarget:self action:@selector(confirmButtonActionSex) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:confirmButton];
    }
    _contentView.alpha = 1;
    
}

- (void)cancelButtonAction {
    self.contentView.alpha = 0;
}

- (void)confirmButtonActionSex {
    if ([self.sexPickerView selectedRowInComponent:0] == 0) {
        self.sex = 0;
    } else {
        self.sex = 1;
    }
    [self.tableView reloadData];
    self.contentView.alpha = 0;
}

- (void)dealData:(NSNotification*)sender {
    if([sender.userInfo[@"flag"] isEqualToString:@"修改我的昵称"] && ![sender.userInfo[@"content"] isEqualToString:@""]) {
        self.nameString = sender.userInfo[@"content"];
    } else if ([sender.userInfo[@"flag"] isEqualToString:@"修改我的邮箱"]) {
        self.emaileString = sender.userInfo[@"content"];
    } else if ([sender.userInfo[@"flag"] isEqualToString:@"修改个性标签"]) {
        self.signatureString = sender.userInfo[@"content"];
    } else {
        self.labelString = sender.userInfo[@"content"];
    }
    [self.tableView reloadData];
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

//UIPickerView的DataSoure
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return W;
}

//返回每一列的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString* string = [NSString stringWithFormat:@"%@", self.sexArray[row]];
    return string;
}

- (void)pickerDateView:(HQBPickerView *)pickerDateView selectYear:(NSInteger)year selectMonth:(NSInteger)month selectDay:(NSInteger)day {
    self.birthString = [NSString stringWithFormat:@"%ld年%ld月%ld日",year,month,day];
    [self.tableView reloadData];
}

@end

