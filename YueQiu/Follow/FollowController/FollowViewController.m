//
//  FollowViewController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/16.
//

#import "FollowViewController.h"
#import "FollowerManager.h"
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface FollowViewController ()

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FollowerManager* followerManager = [FollowerManager shareManager];
    followerManager.uid = self.idString;
    followerManager.myUid = self.myIDString;
    followerManager.token = self.token;
    [self getFollowMessage];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cancelFollow)name:@"cancel" object: nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addFollow)name:@"add" object: nil];
    
}
- (void) getFollowMessage {
    [[FollowerManager shareManager] getMessageWithData:^(FollowerModel * _Nullable followerModel) {
        if (followerModel.code == 200) {
            NSLog(@"请求成功");
            dispatch_async(dispatch_get_main_queue(), ^{
                self.followView = [[FollowView alloc] initWithFrame:CGRectMake(0, 0, W, H)];
                self.followView.backgroundString = [NSString stringWithFormat:@"%@", followerModel.data.background];
                self.followView.headString = [NSString stringWithFormat:@"%@", followerModel.data.headSculpture];
                self.followView.signature = [NSString stringWithFormat:@"%@", followerModel.data.signature];
                self.followView.sex = followerModel.data.sex;
                self.followView.name = [NSString stringWithFormat:@"%@", followerModel.data.username];
                self.followView.birth = [NSString stringWithFormat:@"%@", followerModel.data.birthday];
                self.followView.isFollow = followerModel.data.isFollow;
                [self.view addSubview:self.followView];
            });
        } else {
            NSLog(@"请求失败");
        }
    } andError:^(NSError * _Nullable error) {
        NSLog(@"请求失败");
    }];
}
- (void)cancelFollow {
    NSLog(@"cancel");
    [[FollowerManager shareManager] cancelFollowWithData:^(AddAndCancelModel * _Nullable cancelModel) {
        if(cancelModel.code == 200) {
            [self getFollowMessage];
        } else {
            NSLog(@"取消关注失败");
        }
    } andError:^(NSError * _Nullable error) {
        NSLog(@"取消关注失败");
    }];
    
}

- (void)addFollow {
    NSLog(@"add");
    [[FollowerManager shareManager] addFollowWithData:^(AddAndCancelModel * _Nullable addModel) {
            if(addModel.code == 200) {
                NSLog(@"关注成功");
                [self getFollowMessage];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    
//                });
            } else {
                NSLog(@"关注失败");
            }
        } andError:^(NSError * _Nullable error) {
            NSLog(@"关注失败");
        }];
    
}

@end
