//
//  MainOrderRemindPayResultView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainOrderRemindPayResultView.h"

@implementation MainOrderRemindPayResultView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        self.backgroundColor = DPWhiteColor;
        
        [self addSubview:self.cancelButton];
        [self addSubview:self.resultImageView];
        [self addSubview:self.resultLabel];
        [self addSubview:self.oidLabel];
        [self addSubview:self.oidDetailLabel];
        [self addSubview:self.wayLabel];
        [self addSubview:self.wayDetailLabel];
        [self addSubview:self.ticketLabel];
        [self addSubview:self.ticketDetailLabel];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.moneyDetailLabel];
        [self addSubview:self.checkOrderButton];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    
    [self.resultImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    [self.resultImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.resultLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.resultImageView withOffset:DPMiddleSpacing];
    [self.resultLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.resultImageView];
    
    [self.oidLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
    [self.oidLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.resultLabel withOffset:35];
    
    [self.oidDetailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
    [self.oidDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.oidLabel];
    
    [self.wayLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.oidLabel];
    [self.wayLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.oidLabel withOffset:DPMiddleSpacing];
    
    [self.wayDetailLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.oidDetailLabel];
    [self.wayDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.wayLabel];
    
    [self.ticketLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.wayLabel];
    [self.ticketLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.wayLabel withOffset:DPMiddleSpacing];
    
    [self.ticketDetailLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.wayDetailLabel];
    [self.ticketDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.ticketLabel];
    
    [self.moneyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.ticketLabel];
    [self.moneyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.ticketLabel withOffset:DPMiddleSpacing];
    
    [self.moneyDetailLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.ticketDetailLabel];
    [self.moneyDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyLabel];
    
    [self.checkOrderButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.checkOrderButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.moneyLabel withOffset:35];
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setImage:[UIImage imageNamed:@"close"] forState:0];
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(222);
            }
        }];
    }
    return _cancelButton;
}

- (UIImageView *)resultImageView {
    if (!_resultImageView) {
        _resultImageView = [UIImageView newAutoLayoutView];
    }
    return _resultImageView;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [UILabel newAutoLayoutView];
        _resultLabel.textColor = DPDarkGrayColor;
        _resultLabel.font = DPFont6;
    }
    return _resultLabel;
}

- (UILabel *)oidLabel {
    if (!_oidLabel) {
        _oidLabel = [UILabel newAutoLayoutView];
        _oidLabel.textColor = DPLightGrayColor;
        _oidLabel.font = DPFont4;
    }
    return _oidLabel;
}

- (UILabel *)oidDetailLabel {
    if (!_oidDetailLabel) {
        _oidDetailLabel = [UILabel newAutoLayoutView];
        _oidDetailLabel.textColor = DPLightGrayColor;
        _oidDetailLabel.font = DPFont4;
    }
    return _oidDetailLabel;
}

- (UILabel *)wayLabel {
    if (!_wayLabel) {
        _wayLabel = [UILabel newAutoLayoutView];
        _wayLabel.textColor = DPLightGrayColor;
        _wayLabel.font = DPFont4;
    }
    return _wayLabel;
}

- (UILabel *)wayDetailLabel {
    if (!_wayDetailLabel) {
        _wayDetailLabel = [UILabel newAutoLayoutView];
        _wayDetailLabel.textColor = DPLightGrayColor;
        _wayDetailLabel.font = DPFont4;
    }
    return _wayDetailLabel;
}

- (UILabel *)ticketLabel {
    if (!_ticketLabel) {
        _ticketLabel = [UILabel newAutoLayoutView];
        _ticketLabel.textColor = DPLightGrayColor;
        _ticketLabel.font = DPFont4;
    }
    return _ticketLabel;
}

- (UILabel *)ticketDetailLabel {
    if (!_ticketDetailLabel) {
        _ticketDetailLabel = [UILabel newAutoLayoutView];
        _ticketDetailLabel.textColor = DPLightGrayColor;
        _ticketDetailLabel.font = DPFont4;
    }
    return _ticketDetailLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.textColor = DPLightGrayColor;
        _moneyLabel.font = DPFont4;
    }
    return _moneyLabel;
}

- (UILabel *)moneyDetailLabel {
    if (!_moneyDetailLabel) {
        _moneyDetailLabel = [UILabel newAutoLayoutView];
        _moneyDetailLabel.textColor = DPLightGrayColor;
        _moneyDetailLabel.font = DPFont4;
    }
    return _moneyDetailLabel;
}

- (UIButton *)checkOrderButton {
    if (!_checkOrderButton) {
        _checkOrderButton = [UIButton newAutoLayoutView];
        [_checkOrderButton setTitle:@"查看订单 >>" forState:0];
        [_checkOrderButton setTitleColor:DPBlueColor forState:0];
        _checkOrderButton.titleLabel.font = DPFont6;
        _checkOrderButton.backgroundColor = DPBlueColor2;
        
        DPWeakSelf;
        [_checkOrderButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(223);
            }
        }];
    }
    return _checkOrderButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
