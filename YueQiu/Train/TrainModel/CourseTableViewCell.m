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
        [self.courseLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22]];
        self.courseLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.courseLabel];
        self.teacherLabel = [[UILabel alloc] init];
        self.teacherLabel.text = @"教练：";
        [self.teacherLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        self.teacherLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.teacherLabel];
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.text = @"课时：";
        [self.timeLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.timeLabel];
        
        //变化的Label名称
        self.courseName = [[UILabel alloc] init];
        [self.courseName setFont:[UIFont systemFontOfSize:21]];
        self.courseName.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.courseName];
        self.teacherName = [[UILabel alloc] init];
        [self.teacherName setFont:[UIFont systemFontOfSize:19]];
        self.teacherName.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.teacherName];
        self.timeName = [[UILabel alloc] init];
        [self.timeName setFont:[UIFont systemFontOfSize:19]];
        self.timeName.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.timeName];
        
        //按钮
        self.joinButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.joinButton setTitle:@"加入课程" forState:UIControlStateNormal];
        self.joinButton.backgroundColor = [UIColor orangeColor];
        [self.joinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.joinButton.layer.masksToBounds = YES;
        self.joinButton.layer.cornerRadius = 10;
        [self.contentView addSubview:self.joinButton];
        
        //分割线
        self.bottomLine = [[UILabel alloc] init];
        self.bottomLine.backgroundColor = [UIColor systemGrayColor];
        self.bottomLine.text = @"";
        [self.contentView addSubview:self.bottomLine];
    }
    
    return self;
}

- (void)layoutSubviews {
    if ([self.reuseIdentifier isEqualToString:@"Course"]) {
        [self.showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(myHeight / 88));
            make.left.equalTo(@(myWidth / 44));
            make.right.equalTo(@(-myWidth / 44));
            make.height.equalTo(@(myHeight / 5));
        }];
        //固定的Label约束
        [self.courseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.showImageView).offset(myHeight / 5);
            make.left.equalTo(@(myWidth / 44));
            make.height.equalTo(@(myHeight / 30));
        }];
        [self.teacherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.courseLabel).offset(myHeight / 30);
            make.left.equalTo(@(myWidth / 44));
            make.height.equalTo(@(myHeight / 40));
        }];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.teacherLabel).offset(myHeight / 40);
            make.left.equalTo(@(myWidth / 44));
            make.height.equalTo(@(myHeight / 40));
        }];
        
        //变化的Label约束
        [self.courseName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.courseLabel.mas_bottom).offset(0);
            make.left.equalTo(self.courseLabel.mas_right).offset(0);
            make.height.equalTo(@(myHeight / 30));
        }];
        [self.teacherName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.teacherLabel.mas_bottom).offset(0);
            make.left.equalTo(self.teacherLabel.mas_right).offset(0);
            make.height.equalTo(@(myHeight / 40));
        }];
        [self.timeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.timeLabel.mas_bottom).offset(0);
            make.left.equalTo(self.timeLabel.mas_right).offset(0);
            make.height.equalTo(@(myHeight / 40));
        }];
        
        //按钮
        [self.joinButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.timeName.mas_bottom).offset(0);
            make.right.equalTo(@(-myWidth / 44));
            make.width.equalTo(@(myWidth / 5));
            make.height.equalTo(@(myHeight / 30));
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
