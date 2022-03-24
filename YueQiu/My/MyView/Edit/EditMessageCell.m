//
//  EditMessageCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/21.
//

#import "EditMessageCell.h"
#import "Masonry.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation EditMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    
    if ([reuseIdentifier isEqualToString:@"0"]) {
        self.valueLabel = [[UILabel alloc] init];
        [self addSubview:self.valueLabel];
        [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textLabel.mas_top);
            make.left.equalTo(self.textLabel.mas_left).offset(100);
            make.size.mas_equalTo(CGSizeMake(W / 2, 40));
        }];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if ([reuseIdentifier isEqualToString:@"1"]) {
        self.valueLabel = [[UILabel alloc] init];
        [self addSubview:self.valueLabel];
        [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textLabel.mas_top);
            make.left.equalTo(self.textLabel.mas_left).offset(100);
            make.size.mas_equalTo(CGSizeMake(W / 2, 40));
        }];
    } else if ([reuseIdentifier isEqualToString:@"2"]) {
        self.valueLabel = [[UILabel alloc] init];
        [self addSubview:self.valueLabel];
        [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textLabel.mas_top);
            make.left.equalTo(self.textLabel.mas_left).offset(100);
            make.size.mas_equalTo(CGSizeMake(W / 2, 40));
        }];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        self.valueLabel = [[UILabel alloc] init];
        [self addSubview:self.valueLabel];
        [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.textLabel.mas_top);
            make.left.equalTo(self.textLabel.mas_left).offset(100);
            make.size.mas_equalTo(CGSizeMake(W * 2 / 3, 80));
        }];
        self.valueLabel.font = [UIFont systemFontOfSize:15];
        self.valueLabel.numberOfLines = 0;
    }
    return self;
}

@end
