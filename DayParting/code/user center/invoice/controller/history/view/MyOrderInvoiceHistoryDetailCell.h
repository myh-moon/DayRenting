//
//  MyOrderInvoiceHistoryDetailCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderInvoiceHistoryDetailItem.h"

@interface MyOrderInvoiceHistoryDetailCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;


@property (nonatomic,strong,readwrite) MyOrderInvoiceHistoryDetailItem *item;

@end
