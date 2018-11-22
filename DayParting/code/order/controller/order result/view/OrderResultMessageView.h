//
//  OrderResultMessageView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderResultMessageView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIView *whiteBackView;

@property (nonatomic,strong) UILabel *blueLabel;
@property (nonatomic,strong) UILabel *serviceLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *oilLabel;
@property (nonatomic,strong) UILabel *colorLabel;
@property (nonatomic,strong) UILabel *siteLabel;

@property (nonatomic,strong) UIView *grayBackView;

@property (nonatomic,strong) UIButton *markButton;  //  选择按钮
@property (nonatomic,strong) UIButton *markTextButton;  //租车合同
@property (nonatomic,strong) UIButton *lightButton;

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@end
