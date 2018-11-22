//
//  MyScoreListCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyScoreListCell.h"

@implementation MyScoreListCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = UIEdgeInsetsZero;

    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.scoreLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.scoreLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.scoreLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [UILabel newAutoLayoutView];
        _scoreLabel.font = DPFont6;
    }
    return _scoreLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.attributedText = [NSString setAttributeOfFirstString:self.item.titleString firstFont:DPFont6 firstColor:DPDarkGrayColor secondString:self.item.timeString secondFont:DPFont3 secondColor:DPLightGrayColor align:0 space:8];
    
    // +  DPBlueColor  - DPOrangeColor1
    
    self.scoreLabel.text = self.item.scoreString;
    if ([[self.item.scoreString substringToIndex:1] isEqualToString:@"+"]) {
        self.scoreLabel.textColor = DPBlueColor;
    }else{
        self.scoreLabel.textColor = DPOrangeColor1;
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
