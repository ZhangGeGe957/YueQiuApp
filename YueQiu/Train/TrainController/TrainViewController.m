//
//  TrainViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "TrainViewController.h"

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface TrainViewController ()

@end

@implementation TrainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initInterface];
}

- (void)initInterface {
    self.trainView = [[TrainView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    [self.view addSubview:self.trainView];
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
