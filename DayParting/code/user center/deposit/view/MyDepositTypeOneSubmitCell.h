//
//  MyDepositTypeOneSubmitCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositTypeOneSubmitItem.h"

@interface MyDepositTypeOneSubmitCell : BaseCell

@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UIButton *submitButton;


@property (nonatomic,strong,readwrite) MyDepositTypeOneSubmitItem *item;

@end
