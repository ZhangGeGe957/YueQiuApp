//
//  HomePageTableViewCell.h
//  YueQiu
//
//  Created by haoqianbiao on 2022/1/8.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePageTableViewCell : UITableViewCell

@property(nonatomic, strong) NSMutableArray* locationArray;

@property(nonatomic, strong) MAMapView *mapView;

@property(nonatomic, strong) UIButton *button;
@property(nonatomic, strong) UILabel *placeLabel;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *priceLabel;
@property(nonatomic, strong) UILabel *distanceLabel;
@property(nonatomic, strong) UILabel *typeLabel;
@property(nonatomic, strong) UIButton *scheduleButton;
@end
NS_ASSUME_NONNULL_END
