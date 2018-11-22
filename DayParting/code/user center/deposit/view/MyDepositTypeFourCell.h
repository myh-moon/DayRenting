//
//  MyDepositTypeFourCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositTypeFourItem.h"

@interface MyDepositTypeFourCell : BaseCell

@property (nonatomic,strong) UIButton *powerButton;
@property (nonatomic,strong) UIButton *useCarButton;

@property (nonatomic,strong,readwrite) MyDepositTypeFourItem *item;

@end
