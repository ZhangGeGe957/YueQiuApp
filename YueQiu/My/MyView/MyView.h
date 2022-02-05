//
//  MyView.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView* courseTableView;
@property (nonatomic, strong) UITableView* stadiumTableView;
@property (nonatomic, strong) UIButton* buttonHead;
@property (nonatomic, strong) UILabel* labelName;
@property (nonatomic, strong) UILabel* labelUID;
@property (nonatomic, strong) UILabel* labelPersonalSignature;

@property (nonatomic, strong) NSArray* courseArray;
@property (nonatomic, strong) NSArray* stadiumArray;
@property (nonatomic, strong) NSArray* stadiumPlaceArray;

@end

NS_ASSUME_NONNULL_END
