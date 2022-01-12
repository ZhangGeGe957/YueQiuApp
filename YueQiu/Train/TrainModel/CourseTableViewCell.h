//
//  CourseTableViewCell.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/10.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface CourseTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *showImageView;
@property (nonatomic, strong) UIButton *joinButton;
@property (nonatomic, strong) UILabel *courseLabel;
@property (nonatomic, strong) UILabel *teacherLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *courseName;
@property (nonatomic, strong) UILabel *teacherName;
@property (nonatomic, strong) UILabel *timeName;
@property (nonatomic, strong) UILabel *bottomLine;

@end

NS_ASSUME_NONNULL_END
