//
//  MainOrderRemindCostDetailView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainOrderRemindCostDetailView.h"

@implementation MainOrderRemindCostDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        self.backgroundColor = DPWhiteColor;
        
        [self addSubview:self.cancelButton];
        [self addSubview:self.rentMoneyLabel];
        
        [self addSubview:self.lineLabel1];
        
        [self addSubview:self.baseLabel];
        [self addSubview:self.baseMoneyLabel];
        
        [self addSubview:self.shichangLabel];
        [self addSubview:self.shichangMoneyLabel];
        
        [self addSubview:self.lichengLabel];
        [self addSubview:self.lichengMoneyLabel];
        
        [self addSubview:self.serviceLabel];
        [self addSubview:self.serviceMoneyLabel];
        
        [self addSubview:self.lineLabel2];
        
        [self addSubview:self.ruleButton];
        
        [self addSubview:self.lineLabel3];
        
        [self addSubview:self.questionButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.rentMoneyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    [self.rentMoneyLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.lineLabel1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPBigSpacing];
    [self.lineLabel1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPBigSpacing];
    [self.lineLabel1 autoSetDimension:ALDimensionHeight toSize:0.5];
    [self.lineLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.rentMoneyLabel withOffset:DPBigSpacing];
    
    [self.baseLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel1];
    [self.baseLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel1 withOffset:25];
    
    [self.baseMoneyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel1];
    [self.baseMoneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.baseLabel];
    
    [self.shichangLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.baseLabel];
    [self.shichangLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.baseLabel withOffset:30];
    
    [self.shichangMoneyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.baseMoneyLabel];
    [self.shichangMoneyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.shichangLabel];
    
    [self.lichengLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.shichangLabel];
    [self.lichengLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.shichangLabel withOffset:30];
    
    [self.lichengMoneyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.shichangMoneyLabel];
    [self.lichengMoneyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.lichengLabel];
    
    [self.serviceLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lichengLabel];
    [self.serviceLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lichengLabel];
    
    [self.serviceMoneyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lichengMoneyLabel];
    [self.serviceMoneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.serviceLabel];
    
    [self.lineLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.serviceLabel];
    [self.lineLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.serviceLabel withOffset:30];
    [self.lineLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.serviceMoneyLabel];
    [self.lineLabel2 autoSetDimension:ALDimensionHeight toSize:0.5];
    
    [self.lineLabel3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel2 withOffset:20];
    [self.lineLabel3 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.rentMoneyLabel];
    [self.lineLabel3 autoSetDimensionsToSize:CGSizeMake(0.5, DPMiddleSpacing)];

    [self.ruleButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.lineLabel3 withOffset:-DPMiddleSpacing];
    [self.ruleButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.lineLabel3];
    
    [self.questionButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel3 withOffset:DPMiddleSpacing];
    [self.questionButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.lineLabel3];
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setImage:[UIImage imageNamed:@"close"] forState:0];
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(333);
            }
        }];
    }
    return _cancelButton;
}

- (UILabel *)rentMoneyLabel {
    if (!_rentMoneyLabel) {
        _rentMoneyLabel = [UILabel newAutoLayoutView];
        _rentMoneyLabel.numberOfLines = 0;
//        _rentMoneyLabel.attributedText = [NSString setAttributeOfFirstString:@"租金（元）\n" firstFont:DPFont3 firstColor:DPGrayColor secondString:@"76.30" secondFont:[UIFont fontWithName:@"PingFangSC-Medium" size:31] secondColor:DPDarkGrayColor align:1 space:5];
    }
    return _rentMoneyLabel;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [UILabel newAutoLayoutView];
        _lineLabel1.backgroundColor = DPLineColor2;
    }
    return _lineLabel1;
}

- (UILabel *)baseLabel {
    if (!_baseLabel) {
        _baseLabel = [UILabel newAutoLayoutView];
        _baseLabel.text = @"起步价";
        _baseLabel.textColor = DPGrayColor;
        _baseLabel.font = DPFont4;
    }
    return _baseLabel;
}

