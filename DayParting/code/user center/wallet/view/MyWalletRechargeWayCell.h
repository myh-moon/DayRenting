//
//  MyWalletRechargeWayCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletRechargeWayItem.h"

@interface MyWalletRechargeWayCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *wayButton;
@property (nonatomic,strong) UIImageView *wayImageView;

@property (nonatomic,strong,readwrite) MyWalletRechargeWayItem *item;

@end
