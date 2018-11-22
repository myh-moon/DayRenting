//
//  MainUserTypeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MainUserTypeItem.h"

@interface MainUserTypeCell : BaseCell

@property (nonatomic,strong) UIButton *typeButton;

@property (nonatomic,strong,readwrite) MainUserTypeItem *item;

@end
