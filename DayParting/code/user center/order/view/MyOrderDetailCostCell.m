//
//  MyOrderDetailCostCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailCostCell.h"

@implementation MyOrderDetailCostCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.titleDetaiLabel];
    [self.contentView addSubview:self.contentLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.titleDetaiLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    [self.titleDetaiLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:DPMiddleSpacing];
    
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.contentLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont4;
    }
    return _titleLabel;
}

- (UILabel *)titleDetaiLabel {
    if (!_titleDetaiLabel) {
        _titleDetaiLabel = [UILabel newAutoLayoutView];
        _titleDetaiLabel.numberOfLines = 0;
    }
    return _titleDetaiLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.textColor = DPDarkGrayColor;
        _contentLabel.font = DPFont4;
    }
    return _contentLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    self.contentLabel.text = self.item.contentString;
    
    if ([self.item.titleString containsString:@"时长费"]) {
        
        NSString *sdsd = [NSString stringWithFormat:@"日间时长费：%@/分钟\n",self.item.moneyString1];
        NSString *swsw = [NSString stringWithFormat:@"夜间时长费：%@/分钟\n",self.item.moneyString2];

        self.titleDetaiLabel.attributedText = [NSString setAttributeOfFirstString:sdsd firstFont:DPFont2 firstColor:DPLightGrayColor secondString:swsw secondFont:DPFont2 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    }else{
        NSString *sdsd = [NSString stringWithFormat:@"%@元/公里",self.item.moneyString1];
        self.titleDetaiLabel.attributedText = [NSString setAttributeOfFirstString:sdsd firstFont:DPFont2 firstColor:DPLightGrayColor secondString:@"" secondFont:DPFont2 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    }
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
