//
//  EditHeadCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "EditHeadCell.h"

@implementation EditHeadCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 88;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.headerLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.headerImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.headerImageView autoSetDimensionsToSize:CGSizeMake(50, 50)];
    [self.headerImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.headerLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImageView withOffset:26];
    [self.headerLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.headerImageView];
}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [UIImageView newAutoLayoutView];
        _headerImageView.layer.cornerRadius = 25;
        _headerImageView.layer.masksToBounds = YES;
        _headerImageView.backgroundColor = DPRedColor;
    }
    return _headerImageView;
}

- (UILabel *)headerLabel {
    if (!_headerLabel) {
        _headerLabel = [UILabel newAutoLayoutView];
        _headerLabel.text = @"更换头像";
        _headerLabel.textColor = DPLightGrayColor;
        _headerLabel.font = DPFont4;
    }
    return _headerLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    
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
