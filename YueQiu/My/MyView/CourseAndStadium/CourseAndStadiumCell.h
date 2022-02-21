//
//  CourseAndStadiumCell.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseAndStadiumCell : UITableViewCell
@property (nonatomic, strong) UIProgressView* progressView;
@property (nonatomic, strong) UILabel* courseLabel;

@property (nonatomic, strong) UILabel* stadiumLabel;
@property (nonatomic, strong) UILabel* stadiumPlaceLabel;
@property (nonatomic, strong) UIButton* buttonGPS;
@end

NS_ASSUME_NONNULL_END
