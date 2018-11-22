//
//  MineUserCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserCell.h"

@implementation MineUserCell

//+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return 60;
//}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.leftImageView];
    [self.contentView addSubview:self.scoreLabel];
    [self.contentView addSubview:self.rightImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    NSArray *views = @[self.leftImageView,self.scoreLabel,self.rightImageView];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:DPBigSpacing insetSpacing:YES];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [[views lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    
//    [self.scoreLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
//    [self.scoreLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [UIImageView newAutoLayoutView];
        [_leftImageView setImage:[UIImage imageNamed:@"authenty_left"]];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [UIImageView newAutoLayoutView];
        [_rightImageView setImage:[UIImage imageNamed:@"authenty_right"]];
    }
    return _rightImageView;
}

- (UILabel *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [UILabel newAutoLayoutView];
        _scoreLabel.textColor = DPLightGrayColor18;
        _scoreLabel.font = DPFont6;
        _scoreLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _scoreLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    self.backgroundColor = self.item.backColor;
    
    self.scoreLabel.text = self.item.titleString;
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
