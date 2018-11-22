//
//  InvoiceGenerateChooseCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "InvoiceGenerateChooseItem.h"

@interface InvoiceGenerateChooseCell : BaseCell

@property (nonatomic,strong) UIButton *electronicInvoiceButton;
@property (nonatomic,strong) UIButton *paperInvoiceButton;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong,readwrite) InvoiceGenerateChooseItem *item;

@end
