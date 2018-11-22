//
//  MyCapitalItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCapitalItem.h"

@implementation MyCapitalItem

- (instancetype)initWithCapitalModel:(CapitalModel *)model {
    self = [super init];
    if (self) {
        
        NSArray *poppo = @[@"充值",@"提现",@"租车支付",@"系统充值",@"系统扣费",@"冻结",@"解冻",@"押金"];
        self.nameString = [NSString stringWithFormat:@"%@\n",poppo[[model.type integerValue] - 1]];
        self.timeString = [NSDate getYMDhmsFormatterTime:model.addtime];
        self.moneyString = [NSString stringWithFormat:@"%@\n",model.money];
//        self.statusString = model.status ? @"成功" : @"失败";
        if ([model.status isEqualToString:@"1"]) {
            self.statusString = @"成功";
        }else{
            self.statusString = @"失败";
        }
    }
    return self;
}

@end
