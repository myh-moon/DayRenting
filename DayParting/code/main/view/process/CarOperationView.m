//
//  CarOperationView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarOperationView.h"

@implementation CarOperationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.leftActButton];
        [self addSubview:self.rightActButton];
        [self addSubview:self.lineLabel];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    NSArray *views = @[self.leftActButton,self.rightActButton];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:(DPWindowWidth-DPMiddleSpacing*2)/2];
    [views autoMatchViewsDimension:ALDimensionHeight];
    
    [self.leftActButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
//    [self.leftActButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.leftActButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    
    [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.leftActButton];
    [self.lineLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.leftActButton];
    [self.lineLabel autoSetDimensionsToSize:CGSizeMake(1, 24)];
}

- (UIButton *)leftActButton {
    if (!_leftActButton) {
        _leftActButton = [UIButton newAutoLayoutView];
        [_leftActButton setTitle:@"  解锁车辆" forState:0];
        [_leftActButton setTitleColor:DPLightGrayColor forState:0];
        _leftActButton.titleLabel.font = DPFont5;
        [_leftActButton setImage:[UIImage imageNamed:@"unlock_gray"] forState:0];
        
        DPWeakSelf;
        [_leftActButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(67);
            }
        }];
    }
    return _leftActButton;
}

- (UIButton *)rightActButton {
    if (!_rightActButton) {
        _rightActButton = [UIButton newAutoLayoutView];
        [_rightActButton setTitle:@"  临时锁车" forState:0];
        [_rightActButton setTitleColor:DPBlueColor forState:0];
        _rightActButton.titleLabel.font = DPFont5;
        [_rightActButton setImage:[UIImage imageNamed:@"lock_blue"] forState:0];
        
        DPWeakSelf;
        [_rightActButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(68);
            }
        }];
    }
    return _rightActButton;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLightGrayColor8;
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
