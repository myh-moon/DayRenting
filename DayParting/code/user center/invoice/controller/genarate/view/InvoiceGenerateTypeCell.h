//
//  InvoiceGenerateTypeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "InvoiceGenerateTypeItem.h"

@interface InvoiceGenerateTypeCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *enterpriseButton;
@property (nonatomic,strong) UIButton *personalButton;

@property (nonatomic,strong,readwrite) InvoiceGenerateTypeItem *item;

@end
