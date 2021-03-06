//
//  MyTableViewCell.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton* buttonHead;
@property (nonatomic, strong) UILabel* labelName;
@property (nonatomic, strong) UILabel* labelPersonalSignature;
@property (nonatomic, strong) UIButton *backImageView;
@property (nonatomic, strong) UILabel *cellNameLabel;  //cell名字
@property (nonatomic, strong) UIImageView *cellImageView;  //cell前图片

@end

NS_ASSUME_NONNULL_END
