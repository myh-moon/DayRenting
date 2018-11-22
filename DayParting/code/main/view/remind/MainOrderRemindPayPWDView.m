//
//  MainOrderRemindPayPWDView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/27.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainOrderRemindPayPWDView.h"

@implementation MainOrderRemindPayPWDView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        
        [self addSubview:self.closeButton];
        [self addSubview:self.remindLabel];
        [self addSubview:self.pwdTextField];
        [self addSubview:self.forgetPwdButton];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.closeButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.closeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.closeButton autoSetDimensionsToSize:CGSizeMake(40, 40)];
    
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:24];
    [self.remindLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.pwdTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.pwdTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.pwdTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:45];
    [self.pwdTextField autoSetDimension:ALDimensionHeight toSize:55];
    
    [self.forgetPwdButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.pwdTextField];
    [self.forgetPwdButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.pwdTextField withOffset:DPMiddleSpacing];

}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton  = [UIButton newAutoLayoutView];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:0];
        _closeButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        _closeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _closeButton.imageEdgeInsets = UIEdgeInsetsMake(23, DPMiddleSpacing, 0, 0);
        
        DPWeakSelf;
        [_closeButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(221);
            }
        }];
        
    }
    return _closeButton;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"输入支付密码";
        _remindLabel.textColor = DPDarkGrayColor;
        _remindLabel.font = DPFont6;
    }
    return _remindLabel;
}

- (LYSecurityField *)pwdTextField {
    if (!_pwdTextField) {
        // 带圆角
        _pwdTextField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeHaveRoundedCorner];
        _pwdTextField.delegate = self;
        _pwdTextField.tintColor = DPLightGrayColor4;

        //键盘分割线
        UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 1)];
        inputView.backgroundColor = DPLightGrayColor17;
        _pwdTextField.inputAccessoryView = inputView;
       
        DPWeakSelf;
        _pwdTextField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
//            // 输入满格时被触发
//            NSString *string = [NSString stringWithFormat:@"当前输入为：%@\n第  %ld  次校验",text,field.countOfVerification];
////            weakself.infoLabel.text = string;
//            NSLog(@"当前输入为：%@",text);
//            NSLog(@"第  %ld  次校验",field.countOfVerification);
            
            if (weakself.didEditting) {
                weakself.didEditting(text);
            }
        };
//        [self.view addSubview:self.securityField];
        
        
        
        
        
        
        
        
        
        
//
//        _pwdTextField = [LYSecurityField newAutoLayoutView];
////        _pwdTextField.keyboardType = UIKeyboardTypeNumberPad;
//        _pwdTextField.layer.cornerRadius = 5;
//        _pwdTextField.layer.borderColor = DPLightGrayColor4.CGColor;
//        _pwdTextField.layer.borderWidth = 0.5;
//
////        UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 1)];
////        inputView.backgroundColor = DPLightGrayColor17;
////        _pwdTextField.inputAccessoryView = inputView;
//
////        DPWeakSelf;
////        [[_pwdTextField.rac_textSignal distinctUntilChanged] subscribeNext:^(NSString *text) {
////
////            if (text.length >= 6) {
////                weakself.pwdTextField.text = [text substringWithRange:NSMakeRange(0, 6)];
////                if (weakself.didEditting) {
////                    weakself.didEditting(weakself.pwdTextField.text);
////                }
////            }
////        }];
//
    }
    return _pwdTextField;
}

- (UIButton *)forgetPwdButton {
    if (!_forgetPwdButton) {
        _forgetPwdButton = [UIButton newAutoLayoutView];
        [_forgetPwdButton setTitle:@"忘记密码？" forState:0];
        [_forgetPwdButton setTitleColor:DPLightGrayColor forState:0];
        _forgetPwdButton.titleLabel.font = DPFont4;
        
        DPWeakSelf;
        [_forgetPwdButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(222);
            }
        }];
    }
    return _forgetPwdButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
