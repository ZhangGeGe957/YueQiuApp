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
    if ([reuseIdentifier isEqualToString:@"imageView"]) {
        
        [MAMapView updatePrivacyShow:AMapPrivacyShowStatusDidShow privacyInfo:AMapPrivacyInfoStatusDidContain];
        [MAMapView updatePrivacyAgree:AMapPrivacyAgreeStatusDidAgree];
        
        _mapView = [[MAMapView alloc] init];
        [self.contentView addSubview:_mapView];
        
        [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(W, H / 2));
        }];
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = MAUserTrackingModeFollow;
        
        MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
        r.showsHeadingIndicator = YES;
        r.image = [UIImage imageNamed:@"daohang.png"];
        [self.mapView updateUserLocationRepresentation:r];
        
        
        
        return self;
    } else {
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.tintColor = [UIColor blackColor];
        self.nameLabel.font = [UIFont systemFontOfSize:14];
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.numberOfLines = 0;
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView).offset(H / 80);
                    make.left.equalTo(self.contentView.mas_left).offset(10);
                    make.size.mas_equalTo(CGSizeMake(W * 2/ 3, H / 30));
        }];

        
        self.placeLabel = [[UILabel alloc] init];
        self.placeLabel.tintColor = [UIColor blackColor];
        self.placeLabel.font = [UIFont systemFontOfSize:12];
        self.placeLabel.textAlignment = NSTextAlignmentLeft;
        self.placeLabel.numberOfLines = 0;
        [self.contentView addSubview:self.placeLabel];
        [self.placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.nameLabel.mas_bottom).offset(0);
                    make.left.equalTo(self.nameLabel.mas_left).offset(0);
                    make.size.mas_equalTo(CGSizeMake(W * 2/ 3, H / 30));
        }];
        
        self.distanceLabel = [[UILabel alloc] init];
        self.distanceLabel.tintColor = [UIColor colorWithWhite:0.5 alpha:0.6];
        self.distanceLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.distanceLabel];
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.placeLabel.mas_bottom).offset(0);
                make.left.equalTo(self.placeLabel.mas_left).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            make.size.mas_equalTo(CGSizeMake(W / 4, H / 30));
        }];
        
//        self.typeLabel = [[UILabel alloc] init];
//        [self.contentView addSubview:self.typeLabel];
//        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.top.equalTo(self.contentView.mas_top).offset(H / 80);
//                    make.left.equalTo(self.nameLabel.mas_right).offset(W / 10);
//                    make.size.mas_equalTo(CGSizeMake(W / 4, H / 20));
//        }];
//        self.typeLabel.tintColor = [UIColor orangeColor];
//        self.typeLabel.font = [UIFont systemFontOfSize:12];
//
//
//        self.priceLabel = [[UILabel alloc] init];
//        [self.contentView addSubview:self.priceLabel];
//        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.top.equalTo(_distanceLabel.mas_top).offset(0);
//                    make.left.equalTo(self.typeLabel.mas_left).offset(0);
//                    make.size.mas_equalTo(CGSizeMake(W / 4, H / 20));
//        }];
//        self.priceLabel.tintColor = [UIColor orangeColor];
//        self.priceLabel.font = [UIFont systemFontOfSize:12];
        
        self.scheduleButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.scheduleButton.layer.masksToBounds = YES;
        self.scheduleButton.layer.cornerRadius = 10;
        [self.contentView addSubview:self.scheduleButton];
        [self.scheduleButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.placeLabel.mas_top).offset(H / 50);
                    make.right.equalTo(self.contentView.mas_right).offset(-20);
                    make.size.mas_equalTo(CGSizeMake(W / 6, H / 40));
        }];
        self.scheduleButton.tintColor = [UIColor whiteColor];
        self.scheduleButton.backgroundColor = [UIColor orangeColor];
        [self.scheduleButton setTitle:@"预定" forState:UIControlStateNormal];
        self.scheduleButton.titleLabel.font = [UIFont systemFontOfSize:20];

        
        return self;
    }
    
}

@end
