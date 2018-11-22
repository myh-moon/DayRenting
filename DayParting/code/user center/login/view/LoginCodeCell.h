//
//  LoginCodeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "LoginCodeItem.h"

@interface LoginCodeCell : BaseCell<UITextFieldDelegate>

@property (nonatomic,strong) UILabel *phoneLabel;

@property (nonatomic,strong) UITextField *codeTextField1;
@property (nonatomic,strong) UITextField *codeTextField2;
@property (nonatomic,strong) UITextField *codeTextField3;
@property (nonatomic,strong) UITextField *codeTextField4;
@property (nonatomic,strong) UITextField *codeTextField5;
@property (nonatomic,strong) UITextField *codeTextField6;

@property (nonatomic,strong) UIImageView *warningImageView;
@property (nonatomic,strong) UILabel *warningLabel;


@property (nonatomic,strong) UIButton *getCodeButton;

@property (nonatomic,strong,readwrite) LoginCodeItem *item;

@end
