//
//  ReserveView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/21.
//

#import "ReserveView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ReserveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    [self p_initViewUI];
    
    return self;
}

- (void)p_initViewUI {
    //返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui2.png"] forState:UIControlStateNormal];
    [self addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.rectStatus.size.height + 20);
        make.left.equalTo(self).offset(20);
        make.size.equalTo(@30);
    }];
    
    //标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"预定";
    [self.titleLabel setFont:[UIFont systemFontOfSize:32]];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(self.rectStatus.size.height + 20);
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
