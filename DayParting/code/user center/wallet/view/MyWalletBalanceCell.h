//
//  MyWalletBalanceCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletBalanceItem.h"

@interface MyWalletBalanceCell : BaseCell

@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UILabel *balanceLabel;
@property (nonatomic,strong) UIButton *rechargeButton;

@property (nonatomic,strong,readwrite) MyWalletBalanceItem *item;

@end
