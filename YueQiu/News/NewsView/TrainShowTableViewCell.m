//
//  TrainShowTableViewCell.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/28.
//

#import "TrainShowTableViewCell.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation TrainShowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        self.showImageView = [[UIImageView alloc] init];
        self.showImageView.layer.cornerRadius = 10;
        self.showImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.showImageView];
        
        self.titleShowLabel = [[UILabel alloc] init];
        [self.titleShowLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        self.titleShowLabel.numberOfLines = 0;
        self.titleShowLabel.textAlignment = NSTextAlignmentLeft;
        //断行
        self.titleShowLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.titleShowLabel];
        
        self.readpersonLabel = [[UILabel alloc] init];
        [self.readpersonLabel setFont:[UIFont fontWithName:@"ArialMT" size:16]];
        self.readpersonLabel.textColor = [UIColor systemGray2Color];
        [self.contentView addSubview:self.readpersonLabel];
    }
    
    return self;
}

- (void)layoutSubviews {
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        [self.showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(@100);
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(10);
        }];
        [self.titleShowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.showImageView.mas_top);
            make.left.equalTo(self.showImageView.mas_right).offset(15);
            make.right.equalTo(self).offset(-15);
        }];
        [self.readpersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleShowLabel.mas_bottom).offset(10);
            make.bottom.equalTo(self.showImageView.mas_bottom);
            make.left.equalTo(self.titleShowLabel.mas_left);
            make.height.equalTo(@30);
            make.width.equalTo(@80);
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
