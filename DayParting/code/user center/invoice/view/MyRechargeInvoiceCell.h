//
//  MyRechargeInvoiceCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyRechargeInvoiceItem.h"

@interface MyRechargeInvoiceCell : BaseCell

@property (nonatomic,strong) UIButton *signButton;  //选中 或 不选中
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong,readwrite) MyRechargeInvoiceItem *item;

@end
