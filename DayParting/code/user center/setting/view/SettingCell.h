//
//  SettingCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "SettingItem.h"

@interface SettingCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *actButton;

@property (nonatomic,strong,readwrite) SettingItem *item;

@end
