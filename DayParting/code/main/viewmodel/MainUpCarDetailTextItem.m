//
//  MainUpCarDetailTextItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarDetailTextItem.h"

@implementation MainUpCarDetailTextItem

- (instancetype)initWithCarDetailModel:(CarListModel *)carModel {
    self = [super init];
    
    if (self) {
        self.car_code = [NSString stringWithFormat:@"%@\n",carModel.car_code];
        self.car_name = carModel.car_name;
        self.img = [NSString stringWithFormat:@"%@%@",DPBaseUrl,carModel.img];

        self.oilClass = [[carModel.oilmass substringToIndex:1] integerValue];
        
        //油量
        self.oil = carModel.oilmass;
        self.color = [NSString stringWithFormat:@"  %@  ",carModel.color];
        self.sites = [NSString stringWithFormat:@"  %@个座位  ",carModel.sites];
        
        //自动挡
        self.autos = @"  自动挡  ";
    }
    return self;
}

@end
