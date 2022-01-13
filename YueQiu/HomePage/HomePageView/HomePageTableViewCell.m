//
//  HomePageTableViewCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/1/8.
//

#import "HomePageTableViewCell.h"
#import "Masonry.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation HomePageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([reuseIdentifier isEqualToString:@"0"]) {
        return self;
    } else {
        self.nameButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.nameButton.titleLabel.tintColor = [UIColor blackColor];
        self.nameButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.nameButton];
        [self.nameButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(H / 80);
                    make.left.equalTo(self.contentView).offset(0);
                    make.size.mas_equalTo(CGSizeMake(W / 4, H / 30));
        }];

        
        self.placeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        self.placeButton.titleLabel.tintColor = [UIColor blackColor];
        self.placeButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.placeButton];
        [self.placeButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.nameButton.mas_bottom).offset(H / 100);
                    make.left.equalTo(self.nameButton.mas_left).offset(0);
                    make.size.mas_equalTo(CGSizeMake(W / 4, H / 40));
        }];
        
        self.distanceButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.distanceButton.titleLabel.tintColor = [UIColor colorWithWhite:0.5 alpha:0.6];
        self.distanceButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.distanceButton];
        [self.distanceButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.placeButton.mas_bottom).offset(0);
                make.left.equalTo(self.placeButton.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(W / 4, H / 20));
        }];
        UIView* footView = [[UIView alloc] init];
        [self.contentView addSubview:footView];
        [footView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.distanceButton.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.width.mas_equalTo(self.contentView.mas_width);
            make.height.mas_equalTo(H / 40);
        }];
        footView.backgroundColor = [UIColor grayColor];
        
        self.typeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:self.typeButton];
        [self.typeButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView.mas_top).offset(H / 80);
                    make.left.equalTo(self.nameButton.mas_right).offset(W / 70);
                    make.size.mas_equalTo(CGSizeMake(W / 6, H / 20));
        }];
        self.typeButton.tintColor = [UIColor orangeColor];
        self.typeButton.titleLabel.font = [UIFont systemFontOfSize:20];
        
        
        self.priceButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:self.priceButton];
        [self.priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(footView.mas_top).offset(- H / 80);
                    make.left.equalTo(self.nameButton.mas_right).offset(W / 70);
                    make.size.mas_equalTo(CGSizeMake(W / 6, H / 20));
        }];
        self.priceButton.tintColor = [UIColor orangeColor];
        self.priceButton.titleLabel.font = [UIFont systemFontOfSize:20];
        
        self.scheduleButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:self.scheduleButton];
        [self.scheduleButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.nameButton.mas_top).offset(H / 50);
                    make.left.equalTo(self.typeButton.mas_right).offset(W / 40);
                    make.size.mas_equalTo(CGSizeMake(W / 5, H / 20));
        }];
        self.scheduleButton.tintColor = [UIColor whiteColor];
        self.scheduleButton.backgroundColor = [UIColor orangeColor];
        [self.scheduleButton setTitle:@"预定" forState:UIControlStateNormal];
        self.scheduleButton.titleLabel.font = [UIFont systemFontOfSize:30];
        self.scheduleButton.layer.borderWidth = 1;
        self.scheduleButton.layer.cornerRadius = 20;
        
        return self;
    }
    
}


@end
