//
//  LoginCodeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "LoginCodeCell.h"

@implementation LoginCodeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight - 64;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.phoneLabel];
    
    [self.contentView addSubview:self.codeTextField1];
    [self.contentView addSubview:self.codeTextField2];
    [self.contentView addSubview:self.codeTextField3];
    [self.contentView addSubview:self.codeTextField4];
    [self.contentView addSubview:self.codeTextField5];
    [self.contentView addSubview:self.codeTextField6];
    
    [self.contentView addSubview:self.warningImageView];
    [self.contentView addSubview:self.warningLabel];
    
    [self.contentView addSubview:self.getCodeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.phoneLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:50];
    
    NSArray *views = @[self.codeTextField1,self.codeTextField2,self.codeTextField3,self.codeTextField4,self.codeTextField5,self.codeTextField6];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:9 insetSpacing:YES];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [[views lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.phoneLabel withOffset:55];
    [views autoSetViewsDimension:ALDimensionHeight toSize:55];
    
    
    [self.warningImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeTextField1 withOffset:DPBigSpacing];
    [self.warningImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.phoneLabel];
    
    [self.warningLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.warningImageView];
    [self.warningLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.warningImageView];
    [self.warningLabel autoSetDimensionsToSize:CGSizeMake(180, 35)];
    
    
    [self.getCodeButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:230];
    [self.getCodeButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.phoneLabel];
    
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        _phoneLabel = [UILabel newAutoLayoutView];
        _phoneLabel.numberOfLines = 0;
    }
    return _phoneLabel;
}

- (UITextField *)codeTextField1 {
    if (!_codeTextField1) {
        _codeTextField1 = [UITextField newAutoLayoutView];
        _codeTextField1.layer.cornerRadius = 10;
        _codeTextField1.textAlignment = NSTextAlignmentCenter;
        _codeTextField1.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField1.tag = 111;
        
        _codeTextField1.layer.borderWidth = 0.5;
        _codeTextField1.layer.borderColor = DPLightGrayColor17.CGColor;
        [_codeTextField1 becomeFirstResponder];
        
        DPWeakSelf;
        [_codeTextField1.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length == 1) {
                if (weakself.item.didEditting) {
                    [weakself.codeTextField2 becomeFirstResponder];
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
        _codeTextField2.layer.cornerRadius = 10;
        _codeTextField2.textAlignment = NSTextAlignmentCenter;
        _codeTextField2.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField2.tag = 112;

        _codeTextField2.layer.borderWidth = 0.5;
        _codeTextField2.layer.borderColor = DPLightGrayColor17.CGColor;
        
        DPWeakSelf;
        [_codeTextField2.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length == 1) {
                if (weakself.item.didEditting) {
                    [weakself.codeTextField3 becomeFirstResponder];
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
        _codeTextField3.layer.cornerRadius = 10;
        _codeTextField3.textAlignment = NSTextAlignmentCenter;
        _codeTextField3.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField3.tag = 113;

        _codeTextField3.layer.borderWidth = 0.5;
        _codeTextField3.layer.borderColor = DPLightGrayColor17.CGColor;
        
        DPWeakSelf;
        [_codeTextField3.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length == 1) {
                if (weakself.item.didEditting) {
                    [weakself.codeTextField4 becomeFirstResponder];
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
        _codeTextField4.layer.cornerRadius = 10;
        _codeTextField4.textAlignment = NSTextAlignmentCenter;
        _codeTextField4.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField4.tag = 114;

        _codeTextField4.layer.borderWidth = 0.5;
        _codeTextField4.layer.borderColor = DPLightGrayColor17.CGColor;
        
        DPWeakSelf;
        [_codeTextField4.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length > 0) {
                if (weakself.item.didEditting) {
                    [weakself.codeTextField5 becomeFirstResponder];
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
        _codeTextField5.layer.cornerRadius = 10;
        _codeTextField5.textAlignment = NSTextAlignmentCenter;
        _codeTextField5.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField5.tag = 115;

        _codeTextField5.layer.borderWidth = 0.5;
        _codeTextField5.layer.borderColor = DPLightGrayColor17.CGColor;
        
        DPWeakSelf;
        [_codeTextField5.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length > 0) {
                if (weakself.item.didEditting) {
                    [weakself.codeTextField6 becomeFirstResponder];
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
        _codeTextField6.layer.cornerRadius = 10;
        _codeTextField6.textAlignment = NSTextAlignmentCenter;
        _codeTextField6.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField6.tag = 116;

        _codeTextField6.layer.borderWidth = 0.5;
        _codeTextField6.layer.borderColor = DPLightGrayColor17.CGColor;
        
        DPWeakSelf;
        [_codeTextField6.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length > 0) {
                [weakself.codeTextField6 becomeFirstResponder];
                if (weakself.item.didEditting) {
                    weakself.item.didEditting([text substringToIndex:1]);
                }
            }
        }];
        
    }
    return _codeTextField6;
}

- (UIImageView *)warningImageView {
    if (!_warningImageView) {
        _warningImageView = [UIImageView newAutoLayoutView];
        _warningImageView.image = [UIImage imageNamed:@"triangle"];
    }
    return _warningImageView;
}

- (UILabel *)warningLabel {
    if (!_warningLabel) {
        _warningLabel = [UILabel newAutoLayoutView];
        _warningLabel.text = @"请输入正确验证码";
        _warningLabel.textColor = DPWhiteColor;
        _warningLabel.font = DPFont4;
        _warningLabel.textAlignment = NSTextAlignmentCenter;
        
        _warningLabel.backgroundColor = DPOrangeColor2;
        _warningLabel.layer.cornerRadius = 6;
        _warningLabel.layer.masksToBounds = YES;
    }
    return _warningLabel;
}


- (UIButton *)getCodeButton {
    if (!_getCodeButton) {
        _getCodeButton = [UIButton newAutoLayoutView];
        [_getCodeButton setTitle:@"没有收到验证码，重新获取（56s）" forState:0];
        [_getCodeButton setTitleColor:DPLightGrayColor forState:0];
        _getCodeButton.titleLabel.font = DPFont4;
    }
    return _getCodeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.phoneLabel.attributedText = [NSString setAttributeOfFirstString:@"输入发送至以下手机号的验证码：\n" firstFont:DPFont7 firstColor:DPDarkGrayColor secondString:@"（+86）152 5022 3562" secondFont:DPFont6 secondColor:DPLightGrayColor align:1 space:DPMiddleSpacing];
    
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
