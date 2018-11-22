//
//  BankListCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "BankListItem.h"

@interface BankListCell : BaseCell

@property (nonatomic,strong) UIButton *bankButton;
@property (nonatomic,strong) UIButton *selectButton;

@property (nonatomic,strong,readwrite) BankListItem *item;

@end
