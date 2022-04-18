//
//  FollowView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FollowView : UIView
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)NSString* backgroundString;
@property (nonatomic, strong)NSString* headString;
@property (nonatomic, strong)NSString* signature;
@property NSInteger sex;
@property (nonatomic, strong)NSString* name;
@property (nonatomic, strong)NSString* birth;
@property int isFollow;

@end

NS_ASSUME_NONNULL_END
