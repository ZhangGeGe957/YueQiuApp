//
//  TrainViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "TrainViewController.h"
#import "Masonry.h"
#import "TrainView.h"
#import <MobileCoreServices/MobileCoreServices.h>

#define myWidth [UIScreen mainScreen].bounds.size.width
#define myHeight [UIScreen mainScreen].bounds.size.height

@interface TrainViewController ()

@property CGFloat navHeight;  //获取到的导航栏高度
@property (nonatomic, strong) TrainView *trainView;
@property (nonatomic, strong) UIImage *getImage;  //获取到的照片
@property (nonatomic, retain) UIAlertController* sendAlertView;  //提示框
@property (nonatomic, strong) NSString *transString;  //传输图片的类型

@end

@implementation TrainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initInterface];
}

//初始化视图
- (void)initInterface {
    //获取导航栏+状态栏的高度
    self.navHeight = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    self.trainView = [[TrainView alloc] initWithFrame:CGRectMake(0, self.navHeight, myWidth, myHeight / 1.18)];
    [self.trainView.foodDistinguishButton addTarget:self action:@selector(pressFood:) forControlEvents:UIControlEventTouchUpInside];
    [self.trainView.apparatusDistinguishButton addTarget:self action:@selector(pressApparatus:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.trainView];
}

//按钮事件
- (void)pressFood:(UIButton *)button {
    NSLog(@"food");
    [self p_getPhotos];
}
- (void)pressApparatus:(UIButton *)button {
    NSLog(@"apparatus");
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
