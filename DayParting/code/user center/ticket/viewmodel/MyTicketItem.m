//
//  MyTicketItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/18.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyTicketItem.h"

@implementation MyTicketItem

- (instancetype)initWithTicketModel:(TicketModel *)model {
    self = [super init];
    if (self) {
        
        NSString *nnnn = [model.money substringToIndex:model.money.length-3];
        self.moneyString = [NSString stringWithFormat:@" %@",nnnn];
        
        self.remindString = @"满0元可用";
        
        self.resourceString = @"实名认证激励券";
        self.durationString = [NSString stringWithFormat:@"有效期至 %@",[NSDate getYMDhmFormatterTime:model.etime]];
        
        self.type = model.status;
        self.condition = model.condition;
    }
    return self;
}

@end
