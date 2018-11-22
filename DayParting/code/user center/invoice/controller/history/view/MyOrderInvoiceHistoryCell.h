//
//  MyOrderInvoiceHistoryCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderInvoiceHistoryItem.h"

@interface MyOrderInvoiceHistoryCell : BaseCell

@property (nonatomic,strong) UIView *backWhiteView;
@property (nonatomic,strong) UIButton *timeButton;
@property (nonatomic,strong) UIButton *statusButton;
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong,readwrite) MyOrderInvoiceHistoryItem *item;

@end
