//
//  MineUserAuthenCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MineUserAuthenItem.h"

@interface MineUserAuthenCell : BaseCell

@property (nonatomic,strong) UIView *backWhiteView;

@property (nonatomic,strong) UIButton *authenTitleButton;
@property (nonatomic,strong) UIButton *authenStateButton;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) UIButton *licenseTitleButton;
@property (nonatomic,strong) UIButton *licenseStateButton;

@property (nonatomic,strong,readwrite) MineUserAuthenItem *item;

@end
