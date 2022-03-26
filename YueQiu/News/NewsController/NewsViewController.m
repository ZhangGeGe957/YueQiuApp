//
//  NewsViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "NewsViewController.h"
#import "ReleaseGameViewController.h"
#import "NewsTableViewCell.h"
#import "ArticleModel.h"
#import "ShowArticleViewController.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface NewsViewController ()

@property (nonatomic, strong) ReleaseGameViewController *releaseView;  //发文章界面
@property (nonatomic, strong) ShowArticleViewController *showArticleView;  //展示文章界面

@end

@implementation NewsViewController



//使用动画的方式隐藏导航栏
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    //获取数据
    [self p_getModel];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_initUI];
}

- (void)p_initUI {
    //初始化数据
    self.getAllData = [[NSMutableArray alloc] init];
    
    //获取导航栏+状态栏的高度
    self.navHeight = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    //初始化导航栏
    self.falseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myWidth, self.navHeight)];
    self.falseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.falseView];
    
    //右按钮初始化
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setImage:[UIImage imageNamed:@"jia.png"] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(pushView:) forControlEvents:UIControlEventTouchUpInside];
    [self.falseView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.falseView).offset(-myWidth / 20);
        make.top.equalTo(self.falseView).offset(myHeight / 25);
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
    [self.selectControl insertSegmentWithTitle:@"关注" atIndex:1 animated:YES];
    [self.selectControl setTintColor:[UIColor blueColor]];
    [self.selectControl setBackgroundImage:[UIImage imageNamed:@"kongbai.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.selectControl setBackgroundImage:[UIImage imageNamed:@"charuhengxian-line-currency-Inserthorizontalline.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //设置普通状态下(未选中)状态下的文字颜色和字体
    [self.selectControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    //设置选中状态下的文字颜色和字体
    [self.selectControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
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
    self.boutuqueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight / 1.1)];
    [self.differentScrollView addSubview:self.boutuqueView];
    self.showBoutiqueTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight) style:UITableViewStylePlain];
    self.showBoutiqueTableView.delegate = self;
    self.showBoutiqueTableView.dataSource = self;
    self.showBoutiqueTableView.tag = 111;
    self.showBoutiqueTableView.backgroundColor = [UIColor whiteColor];
    [self.boutuqueView addSubview:self.showBoutiqueTableView];
    [self.showBoutiqueTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"show"];
    
    //初始化视图关注
    self.followView = [[UIView alloc] initWithFrame:CGRectMake(myWidth, 0, myWidth, myHeight / 1.1)];
    [self.differentScrollView addSubview:self.followView];
    self.showFollowTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight) style:UITableViewStylePlain];
    self.showFollowTableView.delegate = self;
    self.showFollowTableView.dataSource = self;
    self.showFollowTableView.tag = 222;
    self.showFollowTableView.backgroundColor = [UIColor whiteColor];
    [self.followView addSubview:self.showFollowTableView];
    [self.showFollowTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"show"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [self.showFollowTableView dequeueReusableCellWithIdentifier:@"show"];
    if (tableView.tag == 111) {
        [cell.headButton setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
        cell.titleNameLabel.text = @"NBA分部";
        cell.locationLabel.text = @"西安邮电大学体育场";
        cell.timeLabel.text = @"1月20日 9:00";
        cell.contentLabel.text = @"5V5交流切磋赛，欢迎切磋！欢迎大家来被我们打爆";
        cell.VIPImageView.hidden = YES;
        [cell.reserveButton addTarget:self action:@selector(pushShowArticle:) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [cell.headButton setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
        cell.titleNameLabel.text = @"513分部";
        cell.locationLabel.text = @"西安邮电大学体育场";
        cell.timeLabel.text = @"1月22日 9:00";
        cell.contentLabel.text = @"5V5交流切磋赛，欢迎切磋！欢迎大家来被我们打爆";
        cell.VIPImageView.hidden = YES;
        [cell.reserveButton addTarget:self action:@selector(pushShowArticle:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 111) {
        return 3;
    } else {
        return 2;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

//分栏控制器事件
- (void)switchView:(UISegmentedControl *)segControl {
    [self.differentScrollView setContentOffset:CGPointMake(myWidth * segControl.selectedSegmentIndex, 0)];
}

//推出发布球局界面
- (void)pushView:(UIButton *)button {
    self.releaseView = [[ReleaseGameViewController alloc] init];
    [self.navigationController pushViewController:self.releaseView animated:YES];
}

//推出文章界面
- (void)pushShowArticle:(UIButton *)button {
    self.showArticleView = [[ShowArticleViewController alloc] init];
    [self.navigationController pushViewController:self.showArticleView animated:YES];
}

//获取数据
- (void)p_getModel {
    ArticleModel *manager = [ArticleModel shareManager];
    manager.uid = self.uid;
    
    [[ArticleModel shareManager] getMessageWithData:^(ArticleJSONModel * _Nullable articleModel) {
        NSLog(@"%@   %ld   %@", articleModel.data, (long)articleModel.code, articleModel.msg);
        
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        
    } andError:^(NSError * _Nullable error) {
        NSLog(@"获取失败！");
    }];
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
