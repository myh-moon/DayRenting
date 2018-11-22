//
//  MyDepositTypeOnePayCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositTypeOnePayItem.h"

@interface MyDepositTypeOnePayCell : BaseCell

@property (nonatomic,strong) UILabel *payLabel;
@property (nonatomic,strong) UIButton *wePayButton;
@property (nonatomic,strong) UIButton *wePaySelecteButton;

@property (nonatomic,strong,readwrite) MyDepositTypeOnePayItem *item;

@end
