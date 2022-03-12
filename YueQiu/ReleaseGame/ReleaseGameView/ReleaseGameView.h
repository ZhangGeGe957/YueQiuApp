//
//  ReleaseGameView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReleaseGameView : UIView

@property (nonatomic, strong) UIImageView *locationImageView;  //位置图标
@property (nonatomic, strong) UIImageView *timeImageView;  //时间图标

@property (nonatomic, strong) UILabel *locationLabel;  //位置
@property (nonatomic, strong) UIDatePicker *showDatePicker;  //时间选择器

@property (nonatomic, strong) UITextField *contentTextField;  //内容框

@property (nonatomic, strong) UIButton *sendButton;  //发表按钮

@end

NS_ASSUME_NONNULL_END
