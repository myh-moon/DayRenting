//
//  MyOrderInvoiceDetailCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/30.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderInvoiceDetailItem.h"

@interface MyOrderInvoiceDetailCell : BaseCell

@property (nonatomic,strong) UIButton *chooseButton;

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong) UILabel *startPointLabel;
@property (nonatomic,strong) UILabel *startTimeLabel;
@property (nonatomic,strong) UILabel *startAddressLabel;

@property (nonatomic,strong) UILabel *dotLabel;

@property (nonatomic,strong) UILabel *endPointLabel;
@property (nonatomic,strong) UILabel *endTimeLabel;
@property (nonatomic,strong) UILabel *endAddressLabel;

@property (nonatomic,strong,readwrite) MyOrderInvoiceDetailItem *item;

@end
