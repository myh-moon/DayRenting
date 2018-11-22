//
//  ResetSecondCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/11.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ResetSecondItem.h"
#import "LYSecurityField.h"

@interface ResetSecondCell : BaseCell<LYPaymentFieldDelegate>

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *showButton;
@property (nonatomic,strong) LYSecurityField *pwdTextField;

@property (nonatomic,strong,readwrite) ResetSecondItem *item;

@end
