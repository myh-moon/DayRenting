//
//  UserModel.m
//  DayParting
//
//  Created by jiamanu on 2018/9/10.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"ticketlist" : @"ScoreModel"
             };
}

@end
