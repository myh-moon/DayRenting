//
//  CarReturnView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarReturnView.h"

@implementation CarReturnView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 12;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.blueLabel];
        [self addSubview:self.serviceLabel];
        [self addSubview:self.addressLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.availableLabel];
//        [self addSubview:self.occupyLabel];
        [self addSubview:self.businessLabel];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    
    [self.blueLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.blueLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    [self.blueLabel autoSetDimensionsToSize:CGSizeMake(50, 20)];
    
    [self.serviceLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.blueLabel];
    [self.serviceLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.blueLabel withOffset:DPSmallSpacing];
    
    [self.addressLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.blueLabel];
    [self.addressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueLabel withOffset:DPSmallSpacing];
    
    
    [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.addressLabel];
    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.addressLabel withOffset:DPMiddleSpacing];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:1];
    
//    NSArray *views = @[self.availableLabel,self.occupyLabel,self.businessLabel];
    NSArray *views = @[self.availableLabel,self.businessLabel];

    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel withOffset:DPMiddleSpacing];
    
    [self.availableLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel];
    
//    [self.occupyLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.businessLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel];
}

- (UILabel *)blueLabel {
    if (!_blueLabel) {
        _blueLabel = [UILabel newAutoLayoutView];
        _blueLabel.text = @"  还车点  ";
        _blueLabel.textColor = DPWhiteColor;
        _blueLabel.font = DPFont3;
        _blueLabel.backgroundColor = DPBlueColor;
        _blueLabel.layer.cornerRadius = 3;
        _blueLabel.layer.masksToBounds = YES;
    }
    return _blueLabel;
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel newAutoLayoutView];
        _serviceLabel.textColor = DPDarkGrayColor;
        _serviceLabel.font = DPFont6;
    }
    return _serviceLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel newAutoLayoutView];
        _addressLabel.textColor = DPDarkGrayColor;
        _addressLabel.font = DPFont3;
    }
    return _addressLabel;
}


- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLightGrayColor8;
    }
    return _lineLabel;
}

- (UILabel *)availableLabel {
    if (!_availableLabel) {
        _availableLabel = [UILabel newAutoLayoutView];
//        _availableLabel.attributedText = [NSString setAttributeOfFirstString:@"2" firstFont:DPFont6 firstColor:DPGrayColor secondString:@"/8" secondFont:DPFont1 secondColor:DPLightGrayColor thirdString:@" 停车位可用" thirdFont:DPFont1 thirdColor:DPLightGrayColor];
        
//        _availableLabel.attributedText = [NSString setAttributeOfFirstString:@"2" firstFont:DPFont6 firstColor:DPGrayColor secondString:@"/8" secondFont:DPFont1 secondColor:DPLightGrayColor thirdString:@" 停车位可用" thirdFont:DPFont1 thirdColor:DPLightGrayColor];
        _availableLabel.attributedText = [NSString setAttributeOfFirstString:@"有" firstFont:DPFont6 firstColor:DPDarkGrayColor secondString:@" 停车位可用" secondFont:DPFont1 secondColor:DPLightGrayColor];
    }
    return _availableLabel;
}

//- (UILabel *)occupyLabel {
//    if (!_occupyLabel) {
//        _occupyLabel = [UILabel newAutoLayoutView];
//        _occupyLabel.attributedText = [NSString setAttributeOfFirstString:@"2" firstFont:DPFont6 firstColor:DPGrayColor secondString:@" 已停车辆" secondFont:DPFont1 secondColor:DPLightGrayColor];
//    }
//    return _occupyLabel;
//}

- (UILabel *)businessLabel{
    if (!_businessLabel) {
        _businessLabel = [UILabel newAutoLayoutView];
        _businessLabel.attributedText = [NSString setAttributeOfFirstString:@"24" firstFont:DPFont6 firstColor:DPGrayColor secondString:@"小时" secondFont:DPFont1 secondColor:DPLightGrayColor thirdString:@" 营业点" thirdFont:DPFont1 thirdColor:DPLightGrayColor];
    }
    return _businessLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
