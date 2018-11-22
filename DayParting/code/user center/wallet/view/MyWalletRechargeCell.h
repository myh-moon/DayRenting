//
//  MyWalletRechargeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletRechargeItem.h"

@interface MyWalletRechargeCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
//@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UITextField *moneyTextField;

@property (nonatomic,strong,readwrite) MyWalletRechargeItem *item;

@end
