//
//  OrderResultMessageView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultMessageView.h"

@implementation OrderResultMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.whiteBackView];
        
        [self.whiteBackView addSubview:self.blueLabel];
        [self.whiteBackView addSubview:self.serviceLabel];
        [self.whiteBackView addSubview:self.addressLabel];
        [self.whiteBackView addSubview:self.lineLabel];
        [self.whiteBackView addSubview:self.carImageView];
        [self.whiteBackView addSubview:self.nameLabel];
        [self.whiteBackView addSubview:self.oilLabel];
        [self.whiteBackView addSubview:self.colorLabel];
        [self.whiteBackView addSubview:self.siteLabel];
        
        [self addSubview:self.grayBackView];
        [self.grayBackView addSubview:self.markButton];
        [self.grayBackView addSubview:self.markTextButton];
        [self.grayBackView addSubview:self.lightButton];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.whiteBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.whiteBackView autoSetDimension:ALDimensionHeight toSize:170];
        
        [self.blueLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
        [self.blueLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.blueLabel autoSetDimensionsToSize:CGSizeMake(50, 20)];
        
        [self.serviceLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.blueLabel];
        [self.serviceLabel autoPinEdge:ALEdgeLeft  toEdge:ALEdgeRight ofView:self.blueLabel withOffset:DPSmallSpacing];
        [self.serviceLabel autoSetDimensionsToSize:CGSizeMake(DPWindowWidth-130, 20)];
        
        [self.addressLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.blueLabel];
        [self.addressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueLabel withOffset:DPSmallSpacing];
        [self.addressLabel autoSetDimensionsToSize:CGSizeMake(DPWindowWidth-DPMiddleSpacing*5, 15)];
        
        [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.addressLabel];
        [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.addressLabel withOffset:DPBigSpacing];
        [self.lineLabel autoSetDimension:ALDimensionHeight toSize:0.5];
        
        [self.carImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel];
        [self.carImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel withOffset:DPMiddleSpacing];
        [self.carImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:DPMiddleSpacing];
        [self.carImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.carImageView withMultiplier:1.78];
        
        [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.carImageView withOffset:6];
        [self.nameLabel autoPinEdge:ALEdgeLeft  toEdge:ALEdgeRight ofView:self.carImageView withOffset:DPMiddleSpacing];
        
        NSArray *views = @[self.oilLabel,self.colorLabel,self.siteLabel];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        [views autoSetViewsDimension:ALDimensionHeight toSize:16.5];
        
        [self.oilLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
        [self.oilLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.carImageView withOffset:-6];
        
        [self.colorLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.oilLabel withOffset:DPMiddleSpacing];
        
        [self.siteLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.colorLabel withOffset:DPMiddleSpacing];
        
        [self.grayBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.grayBackView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.whiteBackView];
        
        [self.markButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.markButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.markTextButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.markButton];
        [self.markTextButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.markButton];
        
        [self.lightButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.lightButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.markTextButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIView *)whiteBackView {
    if (!_whiteBackView) {
        _whiteBackView = [UIView newAutoLayoutView];
        _whiteBackView.backgroundColor = DPWhiteColor;
    }
    return _whiteBackView;
}

- (UILabel *)blueLabel {
    if (!_blueLabel) {
        _blueLabel = [UILabel newAutoLayoutView];
        _blueLabel.backgroundColor = DPBlueColor;
        _blueLabel.text = @"取车点";
        _blueLabel.textColor = DPWhiteColor;
        _blueLabel.font = DPFont3;
        _blueLabel.layer.cornerRadius = 3;
        _blueLabel.layer.masksToBounds = YES;
        _blueLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _blueLabel;
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel newAutoLayoutView];
        _serviceLabel.textColor = DPDarkGrayColor;
        _serviceLabel.font = DPFont6;
    }
    return _serviceLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel newAutoLayoutView];
        _addressLabel.textColor = DPGrayColor;
        _addressLabel.font = DPFont3;
    }
    return _addressLabel;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = UIColorFromRGB(0xeeeeee);
    }
    return _lineLabel;
}

- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
        _carImageView.layer.borderColor = DPLineColor2.CGColor;
        _carImageView.layer.borderWidth = 0.5;
    }
    return _carImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
    }
    return _nameLabel;
}

- (UILabel *)oilLabel {
    if (!_oilLabel) {
        _oilLabel = [UILabel newAutoLayoutView];
        _oilLabel.layer.cornerRadius = 3;
        _oilLabel.layer.borderColor = DPBlueColor.CGColor;
        _oilLabel.layer.borderWidth = 0.5;
        _oilLabel.textColor = DPBlueColor;
        _oilLabel.font = DPFont1;
    }
    return _oilLabel;
}

- (UILabel *)colorLabel {
    if (!_colorLabel) {
        _colorLabel = [UILabel newAutoLayoutView];
        _colorLabel.layer.cornerRadius = 3;
        _colorLabel.layer.borderColor = DPLightGrayColor.CGColor;
        _colorLabel.layer.borderWidth = 0.5;
        _colorLabel.textColor = DPLightGrayColor;
        _colorLabel.font = DPFont1;
    }
    return _colorLabel;
}
- (UILabel *)siteLabel {
    if (!_siteLabel) {
        _siteLabel = [UILabel newAutoLayoutView];
        _siteLabel.layer.cornerRadius = 3;
        _siteLabel.layer.borderColor = DPLightGrayColor.CGColor;
        _siteLabel.layer.borderWidth = 0.5;
        _siteLabel.textColor = DPLightGrayColor;
        _siteLabel.font = DPFont1;
    }
    return _siteLabel;
}


- (UIView *)grayBackView {
    if (!_grayBackView) {
        _grayBackView = [UIView newAutoLayoutView];
        _grayBackView.backgroundColor = DPBackGroundColor;
    }
    return _grayBackView;
}

- (UIButton *)markButton {
    if (!_markButton) {
        _markButton = [UIButton newAutoLayoutView];
        [_markButton setTitle:@"  已阅读并同意" forState:0];
        [_markButton setTitleColor:DPDarkGrayColor forState:0];
        _markButton.titleLabel.font = DPFont3;
        
        [_markButton setImage:[UIImage imageNamed:@"rent_agree"] forState:0];
        [_markButton setImage:[UIImage imageNamed:@"rent_disagree"] forState:UIControlStateSelected];
        
        DPWeakSelf;
        [_markButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(520);
            }
            btn.selected = !btn.selected;
        }];
    }
    return _markButton;
}

- (UIButton *)markTextButton {
    if (!_markTextButton) {
        _markTextButton = [UIButton newAutoLayoutView];
        [_markTextButton setTitle:@"《租车合同》" forState:0];
        [_markTextButton setTitleColor:DPBlueColor forState:0];
        _markTextButton.titleLabel.font = DPFont3;
        
        DPWeakSelf;
        [_markTextButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(521);
            }
        }];
    }
    return _markTextButton;
}

- (UIButton *)lightButton {
    if (!_lightButton) {
        _lightButton = [UIButton newAutoLayoutView];
        [_lightButton setImage:[UIImage imageNamed:@"car_light"] forState:0];
        [_lightButton swapImage];
        [_lightButton setTitle:@"灯光寻车  " forState:0];
        [_lightButton setTitleColor:DPLightGrayColor forState:0];
        _lightButton.titleLabel.font = DPFont3;
        
        DPWeakSelf;
        [_lightButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(522);
            }
        }];
    }
    return _lightButton;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
