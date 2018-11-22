//
//  MyCardMessageCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardMessageCell.h"

@implementation MyCardMessageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 140;
}

- (void)cellDidLoad {
    [super  cellDidLoad];
    
    self.backgroundColor = DPBackGroundColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.bankImageView];
    [self.backView addSubview:self.bankNameLabel];
    [self.backView addSubview:self.bankNumberLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing)];
    
    [self.bankImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    [self.bankImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    
    [self.bankNameLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.bankImageView];
    [self.bankNameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.bankImageView withOffset:DPMiddleSpacing];
    
    [self.bankNumberLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.bankNameLabel];
    [self.bankNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.bankNameLabel withOffset:DPMiddleSpacing];
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView newAutoLayoutView];
        _backView.layer.cornerRadius = 6;
        _backView.layer.masksToBounds = YES;
        _backView.backgroundColor = DPWhiteColor;
        
        _backView.layer.borderColor = DPLineColor2.CGColor;
        _backView.layer.borderWidth = 0.5;
    }
    return _backView;
}

- (UIImageView *)bankImageView {
    if (!_bankImageView) {
        _bankImageView = [UIImageView newAutoLayoutView];
        [_bankImageView setImage:[UIImage imageNamed:@"right_arrow"]];
    }
    return _bankImageView;
}

- (UILabel *)bankNameLabel {
    if (!_bankNameLabel) {
        _bankNameLabel = [UILabel newAutoLayoutView];
        _bankNameLabel.numberOfLines = 0;
    }
    return _bankNameLabel;
}

- (UILabel *)bankNumberLabel {
    if (!_bankNumberLabel) {
        _bankNumberLabel = [UILabel newAutoLayoutView];
        _bankNumberLabel.text = @"添加信用卡";
        _bankNumberLabel.textColor = DPDarkGrayColor;
        _bankNumberLabel.font = DPFont8;
    }
    return _bankNumberLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.bankImageView setImage:[UIImage imageNamed:@"right_arrow"]];
    
    self.bankNameLabel.attributedText = [NSString setAttributeOfFirstString:self.item.bankNameString firstFont:DPFont5 firstColor:DPDarkGrayColor secondString:@"\n信用卡" secondFont:DPFont2 secondColor:DPDarkGrayColor align:0 space:8];
    
    self.bankNumberLabel.text = self.item.bankNumberString;
//    @"····      ····      ····      ···      5197";
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
