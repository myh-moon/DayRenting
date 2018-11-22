//
//  InvoiceGenerateContentCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "InvoiceGenerateContentItem.h"

@interface InvoiceGenerateContentCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong,readwrite) InvoiceGenerateContentItem *item;

@end
