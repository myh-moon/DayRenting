//
//  ChooseTicketNoCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ChooseTicketNoItem.h"

@interface ChooseTicketNoCell : BaseCell

@property (nonatomic,strong) UILabel *noLabel;
@property (nonatomic,strong) UIButton *selectButton;

@property (nonatomic,strong,readwrite) ChooseTicketNoItem *item;

@end
