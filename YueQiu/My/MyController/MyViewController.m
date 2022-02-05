//
//  MyViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "MyViewController.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more.png"] style:UIBarButtonItemStylePlain target:self action:@selector(touchMore)];
    rightButton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    self.myView = [[MyView alloc] initWithFrame:CGRectMake(0, [self hGetStatusbarHeight] + [self hGetNavigationbarHeight], W, H - [self hGetStatusbarHeight] - [self hGetNavigationbarHeight] - [self hGetTabHeight])];
    [self.view addSubview:self.myView];
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
//获取tabBar的高度
- (float)hGetTabHeight {
    return self.tabBarController.tabBar.frame.size.height;
}
- (void)touchMore{
    
}
@end
