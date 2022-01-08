//
//  HomePageUIView.m
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import "HomePageUIView.h"
#import "HomePageMModel.h"
#import "Masonry.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation HomePageUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.tableView = [[UITableView alloc] init];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).mas_offset(H / 20);
            make.left.equalTo(self).mas_offset(W*0.3);
            make.width.mas_equalTo(0.5*W);
            make.height.mas_equalTo(0.01 * H);
    }];
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchController = [[UISegmentedControl alloc] init]
    
    return self;
}



@end
