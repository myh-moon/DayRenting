//
//  MineUserScoreExchangeView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserScoreExchangeView.h"

@implementation MineUserScoreExchangeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.cancelButton];
        [self addSubview:self.scoreImageView];
        [self addSubview:self.scoreLabel];
        [self addSubview:self.ruleLabel];
        [self addSubview:self.exchangeButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];

    NSArray *views = @[self.scoreImageView,self.scoreLabel,self.ruleLabel,self.exchangeButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
    
    [self.scoreImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.scoreImageView autoSetDimensionsToSize:CGSizeMake(65, 65)];
    

    [self.scoreLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.scoreImageView withOffset:DPBigSpacing];
    
    [self.ruleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.scoreLabel withOffset:35];
    
    [self.exchangeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.ruleLabel withOffset:60];
    [self.exchangeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
    [self.exchangeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
    [self.exchangeButton autoSetDimension:ALDimensionHeight toSize:40];
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setImage:[UIImage imageNamed:@"close"] forState:0];
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(456);
            }
        }];
    }
    return _cancelButton;
}

- (UIImageView *)scoreImageView {
    if (!_scoreImageView) {
        _scoreImageView= [UIImageView newAutoLayoutView];
        [_scoreImageView setImage:[UIImage imageNamed:@"ticket"]];
    }
    return _scoreImageView;
}

- (UILabel *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [UILabel newAutoLayoutView];
        _scoreLabel.numberOfLines = 0;
    }
    return _scoreLabel;
}

- (UILabel *)ruleLabel {
    if (!_ruleLabel) {
        _ruleLabel = [UILabel newAutoLayoutView];
        _ruleLabel.text = @"使用规则：订单实付金额需满50元";
        _ruleLabel.textColor = DPDarkGrayColor;
        _ruleLabel.font = DPFont4;
    }
    return _ruleLabel;
}

- (UIButton *)exchangeButton {
    if (!_exchangeButton) {
        _exchangeButton = [UIButton newAutoLayoutView];
        _exchangeButton.backgroundColor = DPBlueColor;
        _exchangeButton.layer.cornerRadius = 3;
        _exchangeButton.layer.masksToBounds = YES;
        
        [_exchangeButton setTitle:@"确认兑换" forState:0];
        [_exchangeButton setTitleColor:DPWhiteColor forState:0];
        _exchangeButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_exchangeButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(457);
            }
        }];
    }
    return _exchangeButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
