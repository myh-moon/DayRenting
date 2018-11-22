//
//  MyCardChooseCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyCardChooseItem.h"

@interface MyCardChooseCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *actImageView;

@property (nonatomic,strong,readwrite) MyCardChooseItem *item;

@end
