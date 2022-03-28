//
//  TrainViewController.h
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *showTableView;

@end

NS_ASSUME_NONNULL_END
