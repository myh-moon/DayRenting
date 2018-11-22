//
//  MyCapitalCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCapitalCell.h"

@implementation MyCapitalCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset  =UIEdgeInsetsZero;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {

    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.contentLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.attributedText = [NSString setAttributeOfFirstString:self.item.nameString firstFont:DPFont6 firstColor:DPDarkGrayColor secondString:self.item.timeString secondFont:DPFont3 secondColor:DPLightGrayColor align:0 space:8];
    
    self.contentLabel.attributedText = [NSString setAttributeOfFirstString:self.item.moneyString firstFont:DPFont6 firstColor:DPDarkGrayColor secondString:self.item.statusString secondFont:DPFont3 secondColor:DPLightGrayColor align:2 space:8];

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
