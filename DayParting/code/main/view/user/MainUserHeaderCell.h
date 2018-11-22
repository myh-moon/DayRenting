//
//  MainUserHeaderCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MainUserHeaderItem.h"

@interface MainUserHeaderCell : BaseCell

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *vipButton;
@property (nonatomic,strong) UIButton *gradeButton;
@property (nonatomic,strong) UIButton *actButton;

@property (nonatomic,strong,readwrite) MainUserHeaderItem *item;

@end
