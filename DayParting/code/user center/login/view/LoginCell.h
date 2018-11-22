//
//  LoginCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/30.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "LoginItem.h"

@interface LoginCell : BaseCell

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *whiteBackView;

@property(nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *lineLabel1;

@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) UILabel *lineLabel2;

@property (nonatomic,strong) UIButton *agreeButton; //协议

@property (nonatomic,strong) UIButton *getCodeButton; //获取验证码

@property (nonatomic,strong,readwrite) LoginItem *item;

@end
