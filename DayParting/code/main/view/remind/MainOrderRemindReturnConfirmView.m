//
//  MainOrderRemindReturnConfirmView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainOrderRemindReturnConfirmView.h"

@implementation MainOrderRemindReturnConfirmView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.confirmImageView];
        [self.confirmImageView addSubview:self.cancelButton];
        [self addSubview:self.remindLabel];
        [self addSubview:self.attentionLabel];
        [self addSubview:self.notReturnButton];
        [self addSubview:self.returnButton];
        
        [self addSubview:self.horizonLabel];
        [self addSubview:self.verticalLabel];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    
    [self.confirmImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    [self.confirmImageView autoSetDimension:ALDimensionHeight toSize:190];
    
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];

    [self.remindLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.confirmImageView withOffset:-22];
    [self.remindLabel autoSetDimensionsToSize:CGSizeMake(120, 44)];
    
    [self.attentionLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.remindLabel];
    [self.attentionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:DPBigSpacing];
    
    
    NSArray *views = @[self.notReturnButton,self.returnButton];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0];
    [views autoSetViewsDimension:ALDimensionHeight toSize:44];
    
    [self.notReturnButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.notReturnButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.horizonLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.notReturnButton];
    [self.horizonLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.returnButton];
    [self.horizonLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.notReturnButton withOffset:-0.5];
    [self.horizonLabel autoSetDimension:ALDimensionHeight toSize:0.5];
    
    
    [self.verticalLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.notReturnButton];
    [self.verticalLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.notReturnButton];
    [self.verticalLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.notReturnButton];
    [self.verticalLabel autoSetDimension:ALDimensionWidth toSize:0.5];
    
}

- (UIImageView *)confirmImageView {
    if (!_confirmImageView) {
        _confirmImageView = [UIImageView newAutoLayoutView];
        _confirmImageView.backgroundColor = DPRedColor;
    }
    return _confirmImageView;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(46);
            }
        }];
    }
    return _cancelButton;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"注意事项";
        _remindLabel.textColor = DPGrayColor;
        _remindLabel.font = DPFont5;
        _remindLabel.backgroundColor = UIColorFromRGB(0xf6f6f6);
        _remindLabel.textAlignment = NSTextAlignmentCenter;

        _remindLabel.layer.cornerRadius = 22.5;
        _remindLabel.layer.masksToBounds = YES;
        
        _remindLabel.layer.borderWidth = 7;
        _remindLabel.layer.borderColor = UIColorFromRGB1(0xffffff, 0.8).CGColor;
    }
    return _remindLabel;
}

- (UILabel *)attentionLabel {
    if (!_attentionLabel) {
        _attentionLabel = [UILabel newAutoLayoutView];
        _attentionLabel.numberOfLines = 0;
        _attentionLabel.attributedText = [NSString setAttributeOfFirstString:@"确认还车后，车辆将立即锁车\n" firstFont:DPFont7 firstColor:DPDarkGrayColor secondString:@"请将车钥匙放回原处，并确定您站在车外" secondFont:DPFont4 secondColor:DPGrayColor align:1 space:DPMiddleSpacing];
    }
    return _attentionLabel;
}

- (UIButton *)notReturnButton {
    if (!_notReturnButton) {
        _notReturnButton = [UIButton newAutoLayoutView];
        [_notReturnButton setTitle:@"暂不还车" forState:0];
        [_notReturnButton setTitleColor:DPLightGrayColor forState:0];
        _notReturnButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_notReturnButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(47);
            }
        }];
    }
    return _notReturnButton;
}

- (UIButton *)returnButton {
    if (!_returnButton) {
        _returnButton = [UIButton newAutoLayoutView];
        [_returnButton setTitle:@"确认还车" forState:0];
        [_returnButton setTitleColor:DPBlueColor forState:0];
        _returnButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_returnButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(48);
            }
        }];
    }
    return _returnButton;
}

- (UILabel *)horizonLabel {
    if (!_horizonLabel) {
        _horizonLabel = [UILabel newAutoLayoutView];
        _horizonLabel.backgroundColor = DPLineColor2;
    }
    return _horizonLabel;
}

- (UILabel *)verticalLabel {
    if (!_verticalLabel) {
        _verticalLabel = [UILabel newAutoLayoutView];
        _verticalLabel.backgroundColor = DPLineColor2;
    }
    return _verticalLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
