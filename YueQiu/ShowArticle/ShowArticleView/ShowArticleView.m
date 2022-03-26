//
//  ShowArticleView.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import "ShowArticleView.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@implementation ShowArticleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self p_initUI];
    
    return self;
}


//初始化UI
- (void)p_initUI {
    //四个固定图像
    self.locationImageView = [[UIImageView alloc] init];
    self.locationImageView.image = [UIImage imageNamed:@"didian.png"];
    [self addSubview:self.locationImageView];
    self.timeImageView = [[UIImageView alloc] init];
    self.timeImageView.image = [UIImage imageNamed:@"naozhong-copy.png"];
    [self addSubview:self.timeImageView];
    self.contentImageView = [[UIImageView alloc] init];
    self.contentImageView.image = [UIImage imageNamed:@"neirong.png"];
    [self addSubview:self.contentImageView];
    
    //四个固定的图像
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.left.equalTo(self).offset(30);
        make.size.equalTo(@30);
    }];
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.locationImageView.mas_bottom).offset(10);
        make.left.equalTo(self.locationImageView.mas_left);
        make.size.equalTo(@30);
    }];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeImageView.mas_bottom).offset(10);
        make.left.equalTo(self.locationImageView.mas_left);
        make.size.equalTo(@30);
    }];
    
    //四个根据数据变的
    self.locationLabel = [[UILabel alloc] init];
    self.locationLabel.textColor = [UIColor blackColor];
    [self.locationLabel setFont:[UIFont systemFontOfSize:18]];
    self.locationLabel.text = @"dasfsfs";
    [self addSubview:self.locationLabel];
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.textColor = [UIColor blackColor];
    [self.timeLabel setFont:[UIFont systemFontOfSize:18]];
    self.timeLabel.text = @"dasfsfs";
    [self addSubview:self.timeLabel];
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textColor = [UIColor blackColor];
    [self.contentLabel setFont:[UIFont systemFontOfSize:18]];
    self.contentLabel.text = @"dasfsfs";
    [self addSubview:self.contentLabel];
    
    //四个可变的
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.locationImageView.mas_top);
        make.left.equalTo(self.locationImageView.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-30);
        make.height.equalTo(@30);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeImageView.mas_top);
        make.left.equalTo(self.timeImageView.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-30);
        make.height.equalTo(@30);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentImageView.mas_top);
        make.left.equalTo(self.contentImageView.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-30);
        make.height.equalTo(@30);
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
