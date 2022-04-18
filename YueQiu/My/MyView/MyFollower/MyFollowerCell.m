//
//  MyFollowerCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

#import "MyFollowerCell.h"
#import "Masonry.h"
@implementation MyFollowerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.headImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.headImageView];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = 30;
    
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:18];
    
    self.followButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.followButton];
    [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.top.equalTo(self.contentView.mas_top).offset(30);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    self.followButton.layer.masksToBounds = YES;
    self.followButton.layer.borderWidth = 1;
    self.followButton.layer.borderColor = [UIColor grayColor].CGColor;
    [self.followButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return self;
}

@end
