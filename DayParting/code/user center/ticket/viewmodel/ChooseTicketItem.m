//
//  ChooseTicketItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "ChooseTicketItem.h"

@implementation ChooseTicketItem

- (instancetype)initWithTicketModel:(TicketModel *)model {
    self = [super init];
    if (self) {
        self.moneyString = [NSString stringWithFormat:@" %@",model.money];
        self.remindString = [NSString stringWithFormat:@"满%@元可用",model.norm];
        
        self.resourceString = @"实名认证激励券";
        self.durationString = [NSString stringWithFormat:@"有效期至 %@",[NSDate getYMDhmFormatterTime:model.etime]];
        
    }
    return self;
}

@end
