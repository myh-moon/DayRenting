//
//  CarMessageView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarMessageView.h"

@implementation CarMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.returnButton];
        [self addSubview:self.carImageView];
        [self addSubview:self.durationLabel];
        [self addSubview:self.distanceLabel];
        [self addSubview:self.costLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPBigSpacing];
    
    [self.returnButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.returnButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.nameLabel];
    [self.returnButton autoSetDimensionsToSize:CGSizeMake(70, 30)];
    
    [self.carImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:DPMiddleSpacing];
    [self.carImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.carImageView autoSetDimensionsToSize:CGSizeMake(160, 90)];
    
    NSArray *views = @[self.durationLabel,self.distanceLabel,self.costLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carImageView withOffset:DPMiddleSpacing];
    
    [self.durationLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
    
    [self.distanceLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.carImageView];
    
    [self.costLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.returnButton];
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.text = @"沪A3322L  别克凯越";
        _nameLabel.textColor = DPLightGrayColor;
        _nameLabel.font = DPFont3;
    }
    return _nameLabel;
}

- (UIButton *)returnButton {
    if (!_returnButton) {
        _returnButton = [UIButton newAutoLayoutView];
        [_returnButton setTitle:@"去还车" forState:0];
        [_returnButton setTitleColor:DPWhiteColor forState:0];
        _returnButton.titleLabel.font = DPFont3;
        
        _returnButton.layer.cornerRadius = 15;
        _returnButton.backgroundColor = DPBlueColor;
        
        DPWeakSelf;
        [_returnButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(56);
            }
        }];
    }
    return _returnButton;
}

- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
    }
    return _carImageView;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
        _durationLabel.numberOfLines = 0;
        _durationLabel.attributedText = [NSString setAttributeOfFirstString:@"24分钟\n" firstFont:DPFont6 firstColor:DPBlackColor secondString:@"用车时长" secondFont:DPFont3 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    }
    return _durationLabel;
}

- (UILabel *)distanceLabel {
    if (!_distanceLabel) {
        _distanceLabel = [UILabel newAutoLayoutView];
        _distanceLabel.numberOfLines = 0;
        _distanceLabel.attributedText = [NSString setAttributeOfFirstString:@"4公里\n" firstFont:DPFont6 firstColor:DPBlackColor secondString:@"行驶里程" secondFont:DPFont3 secondColor:DPLightGrayColor align:1 space:DPSmallSpacing];
    }
    return _distanceLabel;
}

- (UILabel *)costLabel {
    if (!_costLabel) {
        _costLabel = [UILabel newAutoLayoutView];
        _costLabel.numberOfLines = 0;
        _costLabel.attributedText = [NSString setAttributeOfFirstString:@"28.06元\n" firstFont:DPFont6 firstColor:DPBlackColor secondString:@"预计费用" secondFont:DPFont3 secondColor:DPLightGrayColor align:2 space:DPSmallSpacing];
    }
    return _costLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
