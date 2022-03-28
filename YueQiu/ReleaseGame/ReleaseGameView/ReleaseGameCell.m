//
//  ReleaseGameCell.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/28.
//

#import "ReleaseGameCell.h"

@implementation ReleaseGameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect tempFrame = self.textLabel.frame;
    tempFrame.origin.x = 10;
    self.textLabel.frame = tempFrame;
}

@end
