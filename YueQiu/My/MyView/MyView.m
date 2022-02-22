//MyView.m
//YueQiu
//
//Created by haoqianbiao on 2022/2/3.


#import "MyView.h"
#import "MyTableViewCell.h"
#import "Masonry.h"
#import "MyCollectStadiumController.h"
#import "MyCourseViewController.h"


#define W self.frame.size.width
#define H self.frame.size.height
@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  
  self.menuArray = [NSArray arrayWithObjects:@"我的课程列表", @"我收藏的球馆", @"退出",nil];

  self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H) style:UITableViewStylePlain];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"background"];
  [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyMessage"];
  [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"menu"];
  [self addSubview:self.tableView];
  
  return self;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if(indexPath.row == 0) {
      return H / 3;
  } else if (indexPath.row == 1) {
      return 150;
  } else {
      return 60;
  }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  if (indexPath.row == 0) {
      MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"background"];
      return cell;
  } else if (indexPath.row == 1) {
      MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyMessage"];
      return cell;
  } else {
      MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"menu"];
      cell.textLabel.text = self.menuArray[indexPath.row - 2];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      return cell;
  }
}

- (void)touchToChangeHead:(UIButton*)button {

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  self.controller = [self viewController];
  if (indexPath.row == 2) {
      self.controller.hidesBottomBarWhenPushed = YES;
      MyCourseViewController* myCourseController = [[MyCourseViewController alloc] init];
      [self.controller.navigationController pushViewController:myCourseController animated:YES];
      self.controller.hidesBottomBarWhenPushed = NO;

  } else if (indexPath.row == 3) {
      self.controller.hidesBottomBarWhenPushed = YES;
      MyCollectStadiumController* collectStadiumController = [[MyCollectStadiumController alloc] init];
      [self.controller.navigationController pushViewController:collectStadiumController animated:YES];
      self.controller.hidesBottomBarWhenPushed = NO;
  } else if (indexPath.row == 4) {
      UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
      UIAlertAction *exitLogin = [UIAlertAction actionWithTitle:@"退出登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
          NSLog(@"退出登陆");
      }];
      UIAlertAction *exitApp = [UIAlertAction actionWithTitle:@"退出到桌面" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
          exit(0);
      }];
      UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
      [alertSheet addAction:exitLogin];
      [alertSheet addAction:exitApp];
      [alertSheet addAction:cancel];
      [self.controller presentViewController:alertSheet animated:YES completion:nil];


  }
}
- (UIViewController *)viewController {
  for (UIView* next = [self superview]; next; next = next.superview) {
      UIResponder *nextResponder = [next nextResponder];
      if ([nextResponder isKindOfClass:[UIViewController class]]) {
          return (UIViewController *)nextResponder;
      }
  }
  return nil;
}


@end
