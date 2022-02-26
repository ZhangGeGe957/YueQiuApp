//
//  ReleaseGameView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/26.
//

#import "ReleaseGameView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ReleaseGameView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    //初始化控件
    [self p_initReleaseUI];
    
    return self;
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
    self.locationLabel = [[UILabel alloc] init];
    self.locationLabel.text = @"pangguanzhenluxicun";
    self.locationLabel.layer.borderWidth = 0.5;
    self.locationLabel.layer.cornerRadius = 10;
    self.locationLabel.layer.masksToBounds = YES;
    self.locationLabel.textAlignment = NSTextAlignmentCenter;
    [self.locationLabel setFont:[UIFont systemFontOfSize:20]];
    [self addSubview:self.locationLabel];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.locationImageView.mas_right).offset(10);
        make.top.equalTo(self.locationImageView.mas_top);
        make.right.equalTo(self).offset(-60);
        make.height.equalTo(@30);
    }];
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.text = @"pangguanzhenluxi";
    self.timeLabel.layer.borderWidth = 0.5;
    self.timeLabel.layer.cornerRadius = 10;
    self.timeLabel.layer.masksToBounds = YES;
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.timeLabel setFont:[UIFont systemFontOfSize:20]];
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeImageView.mas_right).offset(10);
        make.top.equalTo(self.timeImageView.mas_top);
        make.height.equalTo(@30);
        make.right.equalTo(self).offset(-60);
    }];
    
    //输入内容框
    self.contentTextField = [[UITextField alloc] init];
    self.contentTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.contentTextField.placeholder = @"请输入你要发送的内容!";
    self.contentTextField.textAlignment = NSTextAlignmentLeft;
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
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
