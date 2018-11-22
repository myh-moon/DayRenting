//
//  CarStatusView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarStatusView.h"

@implementation CarStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
    
        self.backgroundColor = DPLightGrayColor12;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.wantCarLabel];
        [self addSubview:self.useCarLabel];
        [self addSubview:self.payLabel];
        
//        [self addSubview:self.statusSlider];
        
        [self addSubview:self.line1];
        [self addSubview:self.line2];
        [self addSubview:self.line3];
        [self addSubview:self.line4];
        
        [self addSubview:self.imagePoint1];
        [self addSubview:self.imagePoint2];
        [self addSubview:self.imagePoint3];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    
    NSArray *views = @[self.wantCarLabel,self.useCarLabel,self.payLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPSmallSpacing];
    
    [self.wantCarLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPBigSpacing];
    
    [self.useCarLabel autoSetDimension:ALDimensionWidth toSize:180];
    [self.useCarLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.payLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPBigSpacing];
    
    NSArray *views1 = @[self.imagePoint1,self.imagePoint2,self.imagePoint3];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.wantCarLabel withOffset:2];
//    [views1 autoSetViewsDimensionsToSize:CGSizeMake(28, 28)];
    
    [self.imagePoint1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.wantCarLabel];
    [self.imagePoint2 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.useCarLabel];
    [self.imagePoint3 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.payLabel];
    
    NSArray *views2 = @[self.line1,self.line2,self.line3,self.line4];
    [views2 autoSetViewsDimension:ALDimensionHeight toSize:3];
    [views2 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views2 firstObject] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.imagePoint1];

    [self.line1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.line1 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.imagePoint1 withOffset:14];

    [self.line2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.imagePoint1 withOffset:14];
    [self.line2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.imagePoint2 withOffset:14];

    [self.line3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.imagePoint2 withOffset:14];
    [self.line3 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.imagePoint3 withOffset:14];

    [self.line4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.imagePoint3 withOffset:14];
    [self.line4 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
}

- (UILabel *)wantCarLabel {
    if (!_wantCarLabel) {
        _wantCarLabel = [UILabel newAutoLayoutView];
        _wantCarLabel.text = @"取车";
        _wantCarLabel.textColor = DPWhiteColor;
        _wantCarLabel.font = DPFont6;
    }
    return _wantCarLabel;
}

- (UILabel *)useCarLabel {
    if (!_useCarLabel) {
        _useCarLabel = [UILabel newAutoLayoutView];
        _useCarLabel.text = @"用车";
        _useCarLabel.textColor = DPLightGrayColor10;
        _useCarLabel.font = DPFont3;
        _useCarLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _useCarLabel;
}

- (UILabel *)payLabel {
    if (!_payLabel) {
        _payLabel = [UILabel newAutoLayoutView];
        _payLabel.text = @"支付";
        _payLabel.textColor = DPLightGrayColor10;
        _payLabel.font = DPFont3;
    }
    return _payLabel;
}

- (UILabel *)line1 {
    if (!_line1) {
        _line1 = [UILabel newAutoLayoutView];
        _line1.backgroundColor = DPBlueColor;
    }
    return _line1;
}

- (UILabel *)line2 {
    if (!_line2) {
        _line2 = [UILabel newAutoLayoutView];
        _line2.backgroundColor = DPBlueColor;
    }
    return _line2;
}

- (UILabel *)line3 {
    if (!_line3) {
        _line3 = [UILabel newAutoLayoutView];
        _line3.backgroundColor = DPBlueColor;
    }
    return _line3;
}

- (UILabel *)line4 {
    if (!_line4) {
        _line4 = [UILabel newAutoLayoutView];
        _line4.backgroundColor = DPBlueColor;
    }
    return _line4;
}

- (UIImageView *)imagePoint1 {
    if (!_imagePoint1) {
        _imagePoint1 = [UIImageView newAutoLayoutView];
    }
    return _imagePoint1;
}

- (UIImageView *)imagePoint2 {
    if (!_imagePoint2) {
        _imagePoint2 = [UIImageView newAutoLayoutView];
    }
    return _imagePoint2;
}

- (UIImageView *)imagePoint3 {
    if (!_imagePoint3) {
        _imagePoint3 = [UIImageView newAutoLayoutView];
    }
    return _imagePoint3;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
