//
//  MyScoreListItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"

#import "ScoreModel.h"

@interface MyScoreListItem : RETableViewItem

@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,copy) NSString *scoreString;
@property (nonatomic,copy) NSString *timeString;

- (instancetype) initWithScoreDetailModel:(ScoreModel *)model;

@end
