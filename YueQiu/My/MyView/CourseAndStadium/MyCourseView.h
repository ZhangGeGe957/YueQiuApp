//
//  MyCourseView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCourseView : UIView
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* courseTableView;
@property (nonatomic, strong) NSArray* courseArray;

@end

NS_ASSUME_NONNULL_END
