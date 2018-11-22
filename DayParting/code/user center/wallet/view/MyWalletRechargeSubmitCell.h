//
//  MyWalletRechargeSubmitCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletRechargeSubmitItem.h"

@interface MyWalletRechargeSubmitCell : BaseCell

@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong,readwrite) MyWalletRechargeSubmitItem *item;

@end
