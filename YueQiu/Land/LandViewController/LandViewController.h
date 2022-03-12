//
//  LandViewController.h
//  YueQiu
//
//  Created by 张佳乔 on 2022/1/18.
//

#import <UIKit/UIKit.h>
#import "LandView.h"
#import "UUIDStrengthen.h"

extern NSString *const identityAuthentication;

NS_ASSUME_NONNULL_BEGIN

@interface LandViewController : UIViewController

@property (nonatomic, strong) UIImageView *startUpImageView;
@property (nonatomic, strong) NSTimer *startShowImageViewTimer;
@property (nonatomic, strong) LandView *landView;
@property (nonatomic, strong) NSString *identificationString;  //设备的唯一标识

@end

NS_ASSUME_NONNULL_END
