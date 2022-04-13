//
//  MyCourseViewController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import "MyCourseViewController.h"
#import "NewsTableViewCell.h"
#import "ArticleModel.h"
#import "ShowArticleViewController.h"
#import <SDWebImage/UIButton+WebCache.h>

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface MyCourseViewController ()

@property (nonatomic, strong) ShowArticleViewController *showArticleView;  //展示文章界面

@end

@implementation MyCourseViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    
    //获取数据
    [self p_getModel];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的球局";
    
    self.showArticleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [self hGetStatusbarHeight] + [self hGetNavigationbarHeight], W, H / 1.1) style:UITableViewStylePlain];
    self.showArticleTableView.delegate = self;
    self.showArticleTableView.dataSource = self;
    [self.view addSubview:self.showArticleTableView];
    [self.showArticleTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"show"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [self.showArticleTableView dequeueReusableCellWithIdentifier:@"show"];
    [cell.headButton sd_setBackgroundImageWithURL:[NSURL URLWithString:self.getAllData[indexPath.row][3]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"head_portrait.jpg"]];
    cell.titleNameLabel.text = self.getAllData[indexPath.row][2];
    cell.locationLabel.text = self.getAllData[indexPath.row][5];
    cell.timeLabel.text = self.getAllData[indexPath.row][6];
    cell.contentLabel.text = self.getAllData[indexPath.row][4];
    cell.VIPImageView.hidden = YES;
    cell.reserveButton.hidden = YES;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.getAllData.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.showArticleView = [[ShowArticleViewController alloc] init];
    self.showArticleView.getAllData = [[NSMutableArray alloc] initWithArray:self.getAllData];
    self.showArticleView.location = indexPath.row;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.showArticleView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

//可显示编辑状态
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    self.myAlertContriller = [UIAlertController alertControllerWithTitle:@"提示" message:@"您确认要删除这篇文章吗？" preferredStyle:UIAlertControllerStyleAlert];
    [self.myAlertContriller addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        ArticleModel *manager = [ArticleModel shareManager];
        manager.uid = self.uid;
        manager.mobileToken = self.mobileToken;
        manager.articleId = self.getAllData[indexPath.row][0];
        
        [[ArticleModel shareManager] delectMessageWithData:^(AddArticleJSONModel * _Nullable returnMessageModel) {
            NSLog(@"%@   %ld", returnMessageModel.msg, (long)returnMessageModel.code);
        } andError:^(NSError * _Nullable error) {
            NSLog(@"删除失败！");
        }];
        [self p_getModel];
    }]];
    [self.myAlertContriller addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:self.myAlertContriller animated:YES completion:nil];
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

//获取数据
- (void)p_getModel {
    //初始化数据
    self.getAllData = [[NSMutableArray alloc] init];
    
    ArticleModel *manager = [ArticleModel shareManager];
    manager.uid = self.uid;
    manager.mobileToken = self.mobileToken;
    
    [[ArticleModel shareManager] getMyAllData:^(ArticleJSONModel * _Nullable articleModel) {
        NSLog(@"%@   %ld   %@", articleModel.data, (long)articleModel.code, articleModel.msg);
        
        NSMutableArray *tempArrayOne = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < articleModel.data.count; i++) {
            if ([self.uid isEqualToString:[articleModel.data[i] valueForKey:@"uid"]]) {
                tempArrayOne = [[NSMutableArray alloc] init];

                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"articleId"]];
                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"uid"]];
                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"username"]];
                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"headSculpture"]];
                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"content"]];
                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"address"]];
                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"time"]];
                [tempArrayOne addObject:[articleModel.data[i] valueForKey:@"gmtCreate"]];

                NSMutableArray *tempArrayTwo = [[NSMutableArray alloc] init];
                if ([[articleModel.data[i] valueForKey:@"comment"] count]) {
                    for (int j = 0; j < [[articleModel.data[i] valueForKey:@"comment"] count]; j++) {
                        tempArrayTwo = [[NSMutableArray alloc] init];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"gmtCreate"]];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"commentId"]];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"uid"]];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"username"]];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"headSculpture"]];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"articleId"]];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"comment"]];
                        [tempArrayTwo addObject:[articleModel.data[i][@"comment"][j] valueForKey:@"gmtCreate"]];
                        [tempArrayOne addObject:tempArrayTwo];
                    }
                } else {
                    [tempArrayOne addObject:@""];
                }
            }
            [self.getAllData addObject:tempArrayOne];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.showArticleTableView reloadData];
        });
        
    } andError:^(NSError * _Nullable error) {
        NSLog(@"获取失败！");
    }];
}

@end
