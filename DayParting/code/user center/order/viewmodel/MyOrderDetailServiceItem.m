//
//  MyOrderDetailServiceItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailServiceItem.h"

@implementation MyOrderDetailServiceItem

- (instancetype)initWithOrderModel:(MyOrderModel *)model {
    self = [super init];
    if (self) {
        self.qcaddress = [NSString stringWithFormat:@"%@·服务点",model.qcaddress];
        self.qctime = [NSDate getMDhmFormatterTime:model.qctime];
        
        self.hcaddress = [NSString stringWithFormat:@"%@·服务点",model.hcnet];
        self.hctime = [NSDate getMDhmFormatterTime:model.hctime];
    }
    return self;
}

@end
