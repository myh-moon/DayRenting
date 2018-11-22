//
//  MainUpCarDetailOrderCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MainUpCarDetailOrderItem.h"

@interface MainUpCarDetailOrderCell : BaseCell

@property (nonatomic,strong) UIButton *orderButton;

@property (nonatomic,strong,readwrite) MainUpCarDetailOrderItem *item;

@end
