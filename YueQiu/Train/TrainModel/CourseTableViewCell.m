//
//  CourseTableViewCell.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/10.
//

#import "CourseTableViewCell.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation CourseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"Course"]) {
        //训练图片展示
        self.showImageView = [[UIImageView alloc] init];
        self.showImageView.layer.masksToBounds = YES;
        self.showImageView.layer.cornerRadius = 10;
        [self.contentView addSubview:self.showImageView];
        
        //固定的Label名称
        self.courseLabel = [[UILabel alloc] init];
        self.courseLabel.text = @"课程名称：";
        self.courseLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.courseLabel];
        self.teacherLabel = [[UILabel alloc] init];
        self.teacherLabel.text = @"教练名称：";
        self.teacherLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.teacherLabel];
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.text = @"课程时间：";
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.timeLabel];
        
        //变化的Label名称
    }
    
    return self;
}

- (void)layoutSubviews {
    if ([self.reuseIdentifier isEqualToString:@"Course"]) {
        [self.showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(myHeight / 88));
            make.left.equalTo(@(myWidth / 44));
            make.right.equalTo(@(-myWidth / 44));
            make.height.equalTo(@(myHeight / 4));
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
