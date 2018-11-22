//
//  ChooseTicketItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "TicketModel.h"

@interface ChooseTicketItem : BaseItem

@property (nonatomic,copy) NSString *moneyString;
@property (nonatomic,copy) NSString *remindString;
@property (nonatomic,copy) NSString *resourceString;
@property (nonatomic,copy) NSString *durationString;

@property (nonatomic,assign) BOOL selected;

- (instancetype) initWithTicketModel:(TicketModel *)model;

@end
