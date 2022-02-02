//
//  HQBSearchViewController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/1/29.
//

#import "HQBSearchViewController.h"

@interface HQBSearchViewController ()

@end

@implementation HQBSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationController.navigationBarHidden = NO;
    
    self.searchView = [[HQBSearchView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - [self hGetNavigationbarHeight])];
    
    [self.view addSubview:self.searchView];
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    self.searchArray = [NSMutableArray array];
    self.searchView.tableView.delegate = self;
    self.searchView.tableView.dataSource = self;

    self.searchController.obscuresBackgroundDuringPresentation = YES;

    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.hidesNavigationBarDuringPresentation= NO;
//    self.definesPresentationContext = YES;
    self.searchView.tableView.tableHeaderView = self.searchController.searchBar;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.searchController.active) {
        return [self.searchArray count];
    } else {
        return [self.dataArray count];
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (self.searchController.active) {
        [cell.textLabel setText:self.searchArray[indexPath.row]];
    } else {
        [cell.textLabel setText:self.dataArray[indexPath.row]];
    }
    return cell;
}

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    
    NSString* searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.searchArray.count != 0) {
        [self.searchArray removeAllObjects];
    }
    
    //过滤数据
    self.searchArray = [NSMutableArray arrayWithArray:[self.dataArray filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.searchView.tableView reloadData];
}

- (float)hGetNavigationbarHeight {
    return self.navigationController.navigationBar.frame.size.height;
}
@end
