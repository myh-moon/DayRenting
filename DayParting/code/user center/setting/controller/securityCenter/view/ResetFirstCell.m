//
//  ResetFirstCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/11.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "ResetFirstCell.h"


@implementation ResetFirstCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.remindLabel];
    
    [self.contentView addSubview:self.codeTextField];
    
//    [self.contentView addSubview:self.codeTextField1];
//    [self.contentView addSubview:self.codeTextField2];
//    [self.contentView addSubview:self.codeTextField3];
//    [self.contentView addSubview:self.codeTextField4];
//    [self.contentView addSubview:self.codeTextField5];
//    [self.contentView addSubview:self.codeTextField6];

    [self.contentView addSubview:self.timeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.headerImageView,self.remindLabel,self.timeButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.headerImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerImageView withOffset:28];

    [self.codeTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:50];
    [self.codeTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.codeTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.codeTextField autoSetDimension:ALDimensionHeight toSize:55];
    
//    NSArray *views1 = @[self.codeTextField1,self.codeTextField2,self.codeTextField3,self.codeTextField4,self.codeTextField5,self.codeTextField6];
//    [views1 autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:DPSmallSpacing insetSpacing:YES];
//    [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
//    [[views1 lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
//    [views1 autoSetViewsDimension:ALDimensionHeight toSize:55];
//
//    [self.codeTextField1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:50];

    [self.timeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeTextField withOffset:80];
}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [UIImageView newAutoLayoutView];
        [_headerImageView setImage:[UIImage imageNamed:@"phone_code"]];
    }
    return _headerImageView;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
    }
    return _remindLabel;
}


- (LYSecurityField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypePlainText borderType:BorderTypeHaveRoundedCorner];
        _codeTextField.delegate = self;
        _codeTextField.tintColor = DPLightGrayColor4;

        UIView *lloloView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 1)];
        lloloView.backgroundColor = DPLightGrayColor17;
        _codeTextField.inputAccessoryView =lloloView;

        DPWeakSelf;
        _codeTextField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
            if (weakself.item.didEditting) {
                weakself.item.didEditting(text);
            }
        };
    }
    return _codeTextField;
}


/*
- (UITextField *)codeTextField1 {
    if (!_codeTextField1) {
        _codeTextField1 = [UITextField newAutoLayoutView];
        _codeTextField1.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField1.layer.borderColor = DPLightGrayColor17.CGColor;
        _codeTextField1.layer.borderWidth = 0.5;
        _codeTextField1.layer.cornerRadius = 10;
        _codeTextField1.textAlignment = NSTextAlignmentCenter;
        [_codeTextField1 becomeFirstResponder];
        
        UIView *lloloView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 1)];
        lloloView.backgroundColor = DPLightGrayColor17;
        _codeTextField1.inputAccessoryView =lloloView;

        DPWeakSelf;
        [_codeTextField1.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length >= 1) {
                [weakself.codeTextField2 becomeFirstResponder];
                if (weakself.item.didEditting) {
                    weakself.item.didEditting(text);
                }
            }
        }];
    }
    return _codeTextField1;
}

- (UITextField *)codeTextField2 {
    if (!_codeTextField2) {
        _codeTextField2 = [UITextField newAutoLayoutView];
        _codeTextField2.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField2.layer.borderColor = DPLightGrayColor17.CGColor;
        _codeTextField2.layer.borderWidth = 0.5;
        _codeTextField2.layer.cornerRadius = 10;
        _codeTextField2.textAlignment = NSTextAlignmentCenter;

        DPWeakSelf;
        [_codeTextField2.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length >= 1) {
                [weakself.codeTextField3 becomeFirstResponder];
                if (weakself.item.didEditting) {
                    weakself.item.didEditting(text);
                }
            }
        }];
    }
    return _codeTextField2;
}

- (UITextField *)codeTextField3 {
    if (!_codeTextField3) {
        _codeTextField3 = [UITextField newAutoLayoutView];
        _codeTextField3.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField3.layer.borderColor = DPLightGrayColor17.CGColor;
        _codeTextField3.layer.borderWidth = 0.5;
        _codeTextField3.layer.cornerRadius = 10;
        _codeTextField3.textAlignment = NSTextAlignmentCenter;

        DPWeakSelf;
        [_codeTextField3.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length >= 1) {
                [weakself.codeTextField4 becomeFirstResponder];
                if (weakself.item.didEditting) {
                    weakself.item.didEditting(text);
                }
            }
        }];
    }
    return _codeTextField3;
}

- (UITextField *)codeTextField4 {
    if (!_codeTextField4) {
        _codeTextField4 = [UITextField newAutoLayoutView];
        _codeTextField4.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField4.layer.borderColor = DPLightGrayColor17.CGColor;
        _codeTextField4.layer.borderWidth = 0.5;
        _codeTextField4.layer.cornerRadius = 10;
        _codeTextField4.textAlignment = NSTextAlignmentCenter;

        DPWeakSelf;
        [_codeTextField4.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length >= 1) {
                [weakself.codeTextField5 becomeFirstResponder];
                if (weakself.item.didEditting) {
                    weakself.item.didEditting(text);
                }
            }
        }];
    }
    return _codeTextField4;
}

- (UITextField *)codeTextField5 {
    if (!_codeTextField5) {
        _codeTextField5 = [UITextField newAutoLayoutView];
        _codeTextField5.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField5.layer.borderColor = DPLightGrayColor17.CGColor;
        _codeTextField5.layer.borderWidth = 0.5;
        _codeTextField5.layer.cornerRadius = 10;
        _codeTextField5.textAlignment = NSTextAlignmentCenter;

        DPWeakSelf;
        [_codeTextField5.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length >= 1) {
                [weakself.codeTextField6 becomeFirstResponder];
                if (weakself.item.didEditting) {
                    weakself.item.didEditting(text);
                }
            }
        }];
    }
    return _codeTextField5;
}

- (UITextField *)codeTextField6 {
    if (!_codeTextField6) {
        _codeTextField6 = [UITextField newAutoLayoutView];
        _codeTextField6.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField6.layer.borderColor = DPLightGrayColor17.CGColor;
        _codeTextField6.layer.borderWidth = 0.5;
        _codeTextField6.layer.cornerRadius = 10;
        _codeTextField6.textAlignment = NSTextAlignmentCenter;

        DPWeakSelf;
        [_codeTextField6.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length >= 1) {
                weakself.codeTextField6.text = [text substringToIndex:1];
                if (weakself.item.didEditting) {
                    weakself.item.didEditting(text);
                }
            }
        }];
    }
    return _codeTextField6;
}
*/


- (JKCountDownButton *)timeButton {
    if (!_timeButton) {
        _timeButton = [JKCountDownButton newAutoLayoutView];
//        [_timeButton setTitle:@"没有收到验证码，重新获取（56s）" forState:0];
        [_timeButton setTitleColor:DPLightGrayColor forState:0];
        _timeButton.titleLabel.font = DPFont4;
        [_timeButton startCountDownWithSecond:60];
        [_timeButton countDownChanging:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            NSString *sdsd = [NSString stringWithFormat:@"没有收到验证码，重新获取（%lus）",(unsigned long)second];
            [countDownButton setTitle:sdsd forState:0];
            return @"60";
        }];
    }
    return _timeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.remindLabel.attributedText = [NSString setAttributeOfFirstString:@"输入发送至以下手机号的验证码：\n" firstFont:DPFont7 firstColor:DPDarkGrayColor secondString:self.item.phone secondFont:DPFont6 secondColor:DPLightGrayColor align:1 space:DPBigSpacing];
    
//    self.codeTextField.text = self.item.code;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
