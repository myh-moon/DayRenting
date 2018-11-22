//
//  OrderResultMoreView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultMoreView.h"

@implementation OrderResultMoreView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.image = [UIImage imageNamed:@"more_back"];
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.cancelButton];
        [self addSubview:self.faultButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
        [self.cancelButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.faultButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.cancelButton];
        [self.faultButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cancelButton withOffset:DPBigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setTitle:@"  取消订单" forState:0];
        [_cancelButton setTitleColor:DPDarkGrayColor forState:0];
        _cancelButton.titleLabel.font = DPFont3;
        [_cancelButton setImage:[UIImage imageNamed:@"more_cancel"] forState:0];
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(@"取消订单");
            }
        }];
    }
    return _cancelButton;
}

- (UIButton *)faultButton {
    if (!_faultButton) {
        _faultButton = [UIButton newAutoLayoutView];
        [_faultButton setTitle:@"  车况上报" forState:0];
        [_faultButton setTitleColor:DPDarkGrayColor forState:0];
        _faultButton.titleLabel.font = DPFont3;
        [_faultButton setImage:[UIImage imageNamed:@"more_error"] forState:0];
        
        DPWeakSelf;
        [_faultButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(@"车况上报");
            }
        }];
    }
    return _faultButton;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
