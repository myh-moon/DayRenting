//
//  MineUserCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MineUserItem.h"

@interface MineUserCell : BaseCell

@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UILabel *scoreLabel;
@property (nonatomic,strong) UIImageView *rightImageView;

@property (nonatomic,strong,readwrite) MineUserItem *item;

@end
