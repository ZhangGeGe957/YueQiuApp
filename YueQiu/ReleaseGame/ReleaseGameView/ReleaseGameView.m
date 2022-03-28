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
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, myWidth, myWidth - 70, myHeight / 2) style:UITableViewStylePlain];
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
    [self loadData];
}
//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.contentTextField resignFirstResponder];
    [self.locationTextField resignFirstResponder];
    [self.tableView removeFromSuperview];
}

//数据源...
- (void)loadData {
    NSArray *arr = @[@"QA", @"WS", @"ED", @"RF", @"TG", @"HY", @"UJ", @"KI", @"OL", @"P", @"ZA", @"XS", @"CD", @"VF", @"BG", @"NH", @"MJ"];
    _orginalArray = [NSMutableArray arrayWithCapacity:200];
    for (int i = 0; i < [arr count]; i ++) {
        [_orginalArray addObject:arr[i]];
    }
}
- (void)createTableView {
    [self tableViewInit];
    //搜索UITableView
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ReleaseGameCell class] forCellReuseIdentifier:@"1"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    if (textField.tag == 999) {
        [self createTableView];
        if (self.locationTextField.text != nil && self.locationTextField.text.length > 0) {
                _searchArray = [NSMutableArray array];//这里可以说是清空tableview的旧dataSource
                for (NSString *str in _orginalArray) {
                    if ([str rangeOfString:self.locationTextField.text options:NSCaseInsensitiveSearch].length > 0) {
                        [_searchArray addObject:str];
            
                        [self.tableView reloadData];
                    }
                }
            }
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.locationTextField.text.length > 0 && self.locationTextField.text != nil) {
        return self.searchArray.count;
    } else {
        return self.orginalArray.count;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1"];
    if (self.locationTextField.text.length > 0 && self.locationTextField.text != nil) {
        cell.textLabel.text = self.searchArray[indexPath.row];
    } else {
        cell.textLabel.text = self.orginalArray[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.locationTextField.text.length > 0 && self.locationTextField.text != nil) {
        self.locationTextField.text = self.searchArray[indexPath.row];
    } else {
        self.locationTextField.text = self.orginalArray[indexPath.row];
    }
    [self.tableView removeFromSuperview];
}


@end
