//
//  HomePageUIView.m
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import "HomePageUIView.h"

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
            make.top.equalTo(self).offset(0);
            make.left.equalTo(self).offset(0);
            make.width.mas_offset(W);
            make.height.mas_offset(H / 2);
    }];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"0"];
    
    
    
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.searchController.active) {
        return [self.dataArray count];
    } else {
        return [self.searchArray count];
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomePageTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0"];
    return cell;
}



@end
