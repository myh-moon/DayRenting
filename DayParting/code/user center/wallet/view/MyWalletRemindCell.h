//
//  MyWalletRemindCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletRemindItem.h"

@interface MyWalletRemindCell : BaseCell

@property (nonatomic,strong) UIButton *remindButton;
@property (nonatomic,strong,readwrite) MyWalletRemindItem *item;

@end
