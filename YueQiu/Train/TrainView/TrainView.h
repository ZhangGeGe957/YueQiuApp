//
//  TrainView.h
//  约球
//
//  Created by 张佳乔 on 2022/1/2.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "ShowProjectTableViewCell.h"
#import "CourseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrainView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *coursesButton;
@property (nonatomic, strong) UIButton *coachButton;
@property (nonatomic, strong) UIButton *rankingButton;
@property (nonatomic, strong) UILabel *coursesLabel;
@property (nonatomic, strong) UILabel *coachLabel;
@property (nonatomic, strong) UILabel *rankingLabel;
@property (nonatomic, strong) UILabel *topLine;

@property (nonatomic, strong) UIButton *choiceButton;
@property (nonatomic, strong) UITableView *projectTableView;
@property (nonatomic, strong) ShowProjectTableViewCell *projectCell;
@property (nonatomic, strong) NSArray *projectArray;
@property BOOL projectIsShow;  //用于判断选择项目栏是否展开

@property (nonatomic, strong) UITableView *courseTableView;
@property (nonatomic, strong) NSArray *coursePhotosArray;
@property (nonatomic, strong) NSArray *courseNameArray;
@property (nonatomic, strong) NSArray *courseTeacherArray;
@property (nonatomic, strong) NSArray *courseTimeArray;

@end

NS_ASSUME_NONNULL_END
