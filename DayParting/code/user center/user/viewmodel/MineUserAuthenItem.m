//
//  MineUserAuthenItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserAuthenItem.h"

@implementation MineUserAuthenItem

- (instancetype)initWithUserModel:(UserModel *)model {
    self = [super init];
    if (self) {
        self.authenStateString = model.is_realname ? @"  已认证" : @"  待认证";
        self.licenseStateString = model.is_driver ? @"  已认证" : @"  待认证";
    }
    return self;
}

@end
