//
//  MyOrderItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderItem.h"

@implementation MyOrderItem

- (instancetype)initWithOrderModel:(MyOrderModel *)model {
    self = [super init];
    
    if (self) {
        self.number = model.number;
        self.car_name = model.car_name;
        self.qctime = [NSDate getMDhmFormatterTime:model.qctime];
        self.qcaddress = [NSString stringWithFormat:@"%@·服务点",model.qcaddress];
        self.hctime = [NSDate getMDhmFormatterTime:model.hctime];
        self.hcaddress = [NSString stringWithFormat:@"%@·服务点",model.hcdot];
        self.money = model.money;
        self.smoney = model.smoney;
        self.status = model.status;
    }
    
    return self;
}

@end
