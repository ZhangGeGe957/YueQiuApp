//
//  CourseAndStadiumCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import "CourseAndStadiumCell.h"
#import "Masonry.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation CourseAndStadiumCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([reuseIdentifier isEqualToString:@"course"]) {
        self.courseLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.courseLabel];
        [self.courseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView.mas_top).offset(20);
                    make.left.equalTo(self.contentView.mas_left).offset(10);
                    make.size.mas_equalTo(CGSizeMake(W / 3, 30));
        }];

        self.progressView = [[UIProgressView alloc] init];
        [self.contentView addSubview:self.progressView];
        [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.courseLabel.mas_top).offset(15);
            make.left.equalTo(self.courseLabel.mas_right).offset(10);
            make.size.mas_equalTo(CGSizeMake(W / 3, 10));
        }];
        self.progressView.progressTintColor = [UIColor blueColor];

        UIButton* buttonStudy = [UIButton buttonWithType:UIButtonTypeSystem];
        [buttonStudy setTitle:@"学习" forState:UIControlStateNormal];
        [self.contentView addSubview:buttonStudy];
        [buttonStudy mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.courseLabel.mas_top).offset(0);
            make.left.equalTo(self.progressView.mas_right).offset(10);
            make.size.mas_equalTo(CGSizeMake(W / 5, 40));
        }];
        buttonStudy.titleLabel.font = [UIFont systemFontOfSize:20];
    } else if ([reuseIdentifier isEqualToString:@"stadium"]) {
        self.stadiumLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.stadiumLabel];
        [self.stadiumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView.mas_top).offset(10);
                    make.left.equalTo(self.contentView.mas_left).offset(10);
                    make.size.mas_equalTo(CGSizeMake(W / 2, 20));
        }];
        self.stadiumLabel.textAlignment = NSTextAlignmentLeft;
        self.stadiumLabel.font = [UIFont systemFontOfSize:15];

        self.stadiumPlaceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.stadiumPlaceLabel];
        [self.stadiumPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.stadiumLabel.mas_bottom).offset(0);
                    make.left.equalTo(self.stadiumLabel.mas_left).offset(0);
                    make.size.mas_equalTo(CGSizeMake(W * 0.75, 40));
        }];
        self.stadiumPlaceLabel.font = [UIFont systemFontOfSize:15];
        self.stadiumPlaceLabel.textColor = [UIColor grayColor];
        self.stadiumPlaceLabel.numberOfLines = 0;
        
        self.buttonGPS = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:self.buttonGPS];
        [self.buttonGPS setImage:[UIImage imageNamed:@"dingwei.png"] forState:UIControlStateNormal];
        [self.buttonGPS mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.left.equalTo(self.contentView.mas_right).offset(-50);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    
    return self;
}


@end
