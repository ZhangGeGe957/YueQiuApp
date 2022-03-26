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
@property (nonatomic, strong) UIButton *moreButton;  //更多按钮
@property (nonatomic, strong) UIImageView *locationImageView;  //地点图像
@property (nonatomic, strong) UIImageView *timeImageView;  //时间图像
@property (nonatomic, strong) UIImageView *contentImageView;  //内容图像
@property (nonatomic, strong) UIButton *replyButton;  //回复按钮
@property (nonatomic, strong) UIButton *reserveButton;  //预约按钮
@property (nonatomic, strong) UILabel *bottomLine;  //分割线
@property (nonatomic, strong) UIImageView *VIPImageView;  //会员图标

//跟数据变的
@property (nonatomic, strong) UIButton *headButton;  //头像按钮
@property (nonatomic, strong) UILabel *titleNameLabel;  //名称
@property (nonatomic, strong) UILabel *locationLabel;  //地点
@property (nonatomic, strong) UILabel *timeLabel;  //时间
@property (nonatomic, strong) UILabel *contentLabel;  //内容

@end

NS_ASSUME_NONNULL_END
