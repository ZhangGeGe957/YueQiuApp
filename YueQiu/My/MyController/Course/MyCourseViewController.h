//
//  MyCourseViewController.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCourseViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSString *uid;  //唯一uid
@property (nonatomic, strong) NSString *mobileToken;  //设备码
@property (nonatomic, strong) UITableView *showArticleTableView;
@property (nonatomic, strong) NSMutableArray *getAllData;  //我的所有数据
@property (nonatomic, strong) UIAlertController *myAlertContriller;  //提示框

@end

NS_ASSUME_NONNULL_END
