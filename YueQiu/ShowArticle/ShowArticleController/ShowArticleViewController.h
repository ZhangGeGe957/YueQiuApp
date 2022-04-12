//
//  ShowArticleViewController.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowArticleViewController : UIViewController<UITextFieldDelegate>

@property CGFloat navHeight;  //获取到的导航栏高度
@property (nonatomic, strong) NSMutableArray *getAllData;  //所有数据
@property NSInteger location;

@end

NS_ASSUME_NONNULL_END
