//
//  MyBreakDeailTextCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakDeailTextCell.h"

@implementation MyBreakDeailTextCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentLabel];
    
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:90];
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.contentLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont4;
    }
    return _titleLabel;
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
    
    if ([self.item.showSeperate isEqualToString:@"0"]) {
        self.separatorInset = DPSeperateInsert;
    }else{
        self.separatorInset = DPSeperateInsert2;
    }
    self.titleLabel.text = self.item.titleString;
    
    if ([self.item.titleString isEqualToString:@"罚款金额"] || [self.item.titleString isEqualToString:@"滞纳金"]) {
        self.contentLabel.attributedText = [NSString setAttributeOfFirstString:self.item.contentString firstFont:DPFont4 firstColor:DPBlueColor secondString:@" 元" secondFont:DPFont4 secondColor:DPDarkGrayColor];
    }else{
        self.contentLabel.attributedText = [NSString setAttributeOfFirstString:self.item.contentString firstFont:DPFont4 firstColor:DPDarkGrayColor secondString:@"" secondFont:DPFont4 secondColor:DPDarkGrayColor];
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
