//
//  TicketChooseView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "TicketChooseView.h"

@implementation TicketChooseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.layer.shadowColor = DPBlackColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 3);
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.04;
                
        [self addSubview:self.availableButton];
        [self addSubview:self.historyButton];
        [self addSubview:self.lineLabel];
        
        [self setNeedsUpdateConstraints];
        
        self.leftLineConstraints = [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:24];
    }
    return self;
}

- (void)layoutView {
    
    [self.availableButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:24];
    [self.availableButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.historyButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.availableButton];
    [self.historyButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.availableButton withOffset:50];
    
    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:6];
    [self.lineLabel autoSetDimensionsToSize:CGSizeMake(80, 3)];
    
}

- (UIButton *)availableButton {
    if (!_availableButton) {
        _availableButton = [UIButton newAutoLayoutView];
        [_availableButton setTitle:@"可用优惠券" forState:0];
        [_availableButton setTitleColor:DPBlueColor forState:0];
        _availableButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_availableButton addAction:^(UIButton *btn) {
            [btn setTitleColor:DPBlueColor forState:0];
            weakself.leftLineConstraints.constant = 24;
            
            [weakself.historyButton setTitleColor:DPLightGrayColor forState:0];
            
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(24);
            }
        }];
    }
    return _availableButton;
}

- (UIButton *)historyButton {
    if (!_historyButton) {
        _historyButton = [UIButton newAutoLayoutView];
        [_historyButton setTitle:@"历史优惠券" forState:0];
        [_historyButton setTitleColor:DPLightGrayColor forState:0];
        _historyButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_historyButton addAction:^(UIButton *btn) {
            [btn setTitleColor:DPBlueColor forState:0];
            weakself.leftLineConstraints.constant = 24 + 50 + 80 + 5;
            
            [weakself.availableButton setTitleColor:DPLightGrayColor forState:0];
            
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(25);
            }
            
        }];
    }
    return _historyButton;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPBlueColor;
    }
    return _lineLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
