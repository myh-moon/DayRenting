//
//  AboutCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "AboutItem.h"

@interface AboutCell : BaseCell

@property (nonatomic,strong) UIImageView *appImageView;
@property (nonatomic,strong) UILabel *appNameLabel;
@property (nonatomic,strong) UILabel *appVersionLabel;
@property (nonatomic,strong) UILabel *appRemindLabel;
@property (nonatomic,strong) UILabel *appCopyrightLabel;
@property (nonatomic,strong) UIButton *appCheckButton;

@property (nonatomic,strong,readwrite) AboutItem *item;

@end
