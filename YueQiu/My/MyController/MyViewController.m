//
//  MyViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "MyViewController.h"
#import "SettingController.h"
#import "MyCollectStadiumController.h"
#import "MyCourseViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "EditMessageController.h"
#import "SendPhotosModel.h"
#import "GetMessageManager.h"
#import <SDWebImage/UIButton+WebCache.h>

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface MyViewController ()

@property (nonatomic, strong) UIImage *getImage;  //获取到的照片
@property (nonatomic, strong) UIButton *tempButton;  //指针，指向选择的按钮
@property (nonatomic, retain) UIAlertController* sendAlertView;  //提示框
@property (nonatomic, strong) NSString *transString;  //传输图片的类型
@property (nonatomic, strong) NSArray *imageViewArray;  //图片名字

@end

@implementation MyViewController

- (void)viewWillAppear:(BOOL)animated {
    [self p_getPersonInfo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more.png"] style:UIBarButtonItemStylePlain target:self action:@selector(touchMore)];
    rightButton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self p_getPersonInfo];
    
    
    //tableview
    self.menuArray = [NSArray arrayWithObjects:@"编辑资料", @"我的球局", @"我收藏的球馆", nil];
    self.imageViewArray = [NSArray arrayWithObjects:@"bianji3.png", @"lanqiu-copy-2.png", @"shoucang-4.png", nil];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H / 1.07) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"background"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyMessage"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"menu"];
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
      if (indexPath.row == 0) {
          return H / 3;
      } else if (indexPath.row == 1) {
          return 150;
      } else {
          return 60;
      }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  if (indexPath.row == 0) {
      self.myCell = [self.tableView dequeueReusableCellWithIdentifier:@"background"];
      [self.myCell.backImageView sd_setBackgroundImageWithURL:[NSURL URLWithString:self.background] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"background.jpg"]];
      [self.myCell.backImageView addTarget:self action:@selector(changeBackImage:) forControlEvents:UIControlEventTouchUpInside];
      return self.myCell;
  } else if (indexPath.row == 1) {
      self.myCell = [self.tableView dequeueReusableCellWithIdentifier:@"MyMessage"];
      self.myCell.selectionStyle = UITableViewCellSelectionStyleNone;
      [self.myCell.buttonHead sd_setBackgroundImageWithURL:[NSURL URLWithString:self.head_sculpture] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"head_portrait.jpg"]];
      [self.myCell.buttonHead addTarget:self action:@selector(changeHeadBack:) forControlEvents:UIControlEventTouchUpInside];
      if (self.username) {
          self.myCell.labelName.text = self.username;
          self.myCell.labelPersonalSignature.text = self.signature;
      } else {
          self.myCell.labelName.text = @"神秘用户";
          self.myCell.labelPersonalSignature.text = NULL;
      }
      return self.myCell;
  } else {
      self.myCell = [self.tableView dequeueReusableCellWithIdentifier:@"menu"];
      [self.myCell.cellImageView setImage:[UIImage imageNamed:self.imageViewArray[indexPath.row - 2]]];
      self.myCell.cellNameLabel.text = self.menuArray[indexPath.row - 2];
      self.myCell.selectionStyle = UITableViewCellSelectionStyleNone;
      return self.myCell;
  }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
      
    if (indexPath.row == 2) {
        self.hidesBottomBarWhenPushed = YES;
        EditMessageController* editMessageController = [[EditMessageController alloc] init];
        editMessageController.uid = self.onlyUid;
        editMessageController.nameString = [NSString stringWithFormat:@"%@", self.username];
        editMessageController.birthString = [NSString stringWithFormat:@"%@", self.birthday];
        editMessageController.sex = self.sex;
        editMessageController.emaileString = [NSString stringWithFormat:@"%@", self.email];
        editMessageController.signatureString = [NSString stringWithFormat:@"%@", self.signature];
//        editMessageController.labelString = [NSString stringWithFormat:@"%@", self.label];
        editMessageController.token = self.token;
        [self.navigationController pushViewController:editMessageController animated:YES];
        
        self.hidesBottomBarWhenPushed = NO;
    } else if (indexPath.row == 3) {
          self.hidesBottomBarWhenPushed = YES;
          MyCourseViewController* myCourseController = [[MyCourseViewController alloc] init];
          [self.navigationController pushViewController:myCourseController animated:YES];
          self.hidesBottomBarWhenPushed = NO;

      } else if (indexPath.row == 4) {
          self.hidesBottomBarWhenPushed = YES;
          MyCollectStadiumController* collectStadiumController = [[MyCollectStadiumController alloc] init];
          [self.navigationController pushViewController:collectStadiumController animated:YES];
          self.hidesBottomBarWhenPushed = NO;
      }
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
//获取tabBar的高度
- (float)hGetTabHeight {
    return self.tabBarController.tabBar.frame.size.height;
}
- (void)touchMore{
    self.hidesBottomBarWhenPushed = YES;
    SettingController* settingController = [[SettingController alloc] init];
    [self.navigationController pushViewController:settingController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

//改变背景图
- (void)changeBackImage:(UIButton *)button {
    self.tempButton = button;
    self.transString = @"updateBack";
    [self p_getPhotos];
}

//改头像
- (void)changeHeadBack:(UIButton *)button {
    self.tempButton = button;
    self.transString = @"updateHead";
    [self p_getPhotos];
}

//推出选择框
- (void)p_getPhotos {
    //调用摄像头
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOne = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *cameraPicker = [[UIImagePickerController alloc] init];
            cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            cameraPicker.delegate = self;
            cameraPicker.allowsEditing = YES;
            cameraPicker.mediaTypes = @[(NSString *)kUTTypeImage];
            [cameraPicker setVideoQuality:UIImagePickerControllerQualityTypeIFrame1280x720];
            [self presentViewController:cameraPicker animated:YES completion:nil];
        } else {
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"没有摄像头" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
            [controller addAction:action];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }];
    
    //调用相册
    UIAlertAction *actionTwo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.mediaTypes = @[(NSString *)kUTTypeImage];
        [self presentViewController:picker animated:YES completion:nil];
    }];
    
    //取消
    UIAlertAction *actionThree = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    //添加事件
    [alert addAction:actionOne];
    [alert addAction:actionTwo];
    [alert addAction:actionThree];
    
    //推出警告提示框
    [self presentViewController:alert animated:YES completion:nil];
}

