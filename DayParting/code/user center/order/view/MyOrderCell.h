//
//  MyOrderCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderItem.h"

@interface MyOrderCell : BaseCell

@property (nonatomic,strong) UIView *backWhiteLabel;

@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UILabel *startPointLabel;
@property (nonatomic,strong) UILabel *startTimeLabel;
@property (nonatomic,strong) UILabel *startAddressLabel;

@property (nonatomic,strong) UILabel *dotLabel;

@property (nonatomic,strong) UILabel *endPointLabel;
@property (nonatomic,strong) UILabel *endTimeLabel;
@property (nonatomic,strong) UILabel *endAddressLabel;


@property (nonatomic,strong) UILabel *lineLabel;

@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong) UIButton *actButton;

@property (nonatomic,strong,readwrite) MyOrderItem *item;

@end
