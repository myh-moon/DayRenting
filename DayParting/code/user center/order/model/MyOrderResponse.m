//
//  MyOrderResponse.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderResponse.h"
#import "MyOrderModel.h"

@implementation MyOrderResponse

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"nofinish" : @"MyOrderModel",
             @"b" : @"MyOrderModel",
             @"c" : @"MyOrderModel"
              };
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"nofinish" : @"list.nofinish",
             @"b" : @"list.b",
             @"c" : @"list.c"
             };
}
@end
