//
//  OrderGenerateTextItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateTextItem.h"

@implementation OrderGenerateTextItem

- (instancetype)initWithCarDetailModel:(CarListModel *)carModel {
    self = [super init];
    
    if (self) {
        self.car_code = [NSString stringWithFormat:@"%@  ",carModel.car_code];
        self.car_name = carModel.car_name;
        self.img = [NSString stringWithFormat:@"%@%@",DPBaseUrl,carModel.img];
        
        //油量
        self.oil = [NSString stringWithFormat:@"  油量%@  ",carModel.oilmass];
        self.color = [NSString stringWithFormat:@"  %@  ",carModel.color];
        self.sites = [NSString stringWithFormat:@"  %@座  ",carModel.sites];
        
        //自动挡
        self.autos = @"  自动挡  ";
    }
    return self;
}




@end
