//
//  OrderGenerateCostTotalCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "OrderGenerateCostTotalItem.h"

@interface OrderGenerateCostTotalCell : BaseCell

@property (nonatomic,strong) UILabel *totalLabel;

@property (nonatomic,strong,readwrite) OrderGenerateCostTotalItem *item;

@end
