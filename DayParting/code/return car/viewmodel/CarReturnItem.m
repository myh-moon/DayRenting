//
//  CarReturnItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarReturnItem.h"

@implementation CarReturnItem

- (instancetype)initWithCarReturnModel:(CarReturnModel *)returnModel {
    self = [super init];
    if (self) {
        self.service = [NSString stringWithFormat:@"%@  ·  服务点\n",returnModel.name];
        self.address =returnModel.address;
        self.distance = [NSString stringWithFormat:@"%@m  ",returnModel.range];
    }
    return self;
}

@end
