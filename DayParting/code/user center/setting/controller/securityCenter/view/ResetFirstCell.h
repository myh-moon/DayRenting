//
//  ResetFirstCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/11.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ResetFirstItem.h"
#import <JKCountDownButton/JKCountDownButton.h>
#import "LYSecurityField.h"

@interface ResetFirstCell : BaseCell<LYPaymentFieldDelegate>

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong) LYSecurityField *codeTextField;


//@property (nonatomic,strong) UITextField *codeTextField1;
//@property (nonatomic,strong) UITextField *codeTextField2;
//@property (nonatomic,strong) UITextField *codeTextField3;
//@property (nonatomic,strong) UITextField *codeTextField4;
//@property (nonatomic,strong) UITextField *codeTextField5;
//@property (nonatomic,strong) UITextField *codeTextField6;

@property (nonatomic,strong) JKCountDownButton *timeButton;

@property (nonatomic,strong,readwrite) ResetFirstItem *item;

@end
