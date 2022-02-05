//
//  MyTableViewCell.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property (nonatomic, strong) UIProgressView* progressView;
@property (nonatomic, strong) UILabel* courseLabel;
@property (nonatomic, strong) UILabel* stadiumLabel;
@property (nonatomic, strong) UILabel* stadiumPlaceLabel;
@property (nonatomic, strong) UIButton* buttonGPS;
@end

NS_ASSUME_NONNULL_END
