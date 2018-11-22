//
//  MyBreakItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyBreakItem.h"

@implementation MyBreakItem

- (instancetype)initWithModel:(MyBreakModel *)model {
    self = [super init];
    if (self) {
        self.numberString = [NSString stringWithFormat:@"决定书编号：%@",model.oid];
        self.reasonString = model.wzcontent;
        self.timeString = [NSDate getYMDhmsFormatterTime:model.wztime];
        self.addressString = model.wzaddr;
        self.result1String = [NSString stringWithFormat: @"罚%@元",model.wzfj];
        
        if ([model.wzkf isEqualToString:@"0"]) {
            self.result2String = @"不扣分";
        }else{
            self.result2String = [NSString stringWithFormat:@"扣%@分",model.wzkf];
        }
        
        if ([model.is_sms isEqualToString:@"0"]) {
            self.statusString = @"立即处理";
        }else{
            self.statusString = @"正处理中";
        }
    }
    return self;
}

@end
