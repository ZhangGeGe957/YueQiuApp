//
//  MyFollowerController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/18.
//

#import "MyFollowerController.h"
#import "MyFollowerManager.h"

@interface MyFollowerController ()

@end

@implementation MyFollowerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的关注";
    self.myFollowerView = [[MyFollowerView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.myFollowerView];
    [self p_getFollower];
}

- (void)p_getFollower {
    MyFollowerManager* manager = [MyFollowerManager shareManager];
    manager.uid = self.uid;
    manager.mobileToken = self.mobileToken;
    [[MyFollowerManager shareManager] getFollowerWithData:^(MyFollowerModel * _Nullable myFollowerModel) {
        if(myFollowerModel.code == 200) {
            for (int i = 0; i < myFollowerModel.data.count; i++) {
                NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
                [dict setValue:[myFollowerModel.data[i] valueForKey:@"uid"] forKey:@"uid"];
                [dict setValue:[myFollowerModel.data[i] valueForKey:@"username"] forKey:@"username"];
                [dict setValue:[myFollowerModel.data[i] valueForKey:@"headSculpture"] forKey:@"headSculpture"];
                [dict setValue:@"1" forKey:@"isFollow"];
                [self.myFollowerView.dataArray addObject:dict];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.myFollowerView.tableView reloadData];
            });
        } else {
            NSLog(@"获取关注列表失败！");
        }
    } andError:^(NSError * _Nullable error) {
        NSLog(@"获取关注列表失败！");
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < self.myFollowerView.dataArray.count; i++) {
        
        if ([[self.myFollowerView.dataArray[i] valueForKey:@"isFollow"] isEqualToString:@"0"]) {
            MyFollowerManager* manager = [MyFollowerManager shareManager];
            manager.otherUid = [self.myFollowerView.dataArray[i] valueForKey:@"uid"];
            dispatch_async(queue, ^{
                [[MyFollowerManager shareManager] cancelFollowWithData:^(CancelFollowModel * _Nullable cancelFollowModel) {
                    if (cancelFollowModel.code == 200) {
                        NSLog(@"%@取消关注成功！", [self.myFollowerView.dataArray[i] valueForKey:@"username"]);
                    } else {
                        NSLog(@"%@取消关注失败！", [self.myFollowerView.dataArray[i] valueForKey:@"username"]);
                    }
                } andError:^(NSError * _Nullable error) {
                    NSLog(@"%@取消关注失败！", [self.myFollowerView.dataArray[i] valueForKey:@"username"]);
                }];
            });
        }
    }
}

@end
