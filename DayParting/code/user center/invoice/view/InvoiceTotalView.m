//
//  InvoiceTotalView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/3.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "InvoiceTotalView.h"

@implementation InvoiceTotalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor  =DPWhiteColor;
        
        self.layer.shadowColor = DPShadowColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(0, -5);
        self.layer.shadowOpacity = 0.6;
        
        [self addSubview:self.totalLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.selectTotalButton];
        [self addSubview:self.nextStepButton];
        
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}

- (void)layoutView {
    [self.totalLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.totalLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.totalLabel autoSetDimension:ALDimensionHeight toSize:32];
    [self.totalLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.lineLabel ];
    
    [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.totalLabel];
    [self.lineLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.totalLabel];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:0.5];
    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:60];
    
    [self.selectTotalButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.selectTotalButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.selectTotalButton autoSetDimension:ALDimensionWidth toSize:150];
    [self.selectTotalButton autoSetDimension:ALDimensionHeight toSize:60];
    
    [self.nextStepButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.nextStepButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:DPSmallSpacing];
    [self.nextStepButton autoSetDimension:ALDimensionHeight toSize:40];
    [self.nextStepButton autoSetDimension:ALDimensionWidth toSize:170];
}

- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [UILabel newAutoLayoutView];
    }
    return _totalLabel;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLineColor2;
    }
    return _lineLabel;
}

- (UIButton *)selectTotalButton {
    if (!_selectTotalButton) {
        _selectTotalButton = [UIButton newAutoLayoutView];
        [_selectTotalButton setTitle:@"  本页全选" forState:0];
        [_selectTotalButton setTitleColor:DPGrayColor forState:0];
        _selectTotalButton.titleLabel.font = DPFont3;
        _selectTotalButton.tag = 233;
        
        [_selectTotalButton setImage:[UIImage imageNamed:@"bank_noselected"] forState:0];
        [_selectTotalButton setImage:[UIImage imageNamed:@"invoice_selecteds"] forState:UIControlStateSelected];

        _selectTotalButton.contentHorizontalAlignment = 1;
        _selectTotalButton.contentEdgeInsets = UIEdgeInsetsMake(0, DPMiddleSpacing, 0, 0);
        
        DPWeakSelf;
        [_selectTotalButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
            if (weakself.didClickBtn) {
                weakself.didClickBtn(btn);
            }
        }];
        
    }
    return _selectTotalButton;
}

- (UIButton *)nextStepButton {
    if (!_nextStepButton) {
        _nextStepButton = [UIButton newAutoLayoutView];
        [_nextStepButton setTitle:@"下一步" forState:0];
        [_nextStepButton setTitleColor:DPWhiteColor forState:0];
        _nextStepButton.titleLabel.font = DPFont5;
        _nextStepButton.tag = 234;
        
        _nextStepButton.backgroundColor = DPBlueColor;
        _nextStepButton.layer.cornerRadius = 3;
        _nextStepButton.layer.masksToBounds = YES;
        
        DPWeakSelf;
        [_nextStepButton addAction:^(UIButton *btn) {
            if (weakself.didClickBtn) {
                weakself.didClickBtn(btn);
            }
        }];
    }
    return _nextStepButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
