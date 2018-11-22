//
//  MyOrderDetailTextItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailTextItem.h"

@implementation MyOrderDetailTextItem

- (instancetype)initWithOrderModel:(MyOrderModel *)model {
    self = [super init];
    if (self) {
        self.carImageString = [NSString stringWithFormat:@"%@%@",DPBaseUrl,model.img];
        self.carCodeString = [NSString stringWithFormat:@"%@  ",model.number];
        self.carNameString = model.carname;
        self.colorString = [NSString stringWithFormat:@"  %@  ",model.color];
        self.siteString = [NSString stringWithFormat:@"  %@座  ",model.sites];
        self.autoString = [NSString stringWithFormat:@"  %@  ",@"自动挡"];

    }
    return self;
}

@end
