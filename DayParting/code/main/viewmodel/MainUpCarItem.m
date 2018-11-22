//
//  MainUpCarItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarItem.h"

@implementation MainUpCarItem

- (instancetype)initWithCarModel:(CarListModel *)model {
    
    self = [super init];
    if (self) {
        self.img = [NSString stringWithFormat:@"%@%@",DPBaseUrl,model.img];
        self.car_code = [NSString stringWithFormat:@"%@  ",model.car_code];
        self.car_name = model.car_name;
        self.oilmass = [NSString stringWithFormat:@"  油量%@  ",model.oilmass];
        self.color = [NSString stringWithFormat:@"  %@  ",model.color];
        self.sites = [NSString stringWithFormat:@"  %@座  ",model.sites];
    }
    return self;
}

@end
