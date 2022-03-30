//
//  ShowArticleViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import "ShowArticleViewController.h"
#import "ShowArticleView.h"
#import <SDWebImage/UIButton+WebCache.h>

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface ShowArticleViewController ()

@property (nonatomic, strong) ShowArticleView *showView;  //显示的文章内容

@end

@implementation ShowArticleViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_initView];
}

//初始化视图
- (void)p_initView {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取导航栏+状态栏的高度
    self.navHeight = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    self.title = @"球局";
    
    self.showView = [[ShowArticleView alloc] initWithFrame:CGRectMake(0, self.navHeight, myWidth, myHeight - self.navHeight)];
    [self.showView.userImageView sd_setBackgroundImageWithURL:[NSURL URLWithString:self.getAllData[self.location][3]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"head_portrait.jpg"]];
    self.showView.userLabel.text = self.getAllData[self.location][2];
    self.showView.locationLabel.text = self.getAllData[self.location][5];
    self.showView.timeLabel.text = self.getAllData[self.location][6];
    self.showView.contentLabel.text = self.getAllData[self.location][4];
    [self.view addSubview:self.showView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
