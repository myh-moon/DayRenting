//
//  AuthentyMessageView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyMessageView.h"

@implementation AuthentyMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.cancelButton];
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.nameLabel];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.numberLabel];
        [self addSubview:self.lineLabel3];
        [self addSubview:self.submitButton];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPBigSpacing];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPBigSpacing];

    [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.cancelButton];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    NSArray *views = @[self.lineLabel1,self.lineLabel2,self.lineLabel3];
    [views autoSetViewsDimension:ALDimensionHeight toSize:0.5];
    
    [self.lineLabel1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.lineLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:25];
    
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel1 withOffset:DPBigSpacing];
    
    [self.lineLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
    [self.lineLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:DPBigSpacing];
    [self.lineLabel2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    
    [self.numberLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel2];
    [self.numberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel2 withOffset:DPBigSpacing];
    
    [self.lineLabel3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.numberLabel];
    [self.lineLabel3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.numberLabel withOffset:DPBigSpacing];
    [self.lineLabel3 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel2];
    
    [self.submitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPBigSpacing, DPBigSpacing, DPBigSpacing) excludingEdge:ALEdgeTop];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:40];
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setImage: [UIImage imageNamed:@"right_arrow"] forState:0];
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(12);
            }
        }];
    }
    return _cancelButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"身份信息识别结果";
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont6;
    }
    return _titleLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        
    }
    return _nameLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [UILabel newAutoLayoutView];
    }
    return _numberLabel;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        _submitButton.backgroundColor = DPBlueColor;
        _submitButton.layer.cornerRadius = 3;
        _submitButton.layer.masksToBounds = YES;
        
        [_submitButton setTitle:@"确认本人信息" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(13);
            }
        }];
    }
    return _submitButton;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [UILabel newAutoLayoutView];
        _lineLabel1.backgroundColor = DPLightGrayColor5;
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
        _lineLabel2.backgroundColor = DPLightGrayColor5;
    }
    return _lineLabel2;
}

- (UILabel *)lineLabel3 {
    if (!_lineLabel3) {
        _lineLabel3 = [UILabel newAutoLayoutView];
        _lineLabel3.backgroundColor = DPLightGrayColor5;
    }
    return _lineLabel3;
}

- (void)setNameString:(NSString *)nameString {
    _nameString = nameString;
}

- (void)setNumberString:(NSString *)numberString {
    _numberString = numberString;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
