//
//  AuthentyProcessSecondCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "AuthentyProcessSecondItem.h"

@interface AuthentyProcessSecondCell : BaseCell

@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *faceButton;
@property (nonatomic,strong) UILabel *waitingLabel;
@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong,readwrite) AuthentyProcessSecondItem *item;

@end
