//
//  MyDepositTypeOneCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositTypeOneItem.h"

@interface MyDepositTypeOneCell : BaseCell

@property (nonatomic,strong) UIButton *typeButton;
@property (nonatomic,strong) UILabel *ssLabel;
@property (nonatomic,strong) UIButton *aaButton;


@property (nonatomic,strong,readwrite)MyDepositTypeOneItem *item;

@end
