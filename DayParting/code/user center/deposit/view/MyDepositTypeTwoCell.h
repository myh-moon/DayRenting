//
//  MyDepositTypeTwoCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositTypeTwoItem.h"

@interface MyDepositTypeTwoCell : BaseCell

@property (nonatomic,strong) UIButton *noPowerButton;

@property (nonatomic,strong,readwrite) MyDepositTypeTwoItem *item;

@end
