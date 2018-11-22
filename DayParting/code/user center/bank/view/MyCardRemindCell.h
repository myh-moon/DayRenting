//
//  MyCardRemindCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyCardRemindItem.h"

@interface MyCardRemindCell : BaseCell

@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong,readwrite) MyCardRemindItem *item;

@end
