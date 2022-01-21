//
//  BoutiqueView.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/21.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "NewsTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BoutiqueView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *showBoutiqueTableView;

@end

NS_ASSUME_NONNULL_END
