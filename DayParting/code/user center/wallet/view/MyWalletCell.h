//
//  MyWalletCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletItem.h"

@interface MyWalletCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *contentButton;

@property (nonatomic,strong,readwrite) MyWalletItem *item;

@end
