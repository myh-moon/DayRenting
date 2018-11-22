//
//  LoginModel.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"phone" : @"userArr.phone",
             @"realname" : @"userArr.realname",
             @"idcard" : @"userArr.idcard"
             };
}

@end
