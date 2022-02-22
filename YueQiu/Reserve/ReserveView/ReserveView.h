//
//  ReserveView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReserveView : UIView

@property (nonatomic, strong) UIButton *backButton;  //返回按钮
@property (nonatomic, strong) UILabel *titleLabel;  //标题
@property CGRect rectStatus;  //记录状态栏高度

@property (nonatomic, strong) UILabel *nameLabel;  //名称

@property (nonatomic, strong) UIImageView *stadiumImageView; //球馆照片
@property (nonatomic, strong) UIImageView *locationImageView;  //位置图标
@property (nonatomic, strong) UIImageView *phoneImageView;  //电话图标
@property (nonatomic, strong) UIImageView *moneyImageView;  //价格图标
@property (nonatomic, strong) UIImageView *timeImageView;  //时间图标

@property (nonatomic, strong) UILabel *locationLabel;  //位置
@property (nonatomic, strong) UILabel *phoneLabel;  //电话
@property (nonatomic, strong) UILabel *moneyLabel;  //价格
@property (nonatomic, strong) UILabel *timeLabel;  //时间

@property (nonatomic, strong) UIView *littleView;  //小view
@property (nonatomic, strong) UILabel *havePeopleShowLittleLabel;  //已有人数showlabel
@property (nonatomic, strong) UILabel *waitPeopleShowLittleLabel;  //等待人数showlabel
@property (nonatomic, strong) UILabel *timeShowLittleLabel;  //时间showlabel
@property (nonatomic, strong) UILabel *havePeopleLittleLabel;  //已有人数
@property (nonatomic, strong) UILabel *waitPeopleLittleLabel;  //等待人数
@property (nonatomic, strong) UILabel *timeLittleLabel;  //时间


@property (nonatomic, strong) UIButton *reserveButton;  //预定按钮

@end

NS_ASSUME_NONNULL_END
