//
//  NewsTableViewCell.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/21.
//

#import "NewsTableViewCell.h"
#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        self.headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.headButton.layer.masksToBounds = YES;
        self.headButton.layer.cornerRadius = 25;
        [self.contentView addSubview:self.headButton];
        
        self.titleNameLabel = [[UILabel alloc] init];
        self.titleNameLabel.textColor = [UIColor blackColor];
        [self.titleNameLabel setFont:[UIFont systemFontOfSize:26]];
        [self.contentView addSubview:self.titleNameLabel];
        
        self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.moreButton setImage:[UIImage imageNamed:@"gengduo.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.moreButton];
        
        //四个固定图像
        self.locationImageView = [[UIImageView alloc] init];
        self.locationImageView.image = [UIImage imageNamed:@"didian.png"];
        [self.contentView addSubview:self.locationImageView];
        self.timeImageView = [[UIImageView alloc] init];
        self.timeImageView.image = [UIImage imageNamed:@"naozhong-copy.png"];
        [self.contentView addSubview:self.timeImageView];
        self.teamImageView = [[UIImageView alloc] init];
        self.teamImageView.image = [UIImage imageNamed:@"yonghu.png"];
        [self.contentView addSubview:self.teamImageView];
        self.contentImageView = [[UIImageView alloc] init];
        self.contentImageView.image = [UIImage imageNamed:@"neirong.png"];
        [self.contentView addSubview:self.contentImageView];
        
        //四个根据数据变的
        self.locationLabel = [[UILabel alloc] init];
        self.locationLabel.textColor = [UIColor blackColor];
        [self.locationLabel setFont:[UIFont systemFontOfSize:18]];
        [self.contentView addSubview:self.locationLabel];
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textColor = [UIColor blackColor];
        [self.timeLabel setFont:[UIFont systemFontOfSize:18]];
        [self.contentView addSubview:self.timeLabel];
        self.teamLabel = [[UILabel alloc] init];
        self.teamLabel.textColor = [UIColor blackColor];
        [self.teamLabel setFont:[UIFont systemFontOfSize:18]];
        [self.contentView addSubview:self.teamLabel];
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.textColor = [UIColor blackColor];
        [self.contentLabel setFont:[UIFont systemFontOfSize:18]];
        [self.contentView addSubview:self.contentLabel];
        
        self.replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.replyButton setImage:[UIImage imageNamed:@"huifu.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.replyButton];
        
        //预约按钮
        self.reserveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.reserveButton setTitle:@"抢" forState:UIControlStateNormal];
        self.reserveButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:22];
        self.reserveButton.layer.masksToBounds = YES;
        self.reserveButton.layer.cornerRadius = 15;
        self.reserveButton.backgroundColor = [UIColor orangeColor];
        self.reserveButton.tintColor = [UIColor whiteColor];
        [self.contentView addSubview:self.reserveButton];
        
        //分割线
        self.bottomLine = [[UILabel alloc] init];
        self.bottomLine.backgroundColor = [UIColor systemGrayColor];
        self.bottomLine.text = @"";
        [self.contentView addSubview:self.bottomLine];
        
        //会员图标
        self.VIPImageView = [[UIImageView alloc] init];
        self.VIPImageView.image = [UIImage imageNamed:@"renzheng1-copy.png"];
        [self.contentView addSubview:self.VIPImageView];
    }
    
    return self;
}

- (void)layoutSubviews {
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        [self.headButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
            make.size.equalTo(@50);
        }];
        [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headButton.mas_top).offset(15);
            make.right.equalTo(self).offset(-20);
            make.size.equalTo(@20);
        }];
        [self.titleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headButton.mas_right).offset(10);
            make.top.equalTo(self.headButton.mas_top);
            make.height.equalTo(@50);
        }];
        [self.VIPImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleNameLabel.mas_right).offset(10);
            make.top.equalTo(self.moreButton.mas_top);
            make.size.equalTo(@20);
        }];
        
        //四个固定的图像
        [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headButton.mas_bottom).offset(10);
            make.left.equalTo(self.headButton.mas_left);
            make.size.equalTo(@30);
        }];
        [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.locationImageView.mas_bottom).offset(10);
            make.left.equalTo(self.headButton.mas_left);
            make.size.equalTo(@30);
        }];
        [self.teamImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeImageView.mas_bottom).offset(10);
            make.left.equalTo(self.headButton.mas_left);
            make.size.equalTo(@30);
        }];
        [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.teamImageView.mas_bottom).offset(10);
            make.left.equalTo(self.headButton.mas_left);
            make.size.equalTo(@30);
        }];
        
        //回复按钮
        [self.replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.left.equalTo(self.headButton.mas_left).offset(10);
            make.size.equalTo(@40);
        }];
        
        //预约按钮
        [self.reserveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.moreButton.mas_right);
            make.bottom.equalTo(self.replyButton.mas_bottom);
            make.width.equalTo(@88);
            make.height.equalTo(@40);
        }];
        
        //四个可变的
        [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.locationImageView.mas_top);
            make.left.equalTo(self.locationImageView.mas_right).offset(10);
            make.right.equalTo(self.moreButton.mas_left).offset(10);
            make.height.equalTo(@30);
        }];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeImageView.mas_top);
            make.left.equalTo(self.timeImageView.mas_right).offset(10);
            make.right.equalTo(self.moreButton.mas_left).offset(10);
            make.height.equalTo(@30);
        }];
        [self.teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.teamImageView.mas_top);
            make.left.equalTo(self.teamImageView.mas_right).offset(10);
            make.right.equalTo(self.moreButton.mas_left).offset(10);
            make.height.equalTo(@30);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentImageView.mas_top);
            make.left.equalTo(self.contentImageView.mas_right).offset(10);
            make.right.equalTo(self.moreButton.mas_left).offset(10);
            make.bottom.equalTo(self.replyButton.mas_top).offset(-10);
        }];
        
        //分割线
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.left.equalTo(@(myWidth / 44));
            make.right.equalTo(@(-myWidth / 44));
            make.height.equalTo(@0.5);
        }];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
