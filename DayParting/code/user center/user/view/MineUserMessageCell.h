//
//  MineUserMessageCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MineUserMessageItem.h"

@interface MineUserMessageCell : BaseCell

@property (nonatomic,strong) UIImageView *messageBackImageView;
@property (nonatomic,strong) UIButton *headerButton;
@property (nonatomic,strong) UIButton *nameButton;
@property (nonatomic,strong) UIButton *scoreButton;

@property (nonatomic,strong) UIImageView *lowGradeImageView;
@property (nonatomic,strong) UIProgressView *gradeProgressView;
@property (nonatomic,strong) UIImageView *highGradeImageView;

@property (nonatomic,strong) UILabel *lowGradeLabel;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UILabel *highGradeLabel;

@property (nonatomic,strong) UIImageView *messageRadianImageView;

@property (nonatomic,strong,readwrite) MineUserMessageItem *item;

@end
