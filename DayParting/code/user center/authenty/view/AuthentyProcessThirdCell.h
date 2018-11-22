//
//  AuthentyProcessThirdCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "AuthentyProcessThirdItem.h"

@interface AuthentyProcessThirdCell : BaseCell

@property (nonatomic,strong) UIImageView *remindImageView;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UILabel *waitingLabel;
@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong,readwrite) AuthentyProcessThirdItem *item;

@end
