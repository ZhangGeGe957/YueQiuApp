//
//  EditMessageController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/22.
//

#import "EditMessageController.h"

@interface EditMessageController ()

@end

@implementation EditMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithTitle:@"完成编辑" style:UIBarButtonItemStyleDone target:self action:@selector(pressDone)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.editMessageView = [[EditMessageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.editMessageView];
    
    
}

- (void)pressDone {
    
}

@end
