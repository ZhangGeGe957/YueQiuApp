//
//  ReleaseGameViewController.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/2/26.
//

#import "ReleaseGameViewController.h"
#import "Masonry.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface ReleaseGameViewController ()

@end

@implementation ReleaseGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化视图
    [self initReleaseGameView];
}

//初始化视图
- (void)initReleaseGameView {
    self.releaseGameView = [[ReleaseGameView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.view addSubview:self.releaseGameView];
}

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.releaseGameView.contentTextField resignFirstResponder];
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
