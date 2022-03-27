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
    [self.view addSubview:self.editMessageView];
}

- (void)pressDone {
    SendPersonInfoManager* manager = [SendPersonInfoManager shareManager];
    manager.uidString = self.uid;
    manager.nameString = self.editMessageView.nameString;
    manager.birthString = self.editMessageView.birthString;
    manager.sex = self.editMessageView.sex;
    manager.signatureString = self.editMessageView.signatureString;
    manager.emaileString = self.emaileString;
    manager.token = self.token;
    [[SendPersonInfoManager shareManager] sendPersonInfoWithData:^(SendPersonInfoModel * _Nullable sendPersonInfoModel) {
            if(sendPersonInfoModel.code == 200) {
                NSLog(@"上传个人资料成功！");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.navigationController popViewControllerAnimated:YES];
                });
            } else {
                NSLog(@"上传失败！");
            }
            } andError:^(NSError * _Nullable error) {
                NSLog(@"上传修改后的个人资料出错！");
                
            }];
}



@end
