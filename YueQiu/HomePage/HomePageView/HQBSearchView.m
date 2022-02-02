//
//  HQBSearchView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/1.
//

#import "HQBSearchView.h"

@implementation HQBSearchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [self addSubview:self.tableView];
    
    
    
    return self;
}

@end
