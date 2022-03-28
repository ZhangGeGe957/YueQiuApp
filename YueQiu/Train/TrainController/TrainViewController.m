//
//  TrainViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "TrainViewController.h"
#import "TrainShowTableViewCell.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface TrainViewController ()

@property (nonatomic, strong) TrainShowTableViewCell *myShowCell;

@end

@implementation TrainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initInterface];
}

//初始化视图
- (void)initInterface {
    self.showTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight / 1.08) style:UITableViewStylePlain];
    self.showTableView.dataSource = self;
    self.showTableView.delegate = self;
    self.showTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.showTableView];
    [self.showTableView registerClass:[TrainShowTableViewCell class] forCellReuseIdentifier:@"show"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.myShowCell = [self.showTableView dequeueReusableCellWithIdentifier:@"show" forIndexPath:indexPath];
    [self.myShowCell.showImageView setImage:[UIImage imageNamed:@"3.jpg"]];
    self.myShowCell.titleShowLabel.text = @"这是一个牛逼哄哄的标题aaugugubuvbvtuvuyv说的孤独感";
    self.myShowCell.readpersonLabel.text = @"100";
    
    return self.myShowCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
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
