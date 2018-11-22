//
//  InvoiceGenerateBaseCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "InvoiceGenerateBaseItem.h"

@interface InvoiceGenerateBaseCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong,readwrite) InvoiceGenerateBaseItem *item;

@end