//选取或拍摄图片或视频之后执行的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    //获取到的照片
    self.getImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (info.count == 5) {  //这里通过key的个数来判断是否需要保存在手机
        //将照片保存在相册
        UIImageWriteToSavedPhotosAlbum(self.getImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    //发送数据给后台
    [self p_sendPhotos];
    
    //设置新的图片给按钮
    [self.tempButton setImage:self.getImage forState:UIControlStateNormal];

    [picker dismissViewControllerAnimated:YES completion:nil];
}

//保存照片的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
    if (error) {
        NSLog(@"%@", error);
        NSLog(@"保存照片过程中发生错误，错误信息:%@", error.localizedDescription);
    }
}

//保存图片返回路径
- (NSString *)savePhotosBackPath:(UIImage *)image {
    NSData *imageData = UIImagePNGRepresentation(image);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
        
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"headSculpture.png"];
        
    [imageData writeToFile:savedImagePath atomically:YES];
    
    return savedImagePath;
}

//发送数据给后台
- (void)p_sendPhotos {
    SendPhotosModel *sendPhotos = [SendPhotosModel shareManager];
    sendPhotos.onlyUid = self.onlyUid;
    sendPhotos.token = self.token;
    sendPhotos.transPhotosType = self.transString;
    sendPhotos.savedImagePath = [self savePhotosBackPath:self.getImage];
    sendPhotos.sendPhotosFile = UIImagePNGRepresentation(self.getImage);
    
    [[SendPhotosModel shareManager] SendPhotosWithData:^(SendPhotosJSONModel * _Nullable sendPhotosModel) {
        NSLog(@"%@   %@   %ld", sendPhotosModel.data, sendPhotosModel.msg, (long)sendPhotosModel.code);
        
        if (sendPhotosModel.code == 200) {
            NSLog(@"更换成功！");
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //弹窗提示
                self.sendAlertView = [UIAlertController alertControllerWithTitle:@"更换失败！" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [self.sendAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                [self presentViewController:self.sendAlertView animated:true completion:nil];
            });
        }
    } andError:^(NSError * _Nullable error) {
        NSLog(@"获取失败！");
    }];
}

- (void)p_getPersonInfo {
    GetMessageManager* manager = [GetMessageManager shareManager];
    manager.uid = self.onlyUid;
    manager.token = self.token;
    [[GetMessageManager shareManager] getMessageWithData:^(GetMessageModel * _Nullable getMessageModel) {

        if (getMessageModel.code == 200) {
            self.username = getMessageModel.data.username;
            self.phone_numbers = getMessageModel.data.phoneNumbers;
            self.birthday = getMessageModel.data.birthday;
            self.sex = getMessageModel.data.sex;
            self.email = getMessageModel.data.email;
            self.signature = getMessageModel.data.signature;
            self.label = getMessageModel.data.label;
            self.background = getMessageModel.data.background;
            self.head_sculpture = getMessageModel.data.headSculpture;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"---------------------------------------");
            NSLog(@"获取个人信息错误！");
            NSLog(@"---------------------------------------");
        }
    } andError:^(NSError * _Nullable error) {
        NSLog(@"获取个人信息失败");
    }];
}

@end
