//
//  HomePageViewController.m
//  约球
//
//  Created by 张佳乔 on 2022/1/1.
//

#import "HomePageViewController.h"

#import "Masonry.h"


#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.homePageView = [[HomePageUIView alloc] initWithFrame:CGRectMake(0, 0, W, H)];
    [self addSearch];
    
}
- (void) addSearch {
    self.homePageView.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.homePageView.searchController.delegate = self;
    self.homePageView.searchController.searchResultsUpdater = self;
    self.homePageView.searchController.searchBar.frame = CGRectMake(self.homePageView.searchController.searchBar.frame.origin.x, self.homePageView.tableView.frame.origin.y, W, 55.0f);
    self.homePageView.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    self.homePageView.tableView.tableHeaderView = self.homePageView.searchController.searchBar;
    
    self.homePageView.searchController.searchBar.barTintColor = [UIColor yellowColor];

    self.homePageView.searchController.obscuresBackgroundDuringPresentation = YES;
    [self.view addSubview:self.homePageView];
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString* searchString = [self.homePageView.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.homePageView.searchArray != nil) {
        [self.homePageView.searchArray removeAllObjects];
    }
    
    //过滤数据
    self.homePageView.searchArray = [NSMutableArray arrayWithArray:[self.homePageView.dataArray filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.homePageView.tableView reloadData];
}


@end
