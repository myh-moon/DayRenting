//
//  InvoiceGenerateRemindView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/26.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "InvoiceGenerateRemindView.h"

@implementation InvoiceGenerateRemindView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.remindImageView];
        [self addSubview:self.remindLabel];
        [self addSubview:self.line1];
        [self addSubview:self.line2];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.remindImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    [self.remindImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindImageView withOffset:25];
    [self.remindLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.remindImageView];
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:37.5];
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:37.5];
    
    [self.line1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.line1 autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.line1 autoSetDimension:ALDimensionHeight toSize:0.5];
    [self.line1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.leftButton];
    
    NSArray *views = @[self.leftButton,self.rightButton];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0.5 insetSpacing:YES];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [views autoSetViewsDimension:ALDimensionHeight toSize:48];
    
    [self.leftButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.rightButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    
    [self.line2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.leftButton];
    [self.line2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rightButton];
    [self.line2 autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.leftButton];
    [self.line2 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.leftButton];

}

- (UIImageView *)remindImageView {
    if (!_remindImageView) {
        _remindImageView = [UIImageView newAutoLayoutView];
    }
    return _remindImageView;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
    }
    return _remindLabel;
}

- (UILabel *)line1 {
    if (!_line1) {
        _line1 = [UILabel newAutoLayoutView];
        _line1.backgroundColor = DPLineColor2;
    }
    return _line1;
}

- (UILabel *)line2 {
    if (!_line2) {
        _line2 = [UILabel newAutoLayoutView];
        _line2.backgroundColor = DPLineColor2;
    }
    return _line2;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton newAutoLayoutView];
        [_leftButton setTitleColor:DPBlueColor forState:0];
        _leftButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_leftButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(335);
            }
        }];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton newAutoLayoutView];
        [_rightButton setTitleColor:DPLightGrayColor forState:0];
        _rightButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_rightButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(336);
            }
        }];
    }
    return _rightButton;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
