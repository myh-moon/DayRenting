//
//  MyTicketItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/18.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "TicketModel.h"

@interface MyTicketItem : RETableViewItem

@property (nonatomic,copy) NSString *moneyString;
@property (nonatomic,copy) NSString *remindString;
@property (nonatomic,copy) NSString *resourceString;
@property (nonatomic,copy) NSString *durationString;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *condition;

- (instancetype) initWithTicketModel:(TicketModel *)model;

@end
