//
//  NewsTableViewCell.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/21.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell

//固定的
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIImageView *locationImageView;
@property (nonatomic, strong) UIImageView *timeImageView;
@property (nonatomic, strong) UIImageView *teamImageView;
@property (nonatomic, strong) UIImageView *contentImageView;

//跟数据变的
@property (nonatomic, strong) UIButton *headButton;
@property (nonatomic, strong) UILabel *titleNameLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *teamLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

NS_ASSUME_NONNULL_END
