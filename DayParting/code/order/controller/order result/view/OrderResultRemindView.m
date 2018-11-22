//
//  OrderResultRemindView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultRemindView.h"

@implementation OrderResultRemindView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.remindButton];
        [self addSubview:self.remindLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.remindButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
        [self.remindButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.remindLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.remindButton];
        [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:DPMiddleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}
- (UIButton *)remindButton {
    if (!_remindButton) {
        _remindButton = [UIButton newAutoLayoutView];
        [_remindButton setTitle:@"  恭喜，已为你预定车辆" forState:0];
        [_remindButton setTitleColor:DPBlueColor forState:0];
        _remindButton.titleLabel.font = DPFont5;
        [_remindButton setImage:[UIImage imageNamed:@"order_success"] forState:0];
    }
    return _remindButton;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
//        _remindLabel.attributedText = [NSString setAttributeOfFirstString:@"请在" firstFont:DPFont3 firstColor:DPLightGrayColor secondString:@"12:00" secondFont:DPFont3 secondColor:DPBlueColor thirdString:@"前完成开锁，否则订单将自动取消" thirdFont:DPFont3 thirdColor:DPLightGrayColor];
    }
    return _remindLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
