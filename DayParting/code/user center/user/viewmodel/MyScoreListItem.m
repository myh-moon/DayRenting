//
//  MyScoreListItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyScoreListItem.h"

@implementation MyScoreListItem

- (instancetype)initWithScoreDetailModel:(ScoreModel *)model {
    self = [super init];
    
    if (self) {
        
        self.titleString = [NSString stringWithFormat:@"%@\n",model.info];
        self.scoreString = model.score;
        self.timeString = [NSDate getYMDhmFormatterTime:model.addtime];

    }
    return self;
}

@end
