//
//  FollowerTableViewCell.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FollowerTableViewCell : UITableViewCell
@property NSInteger sex;

@property (nonatomic, strong)UIButton* followButton;
@property (nonatomic, strong)UIImageView* headImageView;
@property (nonatomic, strong)UIImageView* backgroundImageView;
@property (nonatomic, strong)UIImageView* sexImageView;
@property (nonatomic, strong)UIImageView* signatureImageView;
@property (nonatomic, strong)UILabel* contentLabel;
@property (nonatomic, strong)UILabel* nameLabel;
@end

NS_ASSUME_NONNULL_END
