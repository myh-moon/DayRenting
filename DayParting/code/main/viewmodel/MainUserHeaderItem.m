//
//  MainUserHeaderItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUserHeaderItem.h"

@implementation MainUserHeaderItem

- (instancetype)initWithIUserModel:(UserModel *)model {
    self = [super init];
    
    if (self) {
        self.userImageString = model.toppic;
        self.userNameString = model.name;
//        self.userLevelString = @"普卡会员";
        NSInteger scores = [model.socre integerValue];
        if (scores < 300) {//普卡会员
            self.userLevelString = @"普卡会员";
        }else if (scores < 900){
            self.userLevelString = @"白银会员";
        }else if (scores < 1800){
            self.userLevelString = @"黄金会员";
        }else if(scores < 3000){
            self.userLevelString = @"铂金会员";
        }else if(scores < 4500){
            self.userLevelString = @"钻石会员";
        }else{
            self.userLevelString = @"皇冠会员";
        }
    }
    
    return self;
}

@end
