//
//  SettingCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/22.
//


#import "SettingCell.h"
#import "Masonry.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation SettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect tempFrame = self.textLabel.frame;
    tempFrame.origin.x = W  / 6;
    self.textLabel.frame = tempFrame;
    
    
}

@end
