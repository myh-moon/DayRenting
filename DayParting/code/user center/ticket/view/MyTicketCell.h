//
//  MyTicketCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/18.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyTicketItem.h"

@interface MyTicketCell : BaseCell

@property (nonatomic,strong) UIImageView *ticketBackView;

@property (nonatomic,strong) UIButton *moneyButton;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong) UILabel *resourceLabel;
@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) UILabel *typeLabel;

@property (nonatomic,strong,readwrite) MyTicketItem *item;

@end
