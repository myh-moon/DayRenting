//
//  MyOrderInvoiceDetailHeaderCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/3.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderInvoiceDetailHeaderItem.h"

@interface MyOrderInvoiceDetailHeaderCell : BaseCell

@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong,readwrite) MyOrderInvoiceDetailHeaderItem *item;

@end
