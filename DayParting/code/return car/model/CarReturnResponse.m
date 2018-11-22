//
//  CarReturnResponse.m
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarReturnResponse.h"
#import "CarAreaModel.h"

@implementation CarReturnResponse

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"area" : @"depotinfo.area"
             };
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"area" : @"CarAreaModel"
             };
}

@end
