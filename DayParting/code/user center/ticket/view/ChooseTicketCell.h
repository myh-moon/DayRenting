//
//  ChooseTicketCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ChooseTicketItem.h"

@interface ChooseTicketCell : BaseCell

@property (nonatomic,strong) UIImageView *ticketBackView;

@property (nonatomic,strong) UIButton *moneyButton;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong) UILabel *resourceLabel;
@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) UIButton *selectedButton;

@property (nonatomic,strong,readwrite) ChooseTicketItem *item;

@end
