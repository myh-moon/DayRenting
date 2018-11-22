//
//  MyOrderInvoiceHistoryCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceHistoryCell.h"

@implementation MyOrderInvoiceHistoryCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100+10;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.backWhiteView];
    [self.backWhiteView addSubview:self.timeButton];
    [self.backWhiteView addSubview:self.statusButton];
    [self.backWhiteView addSubview:self.typeLabel];
    [self.backWhiteView addSubview:self.moneyLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.backWhiteView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPSmallSpacing, DPMiddleSpacing, 0, DPMiddleSpacing)];
    
    [self.timeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.timeButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPBigSpacing];
    
    [self.statusButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.statusButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.timeButton];
    
    [self.typeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.timeButton];
    [self.typeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.timeButton withOffset:25];
    
    [self.moneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.typeLabel];
    [self.moneyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.statusButton];
}

- (UIView *)backWhiteView {
    if (!_backWhiteView) {
        _backWhiteView = [UIView newAutoLayoutView];
        _backWhiteView.backgroundColor = DPWhiteColor;
        _backWhiteView.layer.cornerRadius = 6;
        
        _backWhiteView.layer.shadowColor = DPBlackColor.CGColor;
        _backWhiteView.layer.shadowOffset = CGSizeMake(0, 0);
        _backWhiteView.layer.shadowRadius = 5;
        _backWhiteView.layer.shadowOpacity = 0.08;
    }
    return _backWhiteView;
}

- (UIButton *)timeButton {
    if (!_timeButton) {
        _timeButton = [UIButton newAutoLayoutView];
        [_timeButton setTitleColor:DPDarkGrayColor forState:0];
        _timeButton.titleLabel.font = DPFont3;
        _timeButton.userInteractionEnabled = NO;
        
        [_timeButton setImage:[UIImage imageNamed:@"car_time"] forState:0];
    }
    return _timeButton;
}

- (UIButton *)statusButton {
    if (!_statusButton) {
        _statusButton = [UIButton newAutoLayoutView];
        [_statusButton setTitleColor:DPLightGrayColor forState:0];
        _statusButton.titleLabel.font = DPFont3;
        _statusButton.userInteractionEnabled = NO;
        
        [_statusButton swapImage];
        [_statusButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    return _statusButton;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.textColor = DPGrayColor;
        _typeLabel.font = DPFont4;
    }
    return _typeLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
    }
    return _moneyLabel;
}


- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.timeButton setTitle:self.item.time forState:0];
    
    [self.statusButton setTitle:self.item.type forState:0];
    
    self.typeLabel.text = self.item.pcontent;
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:self.item.money firstFont:DPFont20 firstColor:DPBlackColor secondString:@"元" secondFont:DPFont4 secondColor:DPGrayColor];
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
