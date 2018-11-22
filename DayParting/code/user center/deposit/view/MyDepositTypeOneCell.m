//
//  MyDepositTypeOneCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositTypeOneCell.h"

@implementation MyDepositTypeOneCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 75;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.typeButton];
    [self.typeButton addSubview:self.ssLabel];
    [self.typeButton addSubview:self.aaButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.typeButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 30, DPMiddleSpacing, 30)];
    
    [self.ssLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.ssLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPSmallSpacing];
    
    [self.aaButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.ssLabel];
    [self.aaButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.ssLabel withOffset:4];
}

- (UIButton *)typeButton {
    if (!_typeButton) {
        _typeButton = [UIButton newAutoLayoutView];
        _typeButton.layer.borderColor = DPBlueColor.CGColor;
        _typeButton.layer.borderWidth = 1;
        _typeButton.layer.cornerRadius = 6;
        _typeButton.layer.masksToBounds = YES;
    }
    return _typeButton;
}

- (UILabel *)ssLabel {
    if (!_ssLabel) {
        _ssLabel = [UILabel newAutoLayoutView];
        _ssLabel.text = @"2000元档";
        _ssLabel.textColor = DPDarkGrayColor;
        _ssLabel.font = DPFont7;
    }
    return _ssLabel;
}

- (UIButton *)aaButton {
    if (!_aaButton) {
        _aaButton = [UIButton newAutoLayoutView];
        [_aaButton setTitle:@"全平台车型可用  " forState:0];
        [_aaButton setTitleColor:DPLightGrayColor forState:0];
        _aaButton.titleLabel.font = DPFont3;
        
        [_aaButton swapImage];
        [_aaButton setImage:[UIImage imageNamed:@"detail_remind"] forState:0];
    }
    return _aaButton;
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
