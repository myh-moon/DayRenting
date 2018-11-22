//
//  InvoiceGenerateEditCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "InvoiceGenerateEditItem.h"

@interface InvoiceGenerateEditCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *editTextField;

@property (nonatomic,strong,readwrite) InvoiceGenerateEditItem *item;

@end
