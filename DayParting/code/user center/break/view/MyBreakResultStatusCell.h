//
//  MyBreakResultStatusCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakResultStatusItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakResultStatusCell : BaseCell

@property (nonatomic,strong) NSLayoutConstraint *topWhiteResultConstraints; //resultLabel  上边距
@property (nonatomic,strong) NSLayoutConstraint *topWhiteLineConstraints; //lineLabel  上边距
@property (nonatomic,strong) NSLayoutConstraint *heightWhiteBackConstraints; //backWhiteImageView  高度

@property (nonatomic,strong) UIImageView *statusPoint1;
@property (nonatomic,strong) UIImageView *statusPoint2;
@property (nonatomic,strong) UIImageView *statusPoint3;

@property (nonatomic,strong) UILabel *statusLine1;
@property (nonatomic,strong) UILabel *statusLine2;
@property (nonatomic,strong) UILabel *statusLine3;
@property (nonatomic,strong) UILabel *statusLine4;

@property (nonatomic,strong) UILabel *statusTextLabel1;
@property (nonatomic,strong) UILabel *statusTextLabel2;
@property (nonatomic,strong) UILabel *statusTextLabel3;



@property (nonatomic,strong) UIImageView *backWhiteImageView;//背景图片

@property (nonatomic,strong) UIImageView *successImageView; //成功小图片
@property (nonatomic,strong) UILabel *resultLabel;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *submitButton;
@property (nonatomic,strong) UIButton *payButton;

@property (nonatomic,strong) UILabel *lineLabel;

//text
@property (nonatomic,strong) UILabel *numberLabel1;
@property (nonatomic,strong) UILabel *licenseLabel1;
@property (nonatomic,strong) UILabel *codeLabel1;
@property (nonatomic,strong) UILabel *contentLabel1;
@property (nonatomic,strong) UILabel *timeLabel1;
@property (nonatomic,strong) UILabel *addressLabel1;
@property (nonatomic,strong) UILabel *deductionLabel1;
@property (nonatomic,strong) UILabel *moneyLabel1;
@property (nonatomic,strong) UILabel *lateFeeLabel1;

@property (nonatomic,strong) UILabel *numberLabel2;
@property (nonatomic,strong) UILabel *licenseLabel2;
@property (nonatomic,strong) UILabel *codeLabel2;
@property (nonatomic,strong) UILabel *contentLabel2;
@property (nonatomic,strong) UILabel *timeLabel2;
@property (nonatomic,strong) UILabel *addressLabel2;
@property (nonatomic,strong) UILabel *deductionLabel2;
@property (nonatomic,strong) UILabel *moneyLabel2;
@property (nonatomic,strong) UILabel *lateFeeLabel2;

@property (nonatomic,strong,readwrite) MyBreakResultStatusItem *item;

@end

NS_ASSUME_NONNULL_END
