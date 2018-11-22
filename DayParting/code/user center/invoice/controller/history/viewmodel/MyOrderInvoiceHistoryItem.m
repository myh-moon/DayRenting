//
//  MyOrderInvoiceHistoryItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceHistoryItem.h"

@implementation MyOrderInvoiceHistoryItem

- (instancetype)initWithHistoryModel:(MyHistoryModel *)model {
    self = [super init];
    
    if (self) {
        self.time = [NSString stringWithFormat:@"  %@",[NSDate getYMDhmFormatterTime:model.addtime]];
//        self.type = [NSString stringWithFormat:@"%@，已开票  ",model.type ? @"电子发票" : @"纸质发票"];
        self.pcontent = model.pcontent;
        self.money = model.money;
        
        if ([model.type isEqualToString:@"0"]) {
            self.type = @"电子发票，已开票  ";
//            [NSString stringWithFormat:@"电子发票，已开票  ",]
        }else{
            self.type = @"纸质发票，已开票  ";
//            [NSString stringWithFormat:@"纸质发票，已开票  ",]
        }
    }
    return self;
}

@end
