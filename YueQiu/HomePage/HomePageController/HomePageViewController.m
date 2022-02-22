//
//  HomePageViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "HomePageViewController.h"
#import "Masonry.h"
#import "HQBSearchViewController.h"
#import "ReserveViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

NSString *const identityHomePageControllerNotice = @"homePage";

@interface HomePageViewController ()

@property (nonatomic, strong) ReserveViewController *reserveView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem* search = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sousuo.png"] style:UIBarButtonItemStylePlain target:self action:@selector(touchSearch)];
    search.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = search;
    
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.layer.cornerRadius = 20;
    leftButton.layer.masksToBounds = YES;
    [leftButton setImage:[UIImage imageNamed:@"head的副本.jpeg"] forState:UIControlStateNormal];
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //注册通知
    [self registrationNotice];
    
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
- (void)touchHead {
    
}

//注册通知
- (void)registrationNotice {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homePageNoticeEvent:) name:identityHomePageControllerNotice object:nil];
}
- (void)homePageNoticeEvent:(NSNotification *)sender {
    self.reserveView = [[ReserveViewController alloc] init];
    self.reserveView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:self.reserveView animated:YES completion:nil];
}

@end
