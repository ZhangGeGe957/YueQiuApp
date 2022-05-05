//
//  ShowArticleViewController.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowArticleViewController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property CGFloat navHeight;  //获取到的导航栏高度
@property (nonatomic, strong) NSMutableArray *getAllData;  //所有数据
@property NSInteger location;
@property (nonatomic, strong) NSString *uid;  //唯一uid
@property (nonatomic, strong) NSString *mobileToken;  //设备码
@property (nonatomic, strong) UITableView *showCommentTableView;  //评论展示
@property (nonatomic, strong) NSMutableArray *allCommentArray;  //所有评论

@end

NS_ASSUME_NONNULL_END
