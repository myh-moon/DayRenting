//
//  MineUserScoreItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "ScoreModel.h"


@interface MineUserScoreItem : RETableViewItem

@property (nonatomic,copy) NSString *info;  //使用规则
@property (nonatomic,copy) NSString *money; //抵用券金额
@property (nonatomic,copy) NSString *score;  //所需积分

- (instancetype) initWithScoreModel:(ScoreModel *)model;

@end
