//
//  NewsViewController.h
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *rightButton;  //发布球局按钮
@property CGFloat navHeight;  //获取到的导航栏高度
@property (nonatomic, strong) UIView *falseView; //一个自己的假导航栏
@property (nonatomic, strong) UISegmentedControl *selectControl;  //分栏控制器
@property (nonatomic, strong) UIScrollView *differentScrollView;  //滚动视图
@property (nonatomic, strong) NSString* uid;  //唯一uid

//精选界面
@property (nonatomic, strong) UIView *boutuqueView;
@property (nonatomic, strong) UITableView *showBoutiqueTableView;

//关注界面
@property (nonatomic, strong) UIView *followView;
@property (nonatomic, strong) UITableView *showFollowTableView;

@property (nonatomic, strong) NSArray *getAllData;  //所有数据

@end

NS_ASSUME_NONNULL_END
