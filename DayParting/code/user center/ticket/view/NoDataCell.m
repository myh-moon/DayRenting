//
//  NoDataCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/23.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "NoDataCell.h"

@implementation NoDataCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight-150;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.noDataImageView];
    [self.contentView addSubview:self.noDataButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.noDataImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:160];
    [self.noDataImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];

    [self.noDataButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.noDataImageView withOffset:DPBigSpacing];
    [self.noDataButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.noDataImageView];
}

- (UIImageView *)noDataImageView {
    if (!_noDataImageView) {
        _noDataImageView = [UIImageView newAutoLayoutView];
    }
    return _noDataImageView;
}

- (UIButton *)noDataButton {
    if (!_noDataButton) {
        _noDataButton = [UIButton newAutoLayoutView];
        [_noDataButton setTitleColor:DPLightGrayColor forState:0];
        _noDataButton.titleLabel.font = DPFont5;
    }
    return _noDataButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.noDataButton setTitle:self.item.buttonString forState:0];
    [self.noDataImageView setImage:[UIImage imageNamed:self.item.imageString]];
    
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
