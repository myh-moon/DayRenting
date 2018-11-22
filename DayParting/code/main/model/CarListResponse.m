//
//  CarListResponse.m
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarListResponse.h"
#import "CarListModel.h"

@implementation CarListResponse

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"cardata" : @"CarListModel"
             };
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"cardata" : @"carlist.cardata",
             @"carnum" : @"carlist.carnum",
             @"dotAddrs" : @"carlist.dotAddrs",
             @"dotname" : @"carlist.dotname",
             @"positionsnum" : @"carlist.positionsnum",
             @"range" : @"carlist.range",
              @"lat" : @"carlist.lat",
              @"lng" : @"carlist.lng"
             };
}

@end
