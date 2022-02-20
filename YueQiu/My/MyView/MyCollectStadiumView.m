//
//  MyCollectStadiumView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import "MyCollectStadiumView.h"
#import "CourseAndStadiumCell.h"

@implementation MyCollectStadiumView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.stadiumArray = [NSArray arrayWithObjects:@"韦曲球馆", @"万科球馆", @"GOGO球馆", nil];
    self.stadiumPlaceArray = [NSArray arrayWithObjects:@"韦曲南街", @"万科广场", @"GOGO商场", nil];
    
    self.stadiumTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
    self.stadiumTableView.dataSource = self;
    self.stadiumTableView.delegate = self;
    [self.stadiumTableView registerClass:[CourseAndStadiumCell class] forCellReuseIdentifier:@"stadium"];
    [self addSubview:self.stadiumTableView];
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stadiumArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseAndStadiumCell* cell = [self.stadiumTableView dequeueReusableCellWithIdentifier:@"stadium"];
    cell.stadiumLabel.text = self.stadiumArray[indexPath.row];
    cell.stadiumPlaceLabel.text = self.stadiumPlaceArray[indexPath.row];
    [cell.buttonGPS addTarget:self action:@selector(touchGPS) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


- (void)touchGPS {
    
}
@end
