//
//  MyWalletRechargeMoneyCollectionViewCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/20.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyWalletRechargeMoneyCollectionViewCell.h"

@implementation MyWalletRechargeMoneyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self.contentView addSubview:self.moneyLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.moneyLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.textColor = DPLightGrayColor;
        _moneyLabel.font = DPFont5;
        _moneyLabel.textAlignment = NSTextAlignmentCenter;
        
        _moneyLabel.layer.cornerRadius = 3;
        _moneyLabel.layer.masksToBounds = YES;
        _moneyLabel.layer.borderWidth = 0.5;
        _moneyLabel.layer.borderColor = DPLineColor2.CGColor;
    }
    return _moneyLabel;
}

@end
