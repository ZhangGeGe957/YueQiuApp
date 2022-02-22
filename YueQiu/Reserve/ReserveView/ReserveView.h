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

@end

NS_ASSUME_NONNULL_END
