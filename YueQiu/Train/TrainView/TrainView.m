//
//  TrainView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/4/12.
//

#import "TrainView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation TrainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor whiteColor];
    [self p_initAllUI];
    
    return self;
}

- (void)p_initAllUI {
    //食物识别
    self.foodDistinguishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.foodDistinguishButton setImage:[UIImage imageNamed:@"huo.png"] forState:UIControlStateNormal];
    [self addSubview:self.foodDistinguishButton];
    [self.foodDistinguishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(-80);
        make.top.equalTo(self).offset(30);
        make.size.equalTo(@64);
    }];
    self.foodDistinguishLabel = [[UILabel alloc] init];
    self.foodDistinguishLabel.text = @"热量识别";
    [self.foodDistinguishLabel setFont:[UIFont systemFontOfSize:15]];
    self.foodDistinguishLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.foodDistinguishLabel];
    [self.foodDistinguishLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.foodDistinguishButton);
        make.top.equalTo(self.foodDistinguishButton.mas_bottom);
        make.width.equalTo(self.foodDistinguishButton.mas_width);
    }];
    
    //物品识别
    self.apparatusDistinguishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.apparatusDistinguishButton setImage:[UIImage imageNamed:@"wupinshibie.png"] forState:UIControlStateNormal];
    [self addSubview:self.apparatusDistinguishButton];
    [self.apparatusDistinguishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(80);
        make.top.equalTo(self.foodDistinguishButton.mas_top);
        make.size.equalTo(@64);
    }];
    self.apparatusDistinguishLabel = [[UILabel alloc] init];
    self.apparatusDistinguishLabel.text = @"物品识别";
    [self.apparatusDistinguishLabel setFont:[UIFont systemFontOfSize:15]];
    self.apparatusDistinguishLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.apparatusDistinguishLabel];
    [self.apparatusDistinguishLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.apparatusDistinguishButton);
        make.top.equalTo(self.apparatusDistinguishButton.mas_bottom);
        make.width.equalTo(self.apparatusDistinguishButton.mas_width);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
