//
//  MianOrderRemindReturnView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MianOrderRemindReturnView.h"

@implementation MianOrderRemindReturnView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.titleButton];
        [self addSubview:self.changeButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.titleButton autoPinEdgeToSuperviewEdge:ALEdgeLeft  withInset:DPMiddleSpacing];
    [self.titleButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.changeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.changeButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleButton];
}

- (UIButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [UIButton newAutoLayoutView];
        [_titleButton setImage:[UIImage imageNamed:@"car_return"] forState:0];
    }
    return _titleButton;
}

- (UIButton *)changeButton {
    if (!_changeButton) {
        _changeButton = [UIButton newAutoLayoutView];
        [_changeButton setTitle:@"更改还车点" forState:0];
        [_changeButton setTitleColor:DPBlueColor forState:0];
        _changeButton.titleLabel.font = DPFont3;
        
        DPWeakSelf;
        [_changeButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(57);
            }
        }];
    }
    return _changeButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
