//
//  MyWalletRechargeResultCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/17.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletRechargeResultItem.h"

@interface MyWalletRechargeResultCell : BaseCell

@property (nonatomic,strong) UIImageView *remindImageView;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *remindButton;

@property (nonatomic,strong,readwrite) MyWalletRechargeResultItem *item;

@end
