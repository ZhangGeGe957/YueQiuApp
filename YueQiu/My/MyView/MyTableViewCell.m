//
//  MyTableViewCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/3.
//

#import "MyTableViewCell.h"
#import "Masonry.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    

    if ([reuseIdentifier isEqualToString:@"background"]) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beijing.jpeg"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.width.mas_equalTo(W);
        }];
    } else if([reuseIdentifier isEqualToString:@"MyMessage"]) {
        self.buttonHead = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.buttonHead];
        [self.buttonHead setImage:[UIImage imageNamed:@"head.jpeg"] forState:UIControlStateNormal];
        [self.buttonHead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        self.buttonHead.layer.cornerRadius = 50;
        self.buttonHead.layer.masksToBounds = YES;
//        [self.buttonHead addTarget:self action:@selector(touchToChangeHead:) forControlEvents:UIControlEventTouchUpInside];  
        
        self.labelName = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelName];
        self.labelName.text = @"Fahaxiki";
        [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.buttonHead.mas_top).offset(10);
            make.left.equalTo(self.buttonHead.mas_right).offset(20);
            make.size.mas_equalTo(CGSizeMake(W / 3, 30));
        }];
        self.labelName.textAlignment = NSTextAlignmentLeft;
        self.labelName.font = [UIFont systemFontOfSize:23];
        
        self.labelUID = [[UILabel alloc] init];
        [self.contentView addSubview:_labelUID];
        [_labelUID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_labelName.mas_top).offset(0);
            make.left.equalTo(_labelName.mas_right).offset(10);
            make.size.mas_equalTo(CGSizeMake(W / 3, 30));
        }];
        _labelUID.text = @"UID:000001";
        _labelUID.textAlignment = NSTextAlignmentLeft;
        
        self.labelPersonalSignature = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelPersonalSignature];
        [self.labelPersonalSignature mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.labelName.mas_bottom).offset(10);
            make.left.equalTo(self.labelName.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(W * 2 / 3, 30));
        }];
        self.labelPersonalSignature.numberOfLines = 1;
        self.labelPersonalSignature.text = @"年龄永远不是衡量一个人的刻度,只有责任的叠加才会让人逐渐成长。";
        self.labelPersonalSignature.font = [UIFont systemFontOfSize:15];
    } else {
        
    }
    
    return self;
}




@end
