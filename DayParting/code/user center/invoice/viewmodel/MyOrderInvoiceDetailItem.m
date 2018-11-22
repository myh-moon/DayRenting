//
//  MyOrderInvoiceDetailItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/30.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceDetailItem.h"

@implementation MyOrderInvoiceDetailItem

- (instancetype)initWithOrderModel:(MyOrderModel *)model {
    self = [super init];
    
    if (self) {
        
        self.selectedInvoice = model.selected;
        
        self.nameString = [NSString stringWithFormat:@"%@  %@",model.number,model.car_name];
        self.moneyString = model.smoney;
        self.qctimeString = [NSDate getMDhmFormatterTime:model.jtime];
        self.qcnetString = [NSString stringWithFormat:@"%@·服务点",model.qcaddress];
        self.hctimeString = [NSDate getMDhmFormatterTime:model.hctime];
        self.hcnetString = [NSString stringWithFormat:@"%@·服务点",model.hcnet];
        
    }
    return self;
}

@end
