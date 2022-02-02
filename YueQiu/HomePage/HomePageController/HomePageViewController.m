//
//  HomePageViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "HomePageViewController.h"

#import "Masonry.h"
#import "HQBSearchViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem* search = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sousuo.png"] style:UIBarButtonItemStylePlain target:self action:@selector(touchSearch)];
    search.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = search;
    
    
    self.homePageView = [[HomePageUIView alloc] initWithFrame:CGRectMake(0, 0, W, H - [self hGetTabHeight] - [self hGetStatusbarHeight])];

    [self.view addSubview:self.homePageView];
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

- (void)touchSearch {
    HQBSearchViewController* searchController = [[HQBSearchViewController alloc] init];
    [self.navigationController pushViewController:searchController animated:YES];
}
@end
