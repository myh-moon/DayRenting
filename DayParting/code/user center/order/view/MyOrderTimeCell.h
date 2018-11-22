//
//  MyOrderTimeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/3.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderTimeItem.h"

@interface MyOrderTimeCell : BaseCell

@property (nonatomic,strong) UILabel *statusLabel;
@property (nonatomic,strong,readwrite) MyOrderTimeItem *item;

@end
