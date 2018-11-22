//
//  MyOrderInvoiceHistoryDetailCheckItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceHistoryDetailCheckItem.h"

@implementation MyOrderInvoiceHistoryDetailCheckItem

- (instancetype)initWithHistoryModel:(MyHistoryModel *)model andTag:(NSString *)tag{
    self = [super init];
    
    if (self) {
        if ([tag isEqualToString:@"1"]) {
            if ([model.type isEqualToString:@"1"]) {
                self.titleString = @"纸质发票已开票\n";
            }else{
                self.titleString = @"电子发票已开票\n";
            }
        }else{
            NSArray  *array = [model.oids componentsSeparatedByString:@","];
            self.titleString = [NSString stringWithFormat:@"1张发票，含%lu个行程\n",(unsigned long)array.count];
        }
        
        self.timeString = [NSDate getYMDhmFormatterTime:model.addtime];
    }
    return self;
}

@end
