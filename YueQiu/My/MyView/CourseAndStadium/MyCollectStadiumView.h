//
//  MyCollectStadiumView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectStadiumView : UIView
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* stadiumTableView;
@property (nonatomic, strong) NSArray* stadiumArray;
@property (nonatomic, strong) NSArray* stadiumPlaceArray;
@end

NS_ASSUME_NONNULL_END
