//
//  ReleaseGameViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/26.
//

#import "ReleaseGameViewController.h"
#import "Masonry.h"
#import "AddArticleModel.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface ReleaseGameViewController ()

@property (nonatomic, strong) NSString *dateAndTime;  //选择的时间

@end

@implementation ReleaseGameViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发表";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取当前时间日期
    NSDate *date = [NSDate date];
    NSDateFormatter *format1 = [[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy-MM-dd HH:mm"];
    self.dateAndTime = [format1 stringFromDate:date];
    NSLog(@"%@", self.dateAndTime);
    
    //初始化视图
    [self initReleaseGameView];
}

//初始化视图
- (void)initReleaseGameView {
    self.releaseGameView = [[ReleaseGameView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.releaseGameView.showDatePicker addTarget:self action:@selector(oneDatePickerValueChanged:)forControlEvents:UIControlEventValueChanged]; // 添加监听器
    [self.releaseGameView.sendButton addTarget:self action:@selector(pressSend:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.releaseGameView];
}

//监听事件
- (void)oneDatePickerValueChanged:(UIDatePicker *)sender {
    NSDate *select = [sender date]; // 获取被选中的时间
    NSDateFormatter *selectDateFormatter = [[NSDateFormatter alloc] init];
    selectDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm"; // 设置时间和日期的格式
    self.dateAndTime = [selectDateFormatter stringFromDate:select]; // 把date类型转为设置好格式的string类型
    NSLog(@"%@", self.dateAndTime);
}

//发送按钮事件
- (void)pressSend:(UIButton *)button {
    if ([self.releaseGameView.locationTextField.text isEqualToString:@""] || [self.releaseGameView.contentTextField.text isEqualToString:@""]) {
        //弹窗提示
        self.sendAlertView = [UIAlertController alertControllerWithTitle:@"请输入位置和内容！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:self.sendAlertView animated:true completion:nil];
    } else {
        AddArticleModel *addArticle = [AddArticleModel shareManager];
        addArticle.uid = self.uid;
        addArticle.mobileToken = self.mobileToken;
        addArticle.content = self.releaseGameView.contentTextField.text;
        addArticle.address = self.releaseGameView.locationTextField.text;
        addArticle.time = self.dateAndTime;
        
        [[AddArticleModel shareManager] AddArticleWithData:^(AddArticleJSONModel * _Nullable addArticleModel) {
            NSLog(@"%@  %ld", addArticleModel.msg, addArticleModel.code);
        } andError:^(NSError * _Nullable error) {
            NSLog(@"获取失败!");
        }];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
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
