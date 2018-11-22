//
//  LogOutCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "LogOutItem.h"

@interface LogOutCell : BaseCell

@property (nonatomic,strong) UILabel *logoutLabel;

@property (nonatomic,strong) UIImageView *testImageView;

@property (nonatomic,strong,readwrite) LogOutItem *item;

@end