- (UILabel *)baseMoneyLabel {
    if (!_baseMoneyLabel) {
        _baseMoneyLabel = [UILabel newAutoLayoutView];
        _baseMoneyLabel.textColor = DPDarkGrayColor;
        _baseMoneyLabel.text = @"未返回";
        _baseMoneyLabel.font = DPFont4;
    }
    return _baseMoneyLabel;
}

- (UILabel *)shichangLabel {
    if (!_shichangLabel) {
        _shichangLabel = [UILabel newAutoLayoutView];
        _shichangLabel.numberOfLines = 0;
        
//        _shichangLabel.attributedText = [NSString setAttributeOfFirstString:@"时长费（141分钟） \n" firstFont:DPFont4 firstColor:DPGrayColor secondString:@"日间时长费：0.19元/分钟\n" secondFont:DPFont2 secondColor:DPLightGrayColor thirdString:@"夜间时长费：0.02元/分钟" thirdFont:DPFont2 thirdColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    }
    return _shichangLabel;
}

- (UILabel *)shichangMoneyLabel {
    if (!_shichangMoneyLabel) {
        _shichangMoneyLabel = [UILabel newAutoLayoutView];
        _shichangMoneyLabel.textColor = DPDarkGrayColor;
//        _shichangMoneyLabel.text = @"26.74元";
        _shichangMoneyLabel.font = DPFont4;
    }
    return _shichangMoneyLabel;
}

- (UILabel *)lichengLabel {
    if (!_lichengLabel) {
        _lichengLabel = [UILabel newAutoLayoutView];
        _lichengLabel.numberOfLines = 0;
        
//        _lichengLabel.attributedText = [NSString setAttributeOfFirstString:@"里程费（44公里）\n" firstFont:DPFont4 firstColor:DPGrayColor secondString:@"0.99元/公里\n" secondFont:DPFont2 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    }
    return _lichengLabel;
}

- (UILabel *)lichengMoneyLabel {
    if (!_lichengMoneyLabel) {
        _lichengMoneyLabel = [UILabel newAutoLayoutView];
        _lichengMoneyLabel.textColor = DPDarkGrayColor;
//        _lichengMoneyLabel.text = @"43.56元";
        _lichengMoneyLabel.font = DPFont4;
    }
    return _lichengMoneyLabel;
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel newAutoLayoutView];
        _serviceLabel.text = @"尊享服务费 ";
        _serviceLabel.textColor = DPGrayColor;
        _serviceLabel.font = DPFont4;
    }
    return _serviceLabel;
}

- (UILabel *)serviceMoneyLabel {
    if (!_serviceMoneyLabel) {
        _serviceMoneyLabel = [UILabel newAutoLayoutView];
        _serviceMoneyLabel.textColor = DPDarkGrayColor;
        _serviceMoneyLabel.text = @"0元";
        _serviceMoneyLabel.font = DPFont4;
    }
    return _serviceMoneyLabel;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
        _lineLabel2.backgroundColor = DPLineColor2;
    }
    return _lineLabel2;
}

- (UIButton *)ruleButton {
    if (!_ruleButton) {
        _ruleButton = [UIButton newAutoLayoutView];
        [_ruleButton setTitle:@"计价规则" forState:0];
        [_ruleButton setTitleColor:DPBlueColor forState:0];
        _ruleButton.titleLabel.font = DPFont5;
        
        DPWeakSelf;
        [_ruleButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(334);
            }
        }];
    }
    return _ruleButton;
}

- (UILabel *)lineLabel3 {
    if (!_lineLabel3) {
        _lineLabel3 = [UILabel newAutoLayoutView];
        _lineLabel3.backgroundColor = DPLightGrayColor;
    }
    return _lineLabel3;
}

- (UIButton *)questionButton {
    if (!_questionButton) {
        _questionButton = [UIButton newAutoLayoutView];
        [_questionButton setTitle:@"订单疑问  " forState:0];
        [_questionButton setTitleColor:DPBlueColor forState:0];
        _questionButton.titleLabel.font = DPFont5;
        [_questionButton swapImage];
        [_questionButton setImage:[UIImage imageNamed:@"order_question"] forState:0];
        
        DPWeakSelf;
        [_questionButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(335);
            }
        }];
    }
    return _questionButton;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
