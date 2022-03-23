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
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface MyViewController ()

@property (nonatomic, strong) UIImage *getImage;  //获取到的照片
@property (nonatomic, strong) UIButton *tempButton;  //指针，指向选择的按钮

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more.png"] style:UIBarButtonItemStylePlain target:self action:@selector(touchMore)];
    rightButton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    //tableview
    self.menuArray = [NSArray arrayWithObjects:@"编辑资料",@"我的课程列表", @"我收藏的球馆", @"退出",nil];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H) style:UITableViewStylePlain];
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
    return 6;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  if (indexPath.row == 0) {
      self.myCell = [self.tableView dequeueReusableCellWithIdentifier:@"background"];
      [self.myCell.backImageView addTarget:self action:@selector(changeBackImage:) forControlEvents:UIControlEventTouchUpInside];
      return self.myCell;
  } else if (indexPath.row == 1) {
      self.myCell = [self.tableView dequeueReusableCellWithIdentifier:@"MyMessage"];
      self.myCell.selectionStyle = UITableViewCellSelectionStyleNone;
      [self.myCell.buttonHead addTarget:self action:@selector(changeHeadBack:) forControlEvents:UIControlEventTouchUpInside];
      return self.myCell;
  } else {
      self.myCell = [self.tableView dequeueReusableCellWithIdentifier:@"menu"];
      self.myCell.textLabel.text = self.menuArray[indexPath.row - 2];
      self.myCell.selectionStyle = UITableViewCellSelectionStyleNone;
      return self.myCell;
  }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
      
    if (indexPath.row == 2) {
        self.hidesBottomBarWhenPushed = YES;
        EditMessageController* editMessageController = [[EditMessageController alloc] init];
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
      } else if (indexPath.row == 5) {
          UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
          UIAlertAction *exitLogin = [UIAlertAction actionWithTitle:@"退出登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              NSLog(@"退出登陆");
          }];
          UIAlertAction *exitApp = [UIAlertAction actionWithTitle:@"退出到桌面" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              exit(0);
          }];
          UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
          [alertSheet addAction:exitLogin];
          [alertSheet addAction:exitApp];
          [alertSheet addAction:cancel];
          [self presentViewController:alertSheet animated:YES completion:nil];
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
    [self p_getPhotos];
}

//改头像
- (void)changeHeadBack:(UIButton *)button {
    self.tempButton = button;
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

@end
