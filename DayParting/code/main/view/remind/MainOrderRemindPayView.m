//
//  MainOrderRemindPayView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainOrderRemindPayView.h"

@implementation MainOrderRemindPayView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        
        self.layer.shadowColor = DPBlackColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 5);
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.08;
        
        [self addSubview:self.titleButton];
//        [self addSubview:self.changeButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    [self.titleButton autoPinEdgeToSuperviewEdge:ALEdgeLeft  withInset:DPMiddleSpacing];
    [self.titleButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
//    [self.changeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
//    [self.changeButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleButton];
}

- (UIButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [UIButton newAutoLayoutView];
        [_titleButton setImage:[UIImage imageNamed:@"car_return"] forState:0];
        [_titleButton setTitle:@"  已成功还车，感谢您的使用～" forState:0];
        [_titleButton setTitleColor:DPDarkGrayColor forState:0];
        _titleButton.titleLabel.font = DPFont3;

    }
    return _titleButton;
}

//- (UIButton *)changeButton {
//    if (!_changeButton) {
//        _changeButton = [UIButton newAutoLayoutView];
//        [_changeButton setTitle:@"继续支付" forState:0];
//        [_changeButton setTitleColor:DPBlueColor forState:0];
//        _changeButton.titleLabel.font = DPFont3;
//
//        DPWeakSelf;
//        [_changeButton addAction:^(UIButton *btn) {
//            if (weakself.didSelectedBtn) {
//                weakself.didSelectedBtn(57);
//            }
//        }];
//    }
//    return _changeButton;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
