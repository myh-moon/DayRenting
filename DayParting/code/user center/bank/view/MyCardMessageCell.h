//
//  MyCardMessageCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyCardMessageItem.h"

@interface MyCardMessageCell : BaseCell

@property (nonatomic,strong) UIView *backView;

@property (nonatomic,strong) UIImageView *bankImageView;
@property (nonatomic,strong) UILabel *bankNameLabel;
@property (nonatomic,strong) UILabel *bankNumberLabel;

@property (nonatomic,strong,readwrite) MyCardMessageItem *item;

@end
