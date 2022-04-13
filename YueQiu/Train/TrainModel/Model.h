//
//  Model.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/4/13.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface Baike_info : JSONModel
@property (nonatomic, strong) NSString *baike_url;
@end
@interface Result : JSONModel
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *root;
@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) NSMutableArray<Baike_info*>* baike_info;
@end
@interface Model : JSONModel
@property (nonatomic, strong) NSString *log_id;
@property NSInteger result_num;
@property (nonatomic, strong) NSMutableArray<Result *>* result;
@end

NS_ASSUME_NONNULL_END
