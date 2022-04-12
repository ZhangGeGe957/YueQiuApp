//
//  TrainView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrainView : UIView

@property (nonatomic, strong) UIButton *foodDistinguishButton;  //食物识别
@property (nonatomic, strong) UILabel *foodDistinguishLabel;
@property (nonatomic, strong) UIButton *apparatusDistinguishButton;  //器械识别
@property (nonatomic, strong) UILabel *apparatusDistinguishLabel;

@end

NS_ASSUME_NONNULL_END
