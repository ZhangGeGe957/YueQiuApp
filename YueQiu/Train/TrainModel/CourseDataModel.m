//
//  CourseDataModel.m
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/15.
//

#import "CourseDataModel.h"

@implementation CourseDataModel

- (instancetype)init {
    if (self = [super init]) {
        self.nameArray = [[NSMutableArray alloc] init];
        self.typeArray = [[NSMutableArray alloc] init];
        self.teacherArray = [[NSMutableArray alloc] init];
        self.timeArray = [[NSMutableArray alloc] init];
        self.photosArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addNewCourseData:(NSArray *)addArray {
    if (addArray.count != 5) {
        NSLog(@"传递的数据有误！\n数据添加失败！\n");
    } else {
        [self.nameArray addObject:addArray[0]];
        [self.typeArray addObject:addArray[1]];
        [self.teacherArray addObject:addArray[2]];
        [self.timeArray addObject:addArray[3]];
        [self.photosArray addObject:addArray[4]];
        NSLog(@"数据添加成功！");
    }
}

@end
