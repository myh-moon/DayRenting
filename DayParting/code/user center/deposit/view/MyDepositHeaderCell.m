//
//  MyDepositHeaderCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositHeaderCell.h"

@implementation MyDepositHeaderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return 280;
    return 199*(DPWindowWidth-DPMiddleSpacing*2)/352 + 20;
    
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.depositBackImageView];
    [self.depositBackImageView addSubview:self.depositLabel];
    [self.depositBackImageView addSubview:self.depositMoneyLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.depositBackImageView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.depositBackImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.depositLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.depositLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];

    [self.depositMoneyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.depositMoneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.depositLabel];
}

- (UIButton *)depositBackImageView {
    if (!_depositBackImageView) {
        _depositBackImageView = [UIButton newAutoLayoutView];
        [_depositBackImageView setBackgroundImage:[UIImage imageNamed:@"recharge_card"] forState:0];
    }
    return _depositBackImageView;
}

- (UILabel *)depositLabel {
    if (!_depositLabel) {
        _depositLabel = [UILabel newAutoLayoutView];
        _depositLabel.text = @"我的押金";
        _depositLabel.textColor = DPWhiteColor;
        _depositLabel.font = DPFont4;
    }
    return _depositLabel;
}

- (UILabel *)depositMoneyLabel {
    if (!_depositMoneyLabel) {
        _depositMoneyLabel = [UILabel newAutoLayoutView];
    }
    return _depositMoneyLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.depositMoneyLabel.attributedText = [NSString setAttributeOfFirstString:self.item.depositMoneyString firstFont:DPFont6 firstColor:DPWhiteColor secondString:@" 元" secondFont:DPFont4 secondColor:DPWhiteColor];
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
