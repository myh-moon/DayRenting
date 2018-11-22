
//
//  MyWalletRechargeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletRechargeCell.h"

@implementation MyWalletRechargeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyTextField];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    
    [self.moneyTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    [self.moneyTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:DPBigSpacing];
    [self.moneyTextField autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [self.moneyTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"输入充值金额（元）";
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont3;
    }
    return _titleLabel;
}

//- (UILabel *)moneyLabel {
//    if (!_moneyLabel) {
//        _moneyLabel = [UILabel newAutoLayoutView];
//        _moneyLabel.textColor = DPBlueColor;
//        _moneyLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:25];
//    }
//    return _moneyLabel;
//}

- (UITextField *)moneyTextField {
    if (!_moneyTextField) {
        _moneyTextField = [UITextField newAutoLayoutView];
        _moneyTextField.textColor = DPBlueColor;
        _moneyTextField.font =  [UIFont fontWithName:@"PingFangSC-Medium" size:25];
        _moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
        
        DPWeakSelf;
        [_moneyTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditting) {
                weakself.item.didEditting(text);
            }
        }];
    }
    return _moneyTextField;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [[RACObserve(self.item, money) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *money) {
        self.moneyTextField.text = money;
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
