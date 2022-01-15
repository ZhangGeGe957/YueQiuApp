//
//  CourseDataModel.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseDataModel : NSObject

@property (nonatomic, strong) NSMutableArray *nameArray;  //课程名字
@property (nonatomic, strong) NSMutableArray *typeArray;  //课程类型
@property (nonatomic, strong) NSMutableArray *teacherArray;  //课程教练
@property (nonatomic, strong) NSMutableArray *timeArray;  //课程课时
@property (nonatomic, strong) NSMutableArray *photosArray;  //课程图片

- (void)addNewCourseData:(NSArray *)addArray;

@end

NS_ASSUME_NONNULL_END
