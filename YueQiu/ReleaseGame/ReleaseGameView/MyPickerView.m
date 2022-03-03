//
//  MyPickerView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/3.
//

#import "MyPickerView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation MyPickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor whiteColor];
    
    //初始化数据
    [self p_initData];
    
    //初始化选择器
    [self p_initPickerView];
    
    return self;
}

//初始化选择器
- (void)p_initPickerView {
    
    //初始化按钮
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(pressCancel:) forControlEvents:UIControlEventTouchUpInside];
    self.cancelButton.frame = CGRectMake(30, 0, 50, 30);
    self.cancelButton.hidden = YES;
    [self addSubview:self.cancelButton];
    self.sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
    self.sureButton.frame = CGRectMake(ScreenWidth - 80, 0, 50, 30);
    self.sureButton.hidden = YES;
    [self addSubview:self.sureButton];
    
    //自定义选择器
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectNull];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self addSubview:self.pickerView];
}

//UIPickerViewDataSource

//返回显示的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

//返回每一列中需要显示的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component % 2) {
        return 60;
    } else {
        return 24;
    }
}


//UIPickerViewDelegate

//返回每一列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 1 || component == 2) {
        return 100;
    } else {
        return 50;
    }
}

//返回每一列的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}

//返回UIPickerView控件中指定列的列表项的要显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    @autoreleasepool {
        NSString *tempString = [[NSString alloc] initWithFormat:@"%.2ld", row];
        return tempString;
    }
}

////返回UIView，作为该UIPickerView控件中指定列的指定行的显示视图
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
//    return nil;
//}
//
//
//选择指定列中的指定行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            self.one = row;
            break;
        case 1:
            self.two = row;
            break;
        case 2:
            self.three = row;
            break;
        case 3:
            self.four = row;
            break;
    }
    self.timeString = [NSString stringWithFormat:@"%.2ld:%.2ld-%.2ld:%.2ld", self.one, self.two, self.three, self.four];
    
    NSLog(@"%@", self.timeString);
}

//初始化数据
- (void)p_initData {
    self.timeString = [[NSString alloc] init];
}

//取消按钮事件
- (void)pressCancel:(UIButton *)button {
    self.frame = CGRectZero;
    [self isShowOnView:NO];
}

//判断是否要显示在视图上
- (void)isShowOnView:(BOOL)select {
    if (select) {
        self.pickerView.frame = CGRectMake(0, 30, ScreenWidth, 230);
        self.cancelButton.hidden = NO;
        self.sureButton.hidden = NO;
    } else {
        self.pickerView.frame = CGRectNull;
        self.cancelButton.hidden = YES;
        self.sureButton.hidden = YES;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
