//
//  ShowProjectTableViewCell.m
//  约球
//
//  Created by 张佳乔 on 2022/1/7.
//

#import "ShowProjectTableViewCell.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ShowProjectTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"project"]) {
        self.projectLabel = [[UILabel alloc] init];
        self.projectLabel.textAlignment = NSTextAlignmentCenter;
        [self.projectLabel setFont:[UIFont systemFontOfSize:22]];
        [self.contentView addSubview:self.projectLabel];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.projectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.width.equalTo(@(myWidth));
        make.height.equalTo(@(myHeight / 17));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (self.isSelected) {
        self.projectLabel.textColor = [UIColor systemBlueColor];
    } else {
        self.projectLabel.textColor = [UIColor blackColor];
    }
    //设置选中时为无状态
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the view for the selected state
}

@end
