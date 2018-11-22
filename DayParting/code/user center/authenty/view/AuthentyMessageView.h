//
//  AuthentyMessageView.h
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface AuthentyMessageView : BasePopView

@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *numberLabel;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong) UILabel *lineLabel1;
@property (nonatomic,strong) UILabel *lineLabel2;
@property (nonatomic,strong) UILabel *lineLabel3;

@property (nonatomic,strong) NSString *nameString;
@property (nonatomic,strong) NSString *numberString;


@end
