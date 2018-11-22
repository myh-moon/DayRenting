//
//  MainUpCarDetailCostCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MainUpCarDetailCostItem.h"

@interface MainUpCarDetailCostCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *costButton;

@property (nonatomic,strong,readwrite) MainUpCarDetailCostItem *item;

@end
