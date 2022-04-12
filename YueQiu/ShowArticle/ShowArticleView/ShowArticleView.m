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
    self.userImageView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 20;
    [self addSubview:self.userImageView];
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
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.left.equalTo(self).offset(30);
        make.size.equalTo(@40);
    }];
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_bottom).offset(10);
        make.left.equalTo(self.userImageView.mas_left);
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
    self.userLabel = [[UILabel alloc] init];
    self.userLabel.textColor = [UIColor blackColor];
    [self.userLabel setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:22]];
    [self addSubview:self.userLabel];
    self.locationLabel = [[UILabel alloc] init];
    self.locationLabel.textColor = [UIColor blackColor];
    [self.locationLabel setFont:[UIFont systemFontOfSize:18]];
    [self addSubview:self.locationLabel];
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.textColor = [UIColor blackColor];
    [self.timeLabel setFont:[UIFont systemFontOfSize:18]];
    [self addSubview:self.timeLabel];
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textColor = [UIColor blackColor];
    [self.contentLabel setFont:[UIFont systemFontOfSize:18]];
    self.contentLabel.numberOfLines = 0;
    [self addSubview:self.contentLabel];
    
    //四个可变的
    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_top);
        make.left.equalTo(self.userImageView.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-30);
        make.height.equalTo(@40);
    }];
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
        make.height.equalTo(@100);
    }];
    
    //发送评论
    self.sendContentView = [[UIView alloc] init];
    self.sendContentView.backgroundColor = [UIColor systemGray6Color];
    [self addSubview:self.sendContentView];
    [self.sendContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self);
        make.height.equalTo(@50);
    }];
    self.sendContentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sendContentButton setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendContentView addSubview:self.sendContentButton];
    [self.sendContentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendContentView.mas_top).offset(5);
        make.width.equalTo(@50);
        make.right.equalTo(self.sendContentView.mas_right).offset(-10);
        make.height.equalTo(@40);
    }];
    self.sendContentTextField = [[UITextField alloc] init];
    self.sendContentTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.sendContentView addSubview:self.sendContentTextField];
    [self.sendContentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendContentView.mas_top).offset(5);
        make.right.equalTo(self.sendContentButton.mas_left).offset(-10);
        make.left.equalTo(self.sendContentView.mas_left).offset(10);
        make.height.equalTo(@40);
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
