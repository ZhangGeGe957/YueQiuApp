//
//  HomePageUIView.m
//  约球
//
//  Created by haoqianbiao on 2022/1/2.
//

#import "HomePageUIView.h"
#import "Masonry.h"
#import "HQBSearchViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

NSString *const identityHomePageViewNotice = @"homePage";

@implementation HomePageUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.nameArray = [NSArray arrayWithObjects:@"韦曲球馆", @"万科球馆", @"GOGO球馆", nil];
    self.placeArray = [NSArray arrayWithObjects:@"韦曲南街", @"万科广场", @"GOGO商场", nil];
    self.distanceArray = [NSArray arrayWithObjects:@"<5km", @"<1km", @"<2km", nil];

    self.priceArray = [NSArray arrayWithObjects:@"10元/h", @"20元/h", @"15元/h", nil];
    self.typeArray = [NSArray arrayWithObjects:@"篮球", @"乒乓球", @"羽毛球", nil];
    

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, W, self.frame.size.height) style:UITableViewStylePlain];
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
        self.homeCell = [self.tableView dequeueReusableCellWithIdentifier:@"stadium"];
        
        [self.homeCell.nameButton setTitle:self.nameArray[indexPath.row] forState:UIControlStateNormal];
        self.homeCell.nameButton.tag = indexPath.row;
        [self.homeCell.nameButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.homeCell.placeButton setTitle:self.placeArray[indexPath.row] forState:UIControlStateNormal];
        self.homeCell.placeButton.tag = indexPath.row;
        [self.homeCell.placeButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.homeCell.distanceButton setTitle:self.distanceArray[indexPath.row] forState:UIControlStateNormal];
        self.homeCell.distanceButton.tag = indexPath.row;
        [self.homeCell.distanceButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.homeCell.typeButton setTitle:self.typeArray[indexPath.row] forState:UIControlStateNormal];
        self.homeCell.typeButton.tag = indexPath.row;
        
        [self.homeCell.priceButton setTitle:self.priceArray[indexPath.row] forState:UIControlStateNormal];
        self.homeCell.priceButton.tag = indexPath.row;
        
        self.homeCell.scheduleButton.tag = indexPath.row;
        [self.homeCell.scheduleButton addTarget:self action:@selector(touchToSchedule:) forControlEvents:UIControlEventTouchUpInside];
        
        self.homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return self.homeCell;
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
    self.transDataDictionary = [[NSMutableDictionary alloc] init];
    [self.transDataDictionary setValue:self.nameArray[button.tag] forKey:@"name"];
    [self.transDataDictionary setValue:self.placeArray[button.tag] forKey:@"place"];
    [self.transDataDictionary setValue:self.distanceArray[button.tag] forKey:@"distance"];
    [self.transDataDictionary setValue:self.typeArray[button.tag] forKey:@"type"];
    [self.transDataDictionary setValue:self.priceArray[button.tag] forKey:@"price"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:identityHomePageViewNotice object:nil userInfo:self.transDataDictionary];
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

