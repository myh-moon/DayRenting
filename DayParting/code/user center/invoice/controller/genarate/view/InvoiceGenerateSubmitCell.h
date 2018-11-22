//
//  InvoiceGenerateSubmitCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "InvoiceGenerateSubmitItem.h"

@interface InvoiceGenerateSubmitCell : BaseCell

@property (nonatomic,strong) UIButton *submitButton;
@property (nonatomic,strong,readwrite) InvoiceGenerateSubmitItem *item;

@end
