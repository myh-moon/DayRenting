//
//  OrderResultUnlockView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultUnlockView.h"

@implementation OrderResultUnlockView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.cancelButton];
        [self addSubview:self.nameLabel];
        [self addSubview:self.colorLabel];
        [self addSubview:self.siteLabel];
        [self addSubview:self.autoLabel];
        [self addSubview:self.carImageView];
        [self addSubview:self.unlockButton];
        [self addSubview:self.unlockLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    NSArray *views = @[self.nameLabel,self.siteLabel,self.carImageView,self.unlockButton,self.unlockLabel];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
    
    NSArray *views1 = @[self.colorLabel,self.siteLabel,self.autoLabel];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:DPMiddleSpacing];
    [views1 autoSetViewsDimension:ALDimensionHeight toSize:16.5];
    
    [self.colorLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.siteLabel withOffset:-DPMiddleSpacing];
    
    [self.autoLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.siteLabel withOffset:DPMiddleSpacing];
    
    [self.carImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.colorLabel withOffset:DPMiddleSpacing*2];
    [self.carImageView autoSetDimensionsToSize:CGSizeMake(160, 90)];
    
    [self.unlockButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carImageView withOffset:DPMiddleSpacing*2];
//    [self.unlockButton autoSetDimensionsToSize:CGSizeMake(72, 72)];
    
    [self.unlockLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.unlockButton withOffset:DPBigSpacing];
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setImage:[UIImage imageNamed:@"close"] forState:0];
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(89);
            }
        }];
    }
    return _cancelButton;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
    }
    return _nameLabel;
}

- (UILabel *)colorLabel {
    if (!_colorLabel) {
        _colorLabel = [UILabel newAutoLayoutView];
        _colorLabel.textColor = DPLightGrayColor;
        _colorLabel.font = DPFont1;
        
        _colorLabel.layer.cornerRadius = 3;
        _colorLabel.layer.masksToBounds = YES;
        _colorLabel.layer.borderColor = DPLightGrayColor4.CGColor;
        _colorLabel.layer.borderWidth = 0.5;
    }
    return _colorLabel;
}

- (UILabel *)siteLabel {
    if (!_siteLabel) {
        _siteLabel = [UILabel newAutoLayoutView];
        _siteLabel.textColor = DPLightGrayColor;
        _siteLabel.font = DPFont1;
        
        _siteLabel.layer.cornerRadius = 3;
        _siteLabel.layer.masksToBounds = YES;
        _siteLabel.layer.borderColor = DPLightGrayColor4.CGColor;
        _siteLabel.layer.borderWidth = 0.5;
    }
    return _siteLabel;
}

- (UILabel *)autoLabel {
    if (!_autoLabel) {
        _autoLabel = [UILabel newAutoLayoutView];
        _autoLabel.textColor = DPLightGrayColor;
        _autoLabel.font = DPFont1;
        
        _autoLabel.layer.cornerRadius = 3;
        _autoLabel.layer.masksToBounds = YES;
        _autoLabel.layer.borderColor = DPLightGrayColor4.CGColor;
        _autoLabel.layer.borderWidth = 0.5;
    }
    return _autoLabel;
}

- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
    }
    return _carImageView;
}

- (UIButton *)unlockButton {
    if (!_unlockButton) {
        _unlockButton = [UIButton newAutoLayoutView];
        
        DPWeakSelf;
        [_unlockButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(90);
            }
        }];
    }
    return _unlockButton;
}

- (UILabel *)unlockLabel {
    if (!_unlockLabel) {
        _unlockLabel = [UILabel newAutoLayoutView];
        _unlockLabel.text = @"点击开锁";
        _unlockLabel.textColor = DPGrayColor;
        _unlockLabel.font = DPFont4;
    }
    return _unlockLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
