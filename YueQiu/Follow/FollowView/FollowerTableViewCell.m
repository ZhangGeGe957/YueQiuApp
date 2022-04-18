//
//  FollowerTableViewCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import "FollowerTableViewCell.h"
#import "Masonry.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation FollowerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([reuseIdentifier isEqualToString:@"background"]) {
        self.backgroundImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.backgroundImageView];
        [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(W, H / 2 - 100));
        }];
        
        
        self.headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headImageView];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backgroundImageView.mas_bottom).offset(-50);
            make.left.equalTo(self.contentView.mas_left).offset(W / 2 - 50);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        self.headImageView.layer.masksToBounds = YES;
        self.headImageView.layer.cornerRadius = 50;
        
        self.sexImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.sexImageView];
        [self.sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.headImageView.mas_bottom).offset(-30);
                    make.left.equalTo(self.headImageView.mas_right).offset(-30);
                    make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        self.nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImageView.mas_bottom).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(W / 2 - 150);
            make.size.mas_equalTo(CGSizeMake(300, 30));
        }];
        self.nameLabel.font = [UIFont systemFontOfSize:18];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
    } else if ([reuseIdentifier isEqualToString:@"other"]) {
        self.signatureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gexingqianming-2.png"]];
        [self.contentView addSubview:self.signatureImageView];
        [self.signatureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.contentView.mas_top).offset(10);
                    make.left.equalTo(self.contentView.mas_left).offset(10);
                    make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        
        self.contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.signatureImageView.mas_right).offset(10);
            make.width.mas_equalTo(W - 80);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(10);
        }];
        
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.numberOfLines = 0;
    } else {
        self.followButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:self.followButton];
        [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(50);
            make.left.equalTo(self.contentView.mas_left).offset(W / 2 - 50);
            make.size.mas_equalTo(CGSizeMake(100, 50));
        }];
        self.followButton.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    
    
    return self;
}
@end
