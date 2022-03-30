//
//  ShowArticleView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowArticleView : UIView

@property (nonatomic, strong) UIButton *userImageView;  //用户图片
@property (nonatomic, strong) UIImageView *locationImageView;  //定位图片
@property (nonatomic, strong) UIImageView *timeImageView;  //时间图片
@property (nonatomic, strong) UIImageView *contentImageView;  //内容图像

@property (nonatomic, strong) UILabel *userLabel;  //用户文字
@property (nonatomic, strong) UILabel *locationLabel;  //定位文字
@property (nonatomic, strong) UILabel *timeLabel;  //时间文字
@property (nonatomic, strong) UILabel *contentLabel;  //内容文字

@end

NS_ASSUME_NONNULL_END
