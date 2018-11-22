//
//  MyOrderInvoiceCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderInvoiceItem.h"

@interface MyOrderInvoiceCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *actImageView;

@property (nonatomic,strong,readwrite) MyOrderInvoiceItem *item;

@end
