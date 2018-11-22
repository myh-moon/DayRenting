//
//  MineUserMessageItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserMessageItem.h"

@implementation MineUserMessageItem

- (instancetype)initWithUserModel:(UserModel *)model {
    self = [super init];
    if (self) {
        self.userImgString = model.toppic;
        self.userNameString = model.name;
        self.scoreString = model.socre;
//        [NSString stringWithFormat:@"  积分%@  ",model.socre];
    }
    return self;
}

@end
