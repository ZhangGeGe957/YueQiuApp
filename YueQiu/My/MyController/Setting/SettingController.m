//
//  SettingController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/22.
//

#import "SettingController.h"
#import "SettingView.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    SettingView* settingView = [[SettingView alloc] initWithFrame:CGRectMake(0, 0, W, H)];
    [self.view addSubview:settingView];
}

@end
