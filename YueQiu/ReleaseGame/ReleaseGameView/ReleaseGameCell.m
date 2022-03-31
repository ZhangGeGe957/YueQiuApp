//
//  ReleaseGameCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/28.
//

#import "ReleaseGameCell.h"
#import "Masonry.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation ReleaseGameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(W, 20));
    }];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    
    self.typeAndPlaceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.typeAndPlaceLabel];
    [self.typeAndPlaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.size.mas_equalTo(CGSizeMake(W * 0.75, 30));
    }];
    self.typeAndPlaceLabel.font = [UIFont systemFontOfSize:10];
    
    
    self.distanceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.distanceLabel];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(10);
        make.top.equalTo(self.typeAndPlaceLabel.mas_top).offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    self.distanceLabel.font = [UIFont systemFontOfSize:10];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect tempFrame = self.textLabel.frame;
    tempFrame.origin.x = 10;
    self.textLabel.frame = tempFrame;
}

@end
