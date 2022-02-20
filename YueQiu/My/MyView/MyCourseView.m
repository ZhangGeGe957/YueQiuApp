//
//  MyCourseView.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/2/20.
//

#import "MyCourseView.h"
#import "CourseAndStadiumCell.h"
@implementation MyCourseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.courseArray = [NSArray arrayWithObjects:@"篮球基础训练", @"足球基础训练", @"乒乓球基础训练", nil];
    
    self.courseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
    self.courseTableView.dataSource = self;
    self.courseTableView.delegate = self;
    [self.courseTableView registerClass:[CourseAndStadiumCell class] forCellReuseIdentifier:@"course"];
    [self addSubview:self.courseTableView];
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courseArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseAndStadiumCell* cell = [self.courseTableView dequeueReusableCellWithIdentifier:@"course"];
    cell.courseLabel.text = self.courseArray[indexPath.row];
    cell.progressView.progress = 0.5;
    
    return cell;
}
@end
