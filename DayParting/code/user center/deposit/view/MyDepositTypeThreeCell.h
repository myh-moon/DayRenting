//
//  MyDepositTypeThreeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositTypeThreeItem.h"

@interface MyDepositTypeThreeCell : BaseCell

@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UIButton *powerButton;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong,readwrite) MyDepositTypeThreeItem *item;

@end
