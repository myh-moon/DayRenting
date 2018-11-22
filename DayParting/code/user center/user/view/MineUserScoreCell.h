//
//  MineUserScoreCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MineUserScoreItem.h"

@interface MineUserScoreCell : BaseCell

@property (nonatomic,strong) UIImageView *scoreBackImageView;

@property (nonatomic,strong) UIButton *scoreTitleButton;
@property (nonatomic,strong) UIButton *scoreButton;

@property (nonatomic,strong,readwrite) MineUserScoreItem *item;

@end
