//
//  HomePageUIView.m
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import "HomePageUIView.h"
#import "HomePageMModel.h"
#import "HomePageTableViewCell.h"
#import "Masonry.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation HomePageUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.tableView = [[UITableView alloc] init];
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(H / 18);
            make.left.equalTo(self).offset(W * 0.25);
            make.width.mas_offset(0.5 * W);
            make.height.mas_offset(0.05 * H);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"0"];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomePageTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0"];
    return cell;
}

@end
