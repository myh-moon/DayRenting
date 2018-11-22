//
//  OrderGenerateTimeView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderGenerateTimeView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *remindButton;
@property (nonatomic,strong) UIView *whiteBackView;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *okButton;
@property (nonatomic,strong) UIDatePicker *generateDatePicker;

@property (nonatomic,strong) void (^didSelectedBtn)(NSString *idd);

@property (nonatomic,strong) void (^didChooseDate)(NSString *date);

@end
