//
//  MyTableViewCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/3.
//

#import "MyTableViewCell.h"
#import "Masonry.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "UIImageView+WebCache.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([reuseIdentifier isEqualToString:@"background"]) {
        self.backImageView = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backImageView.tag = 111;
        [self.backImageView sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://lijiaxuan.oss-cn-shanghai.aliyuncs.com/default/background.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"beijing.jpeg"]];
        [self.contentView addSubview:self.backImageView];
        [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.width.mas_equalTo(W);
        }];
    } else if([reuseIdentifier isEqualToString:@"MyMessage"]) {
        self.buttonHead = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonHead.tag = 1111;
        [self.buttonHead sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://lijiaxuan.oss-cn-shanghai.aliyuncs.com/default/head_portrait.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"head.jpeg"]];
        [self.contentView addSubview:self.buttonHead];
        [self.buttonHead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        self.buttonHead.layer.cornerRadius = 50;
        self.buttonHead.layer.masksToBounds = YES;
        
        self.labelName = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelName];
        [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.buttonHead.mas_top).offset(10);
            make.left.equalTo(self.buttonHead.mas_right).offset(20);
            make.size.mas_equalTo(CGSizeMake(W / 3, 30));
        }];
        self.labelName.textAlignment = NSTextAlignmentLeft;
        self.labelName.font = [UIFont systemFontOfSize:23];
        
        self.labelPersonalSignature = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelPersonalSignature];
        [self.labelPersonalSignature mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.labelName.mas_bottom).offset(10);
            make.left.equalTo(self.labelName.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(W * 2 / 3, 30));
        }];
        self.labelPersonalSignature.numberOfLines = 1;
        self.labelPersonalSignature.font = [UIFont systemFontOfSize:15];
    } else {
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect tempFrame = self.textLabel.frame;
    tempFrame.origin.x = 30;
    self.textLabel.frame = tempFrame;
}

@end
