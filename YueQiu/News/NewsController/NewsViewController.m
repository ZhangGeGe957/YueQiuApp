//
//  NewsViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "NewsViewController.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_initUI];
}

- (void)p_initUI {
    //获取导航栏+状态栏的高度
    self.navHeight = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    //初始化导航栏
    self.falseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myWidth, self.navHeight)];
    self.falseView.backgroundColor = [UIColor whiteColor];
    [self.navigationController.view addSubview:self.falseView];
    
    //右按钮初始化
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setImage:[UIImage imageNamed:@"jia.png"] forState:UIControlStateNormal];
    [self.falseView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.falseView).offset(-myWidth / 20);
        make.top.equalTo(self.falseView).offset(myHeight / 20);
        make.size.equalTo(@30);
    }];
    
    //ScrollView初始化
    self.differentScrollView = [[UIScrollView alloc] init];
    self.differentScrollView.contentSize = CGSizeMake(myWidth * 2, myHeight / 1.23);
    self.differentScrollView.pagingEnabled = NO;
    self.differentScrollView.scrollEnabled = NO;
    self.differentScrollView.showsHorizontalScrollIndicator = NO;
    self.differentScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.differentScrollView];
    [self.differentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(self.navHeight);
        make.left.equalTo(self.view).offset(0);
        make.width.equalTo(@(myWidth));
        make.height.equalTo(@(myHeight / 1.23));
    }];
    
    //分栏控制器初始化
    self.selectControl = [[UISegmentedControl alloc] init];
    [self.selectControl insertSegmentWithTitle:@"精选" atIndex:0 animated:YES];
    [self.selectControl insertSegmentWithTitle:@"关注" atIndex:0 animated:YES];
    self.selectControl.selectedSegmentIndex = 0;
    [self.selectControl addTarget:self action:@selector(switchView:) forControlEvents:UIControlEventValueChanged];
    [self.falseView addSubview:self.selectControl];
    [self.selectControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.falseView);
        make.bottom.equalTo(self.rightButton.mas_bottom).offset(0);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
    }];
    
    //初始化视图精选
    self.boutuqueView = [[BoutiqueView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight / 1.23)];
    [self.differentScrollView addSubview:self.boutuqueView];
    
    //初始化视图关注
    self.followView = [[FollowView alloc] initWithFrame:CGRectMake(myWidth, 0, myWidth, myHeight / 1.23)];
    [self.differentScrollView addSubview:self.followView];
}

//分栏控制器事件
- (void)switchView:(UISegmentedControl *)segControl {
    [self.differentScrollView setContentOffset:CGPointMake(myWidth * segControl.selectedSegmentIndex, 0)];
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
