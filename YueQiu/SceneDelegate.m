//
//  SceneDelegate.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/8.
//

#import "SceneDelegate.h"
#import "HomePage/HomePageController/HomePageViewController.h"
#import "Train/TrainController/TrainViewController.h"
#import "News/NewsController/NewsViewController.h"
#import "My/MyController/MyViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window = [[UIWindow alloc] initWithWindowScene:scene];
    
    HomePageViewController *homePageView = [[HomePageViewController alloc] init];
    TrainViewController *trainView = [[TrainViewController alloc] init];
    NewsViewController *newsView = [[NewsViewController alloc] init];
    MyViewController *myView = [[MyViewController alloc] init];
    
    homePageView.title = @"首页";
    trainView.title = @"训练";
    newsView.title = @"消息";
    myView.title = @"我的";
    
    UINavigationController *homePage = [[UINavigationController alloc] initWithRootViewController:homePageView];
    UINavigationController *train = [[UINavigationController alloc] initWithRootViewController:trainView];
    UINavigationController *news = [[UINavigationController alloc] initWithRootViewController:newsView];
    UINavigationController *my = [[UINavigationController alloc] initWithRootViewController:myView];
    
    NSArray *viewArray = [[NSArray alloc] initWithObjects:homePage, train, news, my, nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.tintColor = [UIColor orangeColor];
    tabBarController.viewControllers = viewArray;
    tabBarController.tabBar.translucent = NO;
    tabBarController.view.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyWindow];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
