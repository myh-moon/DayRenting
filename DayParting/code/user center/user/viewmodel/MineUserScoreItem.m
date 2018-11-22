//
//  MineUserScoreItem.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserScoreItem.h"

@implementation MineUserScoreItem

- (instancetype)initWithScoreModel:(ScoreModel *)model {
    self  = [super init];
    if (self) {
        self.money = [NSString stringWithFormat:@"%@元租车抵用券\n",model.money];
        self.info = [NSString stringWithFormat:@"使用规则：订单实付金额需满%@元",model.norm];
        self.score = [NSString stringWithFormat:@"%@\n",model.score];
    }
    return self;
}

@end
