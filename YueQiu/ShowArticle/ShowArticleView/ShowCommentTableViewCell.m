//
//  ShowCommentTableViewCell.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/5/5.
//

#import "ShowCommentTableViewCell.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ShowCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"comment"]) {
        self.myHeadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.myHeadButton.layer.masksToBounds = YES;
        self.myHeadButton.layer.cornerRadius = 25;
        [self.contentView addSubview:self.myHeadButton];
        
        self.myNameLabel = [[UILabel alloc] init];
        self.myNameLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.myNameLabel];
        
        self.myCommentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.myCommentLabel];
    }
    
    return self;
}

- (void)layoutSubviews {
    if ([self.reuseIdentifier isEqualToString:@"comment"]) {
        [self.myHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(@50);
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(15);
        }];
        [self.myNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.myHeadButton.mas_right).offset(10);
            make.top.equalTo(self.myHeadButton.mas_top);
            make.height.equalTo(@30);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        [self.myCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.myHeadButton.mas_right).offset(15);
            make.top.equalTo(self.myNameLabel.mas_bottom).offset(5);
            make.height.equalTo(@30);
            make.right.equalTo(self.mas_right).offset(-15);
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
