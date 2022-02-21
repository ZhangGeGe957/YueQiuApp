//
//  HomePageUIView.m
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import "HomePageUIView.h"
#import "HomePageTableViewCell.h"
#import "Masonry.h"
#import "HQBSearchViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@implementation HomePageUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.nameArray = [NSArray arrayWithObjects:@"韦曲球馆", @"万科球馆", @"GOGO球馆", nil];
    self.placeArray = [NSArray arrayWithObjects:@"韦曲南街", @"万科广场", @"GOGO商场", nil];
    self.distanceArray = [NSArray arrayWithObjects:@"<5km", @"<1km", @"<2km", nil];

    self.priceArray = [NSArray arrayWithObjects:@"10元/h", @"20元/h", @"15元/h", nil];
    self.typeArray = [NSArray arrayWithObjects:@"篮球", @"乒乓球", @"羽毛球", nil];
    

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, self.frame.size.height) style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;


    
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"imageView"];
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"stadium"];
    
    return self;
}

- (void)touchSearch{
    self.controller = [self viewController];
    HQBSearchViewController* searchViewController = [[HQBSearchViewController alloc] init];
    [self.controller.navigationController pushViewController:searchViewController animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    } else {
        return 1;
    }
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        HomePageTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"stadium"];
        [cell.nameButton setTitle:self.nameArray[indexPath.row] forState:UIControlStateNormal];
        cell.nameButton.tag = 101 + indexPath.row * 3;
        [cell.nameButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.placeButton setTitle:self.placeArray[indexPath.row] forState:UIControlStateNormal];
        cell.placeButton.tag = 101 + indexPath.row * 3 + 1;
        [cell.placeButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.distanceButton setTitle:self.distanceArray[indexPath.row] forState:UIControlStateNormal];
        cell.distanceButton.tag = 101 + indexPath.row * 3 + 2;
        [cell.distanceButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell.typeButton setTitle:self.typeArray[indexPath.row] forState:UIControlStateNormal];
        [cell.priceButton setTitle:self.priceArray[indexPath.row] forState:UIControlStateNormal];
        cell.scheduleButton.tag = 201 + indexPath.row;
        [cell.scheduleButton addTarget:self action:@selector(touchToSchedule:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        HomePageTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"imageView"];
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
- (void)touchButton:(UIButton*)button {
    
}

- (void)touchToSchedule:(UIButton*)button {
    
}
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


@end

