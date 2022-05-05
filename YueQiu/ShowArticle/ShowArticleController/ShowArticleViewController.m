//
//  ShowArticleViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import "ShowArticleViewController.h"
#import "ShowArticleView.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "Masonry.h"
#import "SendComment.h"
#import "ShowCommentTableViewCell.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface ShowArticleViewController ()

@property (nonatomic, strong) ShowArticleView *showView;  //显示的文章内容
@property (nonatomic, strong) SendComment *myGetComment;  //获取文章信息
@property (nonatomic, strong) ShowCommentTableViewCell *myShowCommentCell;

@end

@implementation ShowArticleViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [self getComment];
    
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    self.showView.sendContentTextField.delegate = self;
    [self.showView.sendContentButton addTarget:self action:@selector(pressSend:) forControlEvents:UIControlEventTouchUpInside];
    
    self.showCommentTableView = [[UITableView alloc] init];
    self.showCommentTableView.delegate = self;
    self.showCommentTableView.dataSource = self;
    [self.showView addSubview:self.showCommentTableView];
    [self.showCommentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showView.sendContentButton.mas_bottom).offset(10);
        make.left.equalTo(self.showView).offset(0);
        make.width.equalTo(@(myWidth));
        make.bottom.equalTo(self.showView.mas_bottom);
    }];
    [self.showCommentTableView registerClass:[ShowCommentTableViewCell class] forCellReuseIdentifier:@"comment"];
    [self.view addSubview:self.showView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.myShowCommentCell = [self.showCommentTableView dequeueReusableCellWithIdentifier:@"comment" forIndexPath:indexPath];
    [self.myShowCommentCell.myHeadButton sd_setBackgroundImageWithURL:[NSURL URLWithString:self.allCommentArray[indexPath.row][4]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"head_portrait.jpg"]];
    self.myShowCommentCell.myNameLabel.text = self.allCommentArray[indexPath.row][3];
    self.myShowCommentCell.myCommentLabel.text = self.allCommentArray[indexPath.row][6];
    
    return self.myShowCommentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allCommentArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//按钮事件
- (void)pressSend:(UIButton *)button {
    NSLog(@"%@", self.showView.sendContentTextField.text);
    
    if (![self.showView.sendContentTextField.text isEqualToString:@""]) {
        self.myGetComment = [SendComment shareManager];
        self.myGetComment.uid = self.uid;
        self.myGetComment.mobileToken = self.mobileToken;
        self.myGetComment.articleId = self.getAllData[self.location][0];
        self.myGetComment.comment = [self.showView.sendContentTextField.text copy];
        
        [[SendComment shareManager] AddCommentWithData:^(AddArticleJSONModel * _Nullable addCommentModel) {
            NSLog(@"%@", addCommentModel);
        } andError:^(NSError * _Nullable error) {
            NSLog(@"发送失败");
        }];
    } else {
        UIAlertController *tempAlert = [UIAlertController alertControllerWithTitle:@"警告！！！" message:@"请输入你要发送的评论！！！" preferredStyle:UIAlertControllerStyleAlert];
        [tempAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:tempAlert animated:YES completion:nil];
    }
    
    self.showView.sendContentTextField.text = @""; //清空textField
    [self.showCommentTableView reloadData];
}

//获取评论
- (void)getComment {
    self.allCommentArray = [[NSMutableArray alloc] init];
    
    self.myGetComment = [SendComment shareManager];
    self.myGetComment.uid = self.uid;
    self.myGetComment.mobileToken = self.mobileToken;
    self.myGetComment.articleId = self.getAllData[self.location][0];
    
    [[SendComment shareManager] GetCommentWithData:^(GetCommentJSONModel * _Nullable addCommentModel) {
        NSMutableArray *tempArrayTwo = [[NSMutableArray alloc] init];
        
        NSArray *tempDictThree = [addCommentModel.data comment];
        for (ArticleComment *model in tempDictThree) {
            tempArrayTwo = [[NSMutableArray alloc] init];
            [tempArrayTwo addObject:[model gmtCreate]];
            [tempArrayTwo addObject:[model commentId]];
            [tempArrayTwo addObject:[model uid]];
            [tempArrayTwo addObject:[model username]];
            [tempArrayTwo addObject:[model headSculpture]];
            [tempArrayTwo addObject:[model articleId]];
            [tempArrayTwo addObject:[model comment]];
            [self.allCommentArray addObject:tempArrayTwo];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.showCommentTableView reloadData];
        });
        
        
    } andError:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
}

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.showView.sendContentTextField resignFirstResponder];
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
