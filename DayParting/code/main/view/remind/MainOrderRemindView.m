//
//  MainOrderRemindView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainOrderRemindView.h"

@implementation MainOrderRemindView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
//        [self addSubview:self.cycleProgressView];
//        [self addSubview:self.countdownButton];
        [self addSubview:self.circleProgressView];
        [self addSubview:self.remindLabel];
        [self addSubview:self.actButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {

        NSArray *views = @[self.circleProgressView,self.remindLabel,self.actButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.circleProgressView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPSmallSpacing, DPMiddleSpacing, DPSmallSpacing, 0) excludingEdge:ALEdgeRight];
        [self.circleProgressView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.circleProgressView];

        [self.remindLabel autoPinEdge:ALEdgeLeft  toEdge:ALEdgeRight ofView:self.circleProgressView withOffset:DPSmallSpacing];
        
        [self.actButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (ZXYCircleProgress *)circleProgressView {
    if (!_circleProgressView) {
        _circleProgressView.translatesAutoresizingMaskIntoConstraints = NO;
        _circleProgressView = [[ZXYCircleProgress alloc] initWithFrame:CGRectMake(0, 0, 50, 50) progress:0.0];
        _circleProgressView.topColor = UIColorFromRGB(0xe7f4ff);
        _circleProgressView.bottomColor = DPBlueColor;
        _circleProgressView.progressWidth = 4;
        
        _circleProgressView.progressLabel.font = DPFont4;
        _circleProgressView.progressLabel.textColor = DPBlueColor;
    }
    return _circleProgressView;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
    }
    return _remindLabel;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        [_actButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        _actButton.userInteractionEnabled = NO;
    }
    return _actButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
