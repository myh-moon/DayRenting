//
//  OrderGenerateCostCategoryCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "OrderGenerateCostCategoryItem.h"

@interface OrderGenerateCostCategoryCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *categoryButton;

@property (nonatomic,strong,readwrite) OrderGenerateCostCategoryItem *item;

@end
