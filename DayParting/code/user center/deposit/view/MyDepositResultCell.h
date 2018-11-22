//
//  MyDepositResultCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositResultItem.h"

@interface MyDepositResultCell : BaseCell

@property (nonatomic,strong) UIImageView *resultImageView;
@property (nonatomic,strong) UILabel *resultLabel;

@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *finishButton;

@property (nonatomic,strong,readwrite) MyDepositResultItem *item;


@end
