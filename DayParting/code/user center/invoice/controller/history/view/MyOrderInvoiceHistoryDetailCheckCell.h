//
//  MyOrderInvoiceHistoryDetailCheckCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderInvoiceHistoryDetailCheckItem.h"

@interface MyOrderInvoiceHistoryDetailCheckCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *checkButton;

@property (nonatomic,strong,readwrite) MyOrderInvoiceHistoryDetailCheckItem *item;


@end
