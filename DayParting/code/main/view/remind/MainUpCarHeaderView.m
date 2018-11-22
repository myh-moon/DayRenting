//
//  MainUpCarHeaderView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarHeaderView.h"

@implementation MainUpCarHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0x1a273c);

        [self addSubview:self.serviceLabel];
        [self addSubview:self.navigationButton];
        [self addSubview:self.distanceButton];
        [self addSubview:self.lineLabel];
        [self addSubview:self.availableLabel1];
        [self addSubview:self.availableLabel2];
        [self addSubview:self.availableLabel3];
        [self addSubview:self.verticalLabel1];
        [self addSubview:self.verticalLabel2];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.serviceLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:17];
        [self.serviceLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];

        [self.navigationButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.serviceLabel withOffset:-6];
        [self.navigationButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.distanceButton];

        [self.distanceButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.distanceButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.navigationButton];

        [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.serviceLabel];
        [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.serviceLabel withOffset:17];
        [self.lineLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.distanceButton];
        [self.lineLabel autoSetDimension:ALDimensionHeight toSize:DPLineHeight];

        NSArray *views = @[self.availableLabel1,self.availableLabel2,self.availableLabel3];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel withOffset:14];

        [self.availableLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel];

        [self.availableLabel2 autoAlignAxisToSuperviewAxis:ALAxisVertical];

        [self.availableLabel3 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel];

        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel newAutoLayoutView];
        _serviceLabel.numberOfLines = 0;
        _serviceLabel.attributedText = [NSString setAttributeOfFirstString:@"东海SOHO · 服务点\n" firstFont:DPFont6 firstColor:DPWhiteColor secondString:@"上海市静安区铜仁路299号 " secondFont:DPFont3 secondColor:DPLightGrayColor1 align:0 space:4];
    }
    return _serviceLabel;
}

- (UIButton *)navigationButton {
    if (!_navigationButton) {
        _navigationButton = [UIButton newAutoLayoutView];
        [_navigationButton setImage:[UIImage imageNamed:@"route_navi"] forState:0];
    }
    return _navigationButton;
}

- (UIButton *)distanceButton {
    if (!_distanceButton) {
        _distanceButton = [UIButton newAutoLayoutView];
        
//        [_distanceButton setTitle:@"170m" forState:0];
        [_distanceButton setTitleColor:DPBlueColor forState:0];
        _distanceButton.titleLabel.font = DPFont3;
    }
    return _distanceButton;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLineColor1;
    }
    return _lineLabel;
}

- (UILabel *)availableLabel1 {
    if (!_availableLabel1) {
        _availableLabel1 = [UILabel newAutoLayoutView];
        _availableLabel1.attributedText = [NSString setAttributeOfFirstString:@"2  " firstFont:DPFont6 firstColor:DPLightGrayColor1 secondString:@"辆车可用" secondFont:DPFont1 secondColor:DPLightGrayColor2];
    }
    return _availableLabel1;
}

- (UILabel *)availableLabel2 {
    if (!_availableLabel2) {
        _availableLabel2 = [UILabel newAutoLayoutView];
        _availableLabel2.attributedText = [NSString setAttributeOfFirstString:@"8  " firstFont:DPFont6 firstColor:DPLightGrayColor1 secondString:@"个停车位" secondFont:DPFont1 secondColor:DPLightGrayColor2];
    }
    return _availableLabel2;
}

- (UILabel *)availableLabel3 {
    if (!_availableLabel3) {
        _availableLabel3 = [UILabel newAutoLayoutView];
        _availableLabel3.attributedText = [NSString setAttributeOfFirstString:@"24" firstFont:DPFont6 firstColor:DPLightGrayColor1 secondString:@"小时" secondFont:DPFont1 secondColor:DPLightGrayColor1 thirdString:@"  营业网点" thirdFont:DPFont1 thirdColor:DPLightGrayColor2];
    }
    return _availableLabel3;
}

- (UILabel *)verticalLabel1 {
    if (!_verticalLabel1) {
        _verticalLabel1 = [UILabel newAutoLayoutView];
        _verticalLabel1.backgroundColor = DPLightGrayColor3;
    }
    return _verticalLabel1;
}

- (UILabel *)verticalLabel2 {
    if (!_verticalLabel2) {
        _verticalLabel2 = [UILabel newAutoLayoutView];
        _verticalLabel2.backgroundColor = DPLightGrayColor3;
    }
    return _verticalLabel2;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
