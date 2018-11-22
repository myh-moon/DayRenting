//
//  OrderGenerateCostCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "OrderGenerateCostItem.h"

@interface OrderGenerateCostCell : BaseCell

@property (nonatomic,strong) UILabel *blueLabel;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *noteButton;

@property (nonatomic,strong,readwrite) OrderGenerateCostItem *item;

@end
