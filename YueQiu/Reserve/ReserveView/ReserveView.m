//
//  ReserveView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/21.
//

#import "ReserveView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ReserveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    [self p_initViewUI];
    
    return self;
}

- (void)p_initViewUI {
    //返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui2.png"] forState:UIControlStateNormal];
    [self addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.rectStatus.size.height + 20);
        make.left.equalTo(self).offset(20);
        make.size.equalTo(@30);
    }];
    
    //标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"预定";
    [self.titleLabel setFont:[UIFont systemFontOfSize:32]];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(self.rectStatus.size.height + 20);
    }];
    
    //名称
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"名字";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.layer.borderWidth = 0.5;
    self.nameLabel.layer.cornerRadius = 10;
    self.nameLabel.layer.masksToBounds = YES;
    [self.nameLabel setFont:[UIFont systemFontOfSize:24]];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel).offset(50);
        make.left.equalTo(self).offset(30);
        make.height.equalTo(@30);
        make.width.equalTo(@150);
    }];
    
    //球馆照片
    self.stadiumImageView = [[UIImageView alloc] init];
    self.stadiumImageView.image = [UIImage imageNamed:@"2-1.png"];
    [self addSubview:self.stadiumImageView];
    [self.stadiumImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(20);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.height.equalTo(@180);
    }];
    
    //图标
    self.locationImageView = [[UIImageView alloc] init];
    self.locationImageView.image = [UIImage imageNamed:@"weizhi.png"];
    [self addSubview:self.locationImageView];
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.stadiumImageView.mas_left);
        make.top.equalTo(self.stadiumImageView.mas_bottom).offset(20);
        make.size.equalTo(@30);
    }];
    self.phoneImageView = [[UIImageView alloc] init];
    self.phoneImageView.image = [UIImage imageNamed:@"dianhua.png"];
    [self addSubview:self.phoneImageView];
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.stadiumImageView.mas_left);
        make.top.equalTo(self.locationImageView.mas_bottom).offset(20);
        make.size.equalTo(@30);
    }];
    self.moneyImageView = [[UIImageView alloc] init];
    self.moneyImageView.image = [UIImage imageNamed:@"qian.png"];
    [self addSubview:self.moneyImageView];
    [self.moneyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.stadiumImageView.mas_left);
        make.top.equalTo(self.phoneImageView.mas_bottom).offset(20);
        make.size.equalTo(@30);
    }];
    self.timeImageView = [[UIImageView alloc] init];
    self.timeImageView.image = [UIImage imageNamed:@"shijian.png"];
    [self addSubview:self.timeImageView];
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX);
        make.top.equalTo(self.phoneImageView.mas_top);
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
        make.height.equalTo(@30);
        make.width.equalTo(@300);
    }];
    self.phoneLabel = [[UILabel alloc] init];
    self.phoneLabel.text = @"xxxxxxxxxxx";
    self.phoneLabel.layer.borderWidth = 0.5;
    self.phoneLabel.layer.cornerRadius = 10;
    self.phoneLabel.layer.masksToBounds = YES;
    self.phoneLabel.textAlignment = NSTextAlignmentCenter;
    [self.phoneLabel setFont:[UIFont systemFontOfSize:20]];
    [self addSubview:self.phoneLabel];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneImageView.mas_right).offset(10);
        make.right.equalTo(self.timeImageView.mas_left).offset(-10);
        make.top.equalTo(self.phoneImageView.mas_top);
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
        make.left.equalTo(self.timeImageView.mas_right).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self.timeImageView.mas_top);
        make.height.equalTo(@30);
    }];
    self.moneyLabel = [[UILabel alloc] init];
    self.moneyLabel.text = @"30/h";
    self.moneyLabel.layer.borderWidth = 0.5;
    self.moneyLabel.layer.cornerRadius = 10;
    self.moneyLabel.layer.masksToBounds = YES;
    self.moneyLabel.textAlignment = NSTextAlignmentCenter;
    [self.moneyLabel setFont:[UIFont systemFontOfSize:20]];
    [self addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyImageView.mas_right).offset(10);
        make.top.equalTo(self.moneyImageView.mas_top);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    
    //小view
    self.littleView = [[UIView alloc] init];
    self.littleView.backgroundColor = [UIColor whiteColor];
    self.littleView.layer.cornerRadius = 10;
    self.littleView.layer.masksToBounds = YES;
    self.littleView.layer.borderWidth = 0.5;
    [self addSubview:self.littleView];
    [self.littleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moneyImageView.mas_bottom).offset(20);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.height.equalTo(@170);
    }];
    self.havePeopleShowLittleLabel = [[UILabel alloc] init];
    self.havePeopleShowLittleLabel.text = @"已有人数";
    self.havePeopleShowLittleLabel.textAlignment = NSTextAlignmentCenter;
    self.havePeopleShowLittleLabel.layer.cornerRadius = 10;
    self.havePeopleShowLittleLabel.layer.masksToBounds = YES;
    self.havePeopleShowLittleLabel.layer.borderWidth = 0.5;
    [self.littleView addSubview:self.havePeopleShowLittleLabel];
    [self.havePeopleShowLittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.littleView).offset(20);
        make.top.equalTo(self.littleView).offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    self.waitPeopleShowLittleLabel = [[UILabel alloc] init];
    self.waitPeopleShowLittleLabel.text = @"等待人数";
    self.waitPeopleShowLittleLabel.textAlignment = NSTextAlignmentCenter;
    self.waitPeopleShowLittleLabel.layer.cornerRadius = 10;
    self.waitPeopleShowLittleLabel.layer.masksToBounds = YES;
    self.waitPeopleShowLittleLabel.layer.borderWidth = 0.5;
    [self.littleView addSubview:self.waitPeopleShowLittleLabel];
    [self.waitPeopleShowLittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.littleView).offset(20);
        make.top.equalTo(self.havePeopleShowLittleLabel.mas_bottom).offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    self.timeShowLittleLabel = [[UILabel alloc] init];
    self.timeShowLittleLabel.text = @"时间";
    self.timeShowLittleLabel.textAlignment = NSTextAlignmentCenter;
    self.timeShowLittleLabel.layer.cornerRadius = 10;
    self.timeShowLittleLabel.layer.masksToBounds = YES;
    self.timeShowLittleLabel.layer.borderWidth = 0.5;
    [self.littleView addSubview:self.timeShowLittleLabel];
    [self.timeShowLittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.littleView).offset(20);
        make.top.equalTo(self.waitPeopleShowLittleLabel.mas_bottom).offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    self.havePeopleLittleLabel = [[UILabel alloc] init];
    self.havePeopleLittleLabel.text = @"3232";
    self.havePeopleLittleLabel.textAlignment = NSTextAlignmentCenter;
    self.havePeopleLittleLabel.layer.cornerRadius = 10;
    self.havePeopleLittleLabel.layer.masksToBounds = YES;
    self.havePeopleLittleLabel.layer.borderWidth = 0.5;
    [self.littleView addSubview:self.havePeopleLittleLabel];
    [self.havePeopleLittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.havePeopleShowLittleLabel.mas_right).offset(50);
        make.right.equalTo(self.littleView.mas_right).offset(-50);
        make.top.equalTo(self.havePeopleShowLittleLabel.mas_top);
        make.height.equalTo(@30);
    }];
    self.waitPeopleLittleLabel = [[UILabel alloc] init];
    self.waitPeopleLittleLabel.text = @"34234";
    self.waitPeopleLittleLabel.textAlignment = NSTextAlignmentCenter;
    self.waitPeopleLittleLabel.layer.cornerRadius = 10;
    self.waitPeopleLittleLabel.layer.masksToBounds = YES;
    self.waitPeopleLittleLabel.layer.borderWidth = 0.5;
    [self.littleView addSubview:self.waitPeopleLittleLabel];
    [self.waitPeopleLittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.waitPeopleShowLittleLabel.mas_right).offset(50);
        make.right.equalTo(self.littleView.mas_right).offset(-50);
        make.top.equalTo(self.waitPeopleShowLittleLabel.mas_top);
        make.height.equalTo(@30);
    }];
    self.timeLittleLabel = [[UILabel alloc] init];
    self.timeLittleLabel.text = @"时间";
    self.timeLittleLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLittleLabel.layer.cornerRadius = 10;
    self.timeLittleLabel.layer.masksToBounds = YES;
    self.timeLittleLabel.layer.borderWidth = 0.5;
    [self.littleView addSubview:self.timeLittleLabel];
    [self.timeLittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeShowLittleLabel.mas_right).offset(50);
        make.right.equalTo(self.littleView.mas_right).offset(-50);
        make.top.equalTo(self.timeShowLittleLabel.mas_top);
        make.height.equalTo(@30);
    }];
    
    //预定按钮
    self.reserveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.reserveButton setTitle:@"预定" forState:UIControlStateNormal];
    self.reserveButton.titleLabel.font = [UIFont systemFontOfSize:22];
    self.reserveButton.layer.cornerRadius = 25;
    self.reserveButton.layer.masksToBounds = YES;
    self.reserveButton.tintColor = [UIColor whiteColor];
    self.reserveButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.reserveButton];
    [self.reserveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.littleView.mas_bottom).offset(20);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
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
