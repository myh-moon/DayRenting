//
//  MainUpCarDetailCostItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarDetailCostItem.h"

@implementation MainUpCarDetailCostItem

- (instancetype)initWithCarDetailModel:(CarListModel *)carModel {
    self = [super init];
    
    if (self) {
        self.tsmoney = carModel.tsmoney;
        self.smoney = carModel.smoney;
    }
    return self;
}

@end
