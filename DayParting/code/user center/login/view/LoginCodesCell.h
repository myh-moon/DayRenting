//
//  LoginCodesCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/2.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "LoginCodeItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginCodesCell : BaseCell

@property (nonatomic,strong) UILabel *phoneLabel;

@property (nonatomic,strong) UITextField *codeTextField;

@property (nonatomic,strong) UILabel *codeLabel1;
@property (nonatomic,strong) UILabel *codeLabel2;
@property (nonatomic,strong) UILabel *codeLabel3;
@property (nonatomic,strong) UILabel *codeLabel4;

@property (nonatomic,strong) UIImageView *warningImageView;
@property (nonatomic,strong) UILabel *warningLabel;

@property (nonatomic,strong) UIButton *getCodeButton;

@property (nonatomic,strong,readwrite) LoginCodeItem *item;

@end

NS_ASSUME_NONNULL_END
