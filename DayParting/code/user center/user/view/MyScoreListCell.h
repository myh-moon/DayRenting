//
//  MyScoreListCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyScoreListItem.h"

@interface MyScoreListCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *scoreLabel;

@property (nonatomic,strong,readwrite) MyScoreListItem *item;

@end
