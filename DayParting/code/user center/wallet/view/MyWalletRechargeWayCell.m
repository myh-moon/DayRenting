//
//  MyWalletRechargeWayCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletRechargeWayCell.h"

@implementation MyWalletRechargeWayCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.wayButton];
    [self.contentView addSubview:self.wayImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    
    [self.wayButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    [self.wayButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:30];
    
    [self.wayImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.wayButton];
    [self.wayImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"选择支付方式";
        _titleLabel.textColor = DPLightGrayColor;
        _titleLabel.font = DPFont3;
    }
    return _titleLabel;
}

- (UIButton *)wayButton {
    if (!_wayButton) {
        _wayButton = [UIButton newAutoLayoutView];
        [_wayButton setImage:[UIImage imageNamed:@"wechat_big"] forState:0];
        
        [_wayButton setTitle:@"  微信支付" forState:0];
        [_wayButton setTitleColor:DPDarkGrayColor forState:0];
        _wayButton.titleLabel.font = DPFont5;
    }
    return _wayButton;
}

- (UIImageView *)wayImageView {
    if (!_wayImageView) {
        _wayImageView = [UIImageView newAutoLayoutView];
        [_wayImageView setImage:[UIImage imageNamed:@"invoice_selecteds"]];
    }
    return _wayImageView;
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
