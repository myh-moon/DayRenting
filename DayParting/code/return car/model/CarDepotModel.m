//
//  CarDepotModel.m
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarDepotModel.h"
#import "CarReturnModel.h"

@implementation CarDepotModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"depot" : @"CarReturnModel"
             };
}

@end
