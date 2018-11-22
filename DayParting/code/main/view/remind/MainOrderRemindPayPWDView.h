//
//  MainOrderRemindPayPWDView.h
//  DayParting
//
//  Created by jiamanu on 2018/9/27.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"
#import "LYSecurityField.h"

@interface MainOrderRemindPayPWDView : BasePopView<LYPaymentFieldDelegate>

@property (nonatomic,strong) UIButton *closeButton;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong) LYSecurityField *pwdTextField;


@property (nonatomic,strong) UIButton *forgetPwdButton;

@property (nonatomic,strong) void (^didEditting)(NSString *text);

@end
