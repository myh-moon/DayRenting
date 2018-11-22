//
//  PointRemindView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/24.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "PointRemindView.h"

@implementation PointRemindView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.freePointButton];
        [self addSubview:self.chargePointButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    
    NSArray *views = @[self.freePointButton,self.chargePointButton];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:DPMiddleSpacing insetSpacing:YES];
    [[views firstObject]  autoAlignViewsToAxis:ALAxisHorizontal];
}

- (UIButton *)freePointButton {
    if (!_freePointButton) {
        _freePointButton = [UIButton newAutoLayoutView];
        [_freePointButton setTitle:@"  免费网点" forState:0];
        [_freePointButton setTitleColor:DPGrayColor forState:0];
        _freePointButton.titleLabel.font = DPFont2;
        
        [_freePointButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    return _freePointButton;
}

- (UIButton *)chargePointButton {
    if (!_chargePointButton) {
        _chargePointButton = [UIButton newAutoLayoutView];
        [_chargePointButton setTitle:@"  收费网点" forState:0];
        [_chargePointButton setTitleColor:DPGrayColor forState:0];
        _chargePointButton.titleLabel.font = DPFont2;
        
        [_chargePointButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    return _chargePointButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
