//
//  EditMessageController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/22.
//

#import "EditMessageController.h"
#import "SendPersonInfoManager.h"
@interface EditMessageController ()

@end

@implementation EditMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithTitle:@"完成编辑" style:UIBarButtonItemStyleDone target:self action:@selector(pressDone)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.editMessageView = [[EditMessageView alloc] initWithFrame:self.view.bounds];
    self.editMessageView.nameString = self.nameString;
    self.editMessageView.sex = self.sex;
    self.editMessageView.birthString = self.birthString;
    self.editMessageView.signatureString = self.signatureString;
    self.editMessageView.emaileString = self.emaileString;
    self.editMessageView.labelString = self.labelString;
    [self.view addSubview:self.editMessageView];
}

- (void)pressDone {
    NSLog(@"--------------------------------------------");
    NSLog(@"%@, %ld, %@, %@, %@ %@", self.editMessageView.nameString, self.editMessageView.sex, self.editMessageView.birthString, self.editMessageView.emaileString, self.editMessageView.signatureString, self.editMessageView.labelString);
    NSLog(@"--------------------------------------------");
    
    SendPersonInfoManager* manager = [SendPersonInfoManager shareManager];
    manager.uidString = self.uid;
    manager.nameString = self.editMessageView.nameString;
    manager.birthString = self.editMessageView.birthString;
    manager.sex = self.editMessageView.sex;
    manager.signatureString = self.editMessageView.signatureString;
    
    manager.emaileString = self.editMessageView.emaileString;
    dispatch_queue_t queue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t netWorkGroup = dispatch_group_create();
    dispatch_group_enter(netWorkGroup);
    dispatch_group_async(netWorkGroup, queue, ^{
        [[SendPersonInfoManager shareManager] sendPersonInfoWithData:^(SendPersonInfoModel * _Nullable sendPersonInfoModel) {
            if(sendPersonInfoModel.code == 200) {
                NSLog(@"上传个人资料成功！");
            } else {
                NSLog(@"上传失败！");
            }
            dispatch_group_leave(netWorkGroup);
            } andError:^(NSError * _Nullable error) {
                NSLog(@"上传修改后的个人资料出错！");
                dispatch_group_leave(netWorkGroup);
            }];
    });
    dispatch_group_enter(netWorkGroup);
    manager.labelString = self.editMessageView.labelString;
    dispatch_group_async(netWorkGroup, queue, ^{
        [[SendPersonInfoManager shareManager] sendLabelWithData:^(SendLabelModel * _Nullable sendLabelModel) {
            if (sendLabelModel.code == 200) {
                NSLog(@"上传标签成功！");
            } else {
                NSLog(@"上传便签出错！");
                
            }
            dispatch_group_leave(netWorkGroup);
            } andError:^(NSError * _Nullable error) {
                NSLog(@"上传标签出错！");
                dispatch_group_leave(netWorkGroup);
            }];
        
    });
    dispatch_group_notify(netWorkGroup, dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}



@end
