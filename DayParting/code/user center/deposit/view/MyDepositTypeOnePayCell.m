//
//  MyDepositTypeOnePayCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositTypeOnePayCell.h"

@implementation MyDepositTypeOnePayCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = UIEdgeInsetsZero;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.payLabel];
    [self.contentView addSubview:self.wePayButton];
    [self.contentView addSubview:self.wePaySelecteButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.payLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.payLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.wePayButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.payLabel];
    [self.wePayButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.payLabel withOffset:DPBigSpacing];
    
    [self.wePaySelecteButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.wePaySelecteButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.wePayButton];
}

- (UILabel *)payLabel {
    if (!_payLabel) {
        _payLabel = [UILabel newAutoLayoutView];
        _payLabel.text = @"选择支付方式";
        _payLabel.textColor = DPLightGrayColor;
        _payLabel.font = DPFont4;
    }
    return _payLabel;
}

- (UIButton *)wePayButton {
    if (!_wePayButton) {
        _wePayButton = [UIButton newAutoLayoutView];
        [_wePayButton setTitle:@"  微信支付" forState:0];
        [_wePayButton setTitleColor:DPDarkGrayColor forState:0];
        _wePayButton.titleLabel.font = DPFont4;
        [_wePayButton setImage:[UIImage imageNamed:@"wechat_big"] forState:0];
    }
    return _wePayButton;
}

- (UIButton *)wePaySelecteButton {
    if (!_wePaySelecteButton) {
        _wePaySelecteButton = [UIButton newAutoLayoutView];
        [_wePaySelecteButton setImage:[UIImage imageNamed:@"invoice_selecteds"] forState:0];
    }
    return _wePaySelecteButton;
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
