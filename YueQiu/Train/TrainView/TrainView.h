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
#import "CourseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrainView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *coursesButton;
@property (nonatomic, strong) UIButton *coachButton;
@property (nonatomic, strong) UIButton *rankingButton;
@property (nonatomic, strong) UILabel *coursesLabel;
@property (nonatomic, strong) UILabel *coachLabel;
@property (nonatomic, strong) UILabel *rankingLabel;
@property (nonatomic, strong) UILabel *topLine;
@property (nonatomic, strong) UILabel *bottomLine;

@property (nonatomic, strong) UIButton *choiceButton;  //选择项目的按钮
@property (nonatomic, strong) UITableView *projectTableView;  //项目类型tableview
@property (nonatomic, strong) ShowProjectTableViewCell *projectCell;  //展示项目类型的cell
@property (nonatomic, strong) NSArray *projectArray;  //存储所有的项目类型
@property BOOL projectIsShow;  //用于判断选择项目栏是否展开

@property (nonatomic, strong) UITableView *courseTableView;  //课程的tableview
@property (nonatomic, strong) CourseTableViewCell *courseCell;  //展示课程的cell
@property (nonatomic, strong) NSArray *tempCourseDataArray;  //临时的一个存储课程信息的数组
@property (nonatomic, strong) CourseDataModel *courseDataArray;  //自定义的一个用于存储全部课程信息的类
@property (nonatomic, strong) CourseDataModel *showCourseDataArray;  //自定义的一个用于存储选中课程信息的类

@end

NS_ASSUME_NONNULL_END
