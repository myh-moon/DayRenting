//
//  CarServiceView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarServiceView.h"

@implementation CarServiceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.blueLabel];
        [self addSubview:self.serviceLabel];
        [self addSubview:self.addressLabel];

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
    
}

- (UILabel *)blueLabel {
    if (!_blueLabel) {
        _blueLabel = [UILabel newAutoLayoutView];
        _blueLabel.text = @"  取车点  ";
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
        _serviceLabel.text = @"东海SOHO · 服务点";
        _serviceLabel.textColor = DPDarkGrayColor;
        _serviceLabel.font = DPFont6;
    }
    return _serviceLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel newAutoLayoutView];
        _addressLabel.text = @"上海市静安区铜仁路299号 ";
        _addressLabel.textColor = DPDarkGrayColor;
        _addressLabel.font = DPFont3;
    }
    return _addressLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
