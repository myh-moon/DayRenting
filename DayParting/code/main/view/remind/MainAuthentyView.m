//
//  MainAuthentyView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainAuthentyView.h"

@implementation MainAuthentyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.remindButton];
        [self addSubview:self.authentyButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        [self.remindButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.remindButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.authentyButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.authentyButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.remindButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)remindButton {
    if (!_remindButton) {
        _remindButton = [UIButton newAutoLayoutView];
        [_remindButton setTitle:@"  您尚未完成身份认证，暂无法租车" forState:0];
        [_remindButton setTitleColor:DPDarkGrayColor forState:0];
        _remindButton.titleLabel.font = DPFont3;
        [_remindButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    return _remindButton;
}

- (UIButton *)authentyButton {
    if (!_authentyButton) {
        _authentyButton = [UIButton newAutoLayoutView];
        [_authentyButton setTitle:@"去认证" forState:0];
        [_authentyButton setTitleColor:DPBlueColor forState:0];
        _authentyButton.titleLabel.font = DPFont3;
        
        DPWeakSelf;
        [_authentyButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(24);
            }
        }];
    }
    return _authentyButton;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
