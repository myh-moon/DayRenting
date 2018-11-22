//
//  ResetThirdCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/12.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ResetThirdItem.h"
#import "LYSecurityField.h"

@interface ResetThirdCell : BaseCell<LYPaymentFieldDelegate>

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *remindLabel;
//@property (nonatomic,strong) UIButton *showButton;
@property (nonatomic,strong) LYSecurityField *pwdTextField;

@property (nonatomic,strong,readwrite) ResetThirdItem *item;



@end
