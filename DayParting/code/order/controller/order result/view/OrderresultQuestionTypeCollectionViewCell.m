//
//  OrderresultQuestionTypeCollectionViewCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/10.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "OrderresultQuestionTypeCollectionViewCell.h"

@implementation OrderresultQuestionTypeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self.contentView addSubview:self.typeLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.typeLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.textColor = DPLightGrayColor;
        _typeLabel.font = DPFont4;
        
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        _typeLabel.layer.borderWidth = 0.5;
        _typeLabel.layer.borderColor = DPLightGrayColor21.CGColor;
        _typeLabel.layer.cornerRadius = 6;
    }
    return _typeLabel;
}

@end
