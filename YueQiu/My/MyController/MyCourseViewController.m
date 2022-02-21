//
//  MyCourseViewController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import "MyCourseViewController.h"
#import "MyCourseView.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface MyCourseViewController ()

@end

@implementation MyCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tabBarController.tabBar.hidden = YES;
    self.title = @"我的课程";
    MyCourseView* courseView = [[MyCourseView alloc] initWithFrame:CGRectMake(0, [self hGetStatusbarHeight] + [self hGetNavigationbarHeight], W, H - [self hGetStatusbarHeight])];
    [self.view addSubview:courseView];
}

- (float)hGetStatusbarHeight {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *hStatusBarManager =  windowScene.statusBarManager;
    return hStatusBarManager.statusBarFrame.size.height;
}

//获取导航栏高度
- (float)hGetNavigationbarHeight {
    return self.navigationController.navigationBar.frame.size.height;
}

@end
