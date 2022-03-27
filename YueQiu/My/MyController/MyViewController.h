//
//  MyViewController.h
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyViewController : UIViewController<UITableViewDelegate,
UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) MyTableViewCell *myCell;
@property (nonatomic, strong) NSArray* menuArray;
@property (nonatomic, strong) NSString *onlyUid;  //唯一的uid
@property (nonatomic, strong) NSString *token;
//保存图片返回路径
- (NSString *)savePhotosBackPath:(UIImage *)image;

//要传入编辑资料的数据
@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* signature;//个性标签
@property (nonatomic, strong) NSString* label;//标签/爱好
@property NSInteger sex;
@property (nonatomic, strong) NSString* email;//邮箱
@property (nonatomic, strong) NSString* birthday;//生日

@property (nonatomic, strong) NSString* phone_numbers;
@property (nonatomic, strong) NSString* head_sculpture;//头像
@property (nonatomic, strong) NSString* background;//背景
@end

NS_ASSUME_NONNULL_END
