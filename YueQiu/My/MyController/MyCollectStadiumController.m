//
//  MyCollectStadiumController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import "MyCollectStadiumController.h"
#import "MyCollectStadiumView.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface MyCollectStadiumController ()

@end

@implementation MyCollectStadiumController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我收藏的球馆";
    MyCollectStadiumView* myCollectView = [[MyCollectStadiumView alloc] initWithFrame:CGRectMake(0,  [self hGetStatusbarHeight], W, H - [self hGetStatusbarHeight])];
    
    [self.view addSubview:myCollectView];
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
