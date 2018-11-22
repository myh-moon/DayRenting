//
//  MineUserScoreCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserScoreCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation MineUserScoreCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 108;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.scoreBackImageView];
    [self.scoreBackImageView addSubview:self.scoreTitleButton];
    [self.scoreBackImageView addSubview:self.scoreButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.scoreBackImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(3, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing)];
    
    [self.scoreTitleButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeRight];
    [self.scoreTitleButton autoSetDimension:ALDimensionWidth toSize:(DPWindowWidth-DPMiddleSpacing*2-100)];

    [self.scoreButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.scoreTitleButton];
    [self.scoreButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.scoreButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.scoreTitleButton];
    [self.scoreButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.scoreTitleButton];
    
}

- (UIImageView *)scoreBackImageView {
    if (!_scoreBackImageView) {
        _scoreBackImageView = [UIImageView newAutoLayoutView];
        _scoreBackImageView.image = [UIImage imageNamed:@"ticket_full"];
        
        _scoreBackImageView.layer.shadowOffset = CGSizeMake(0, 0);
        _scoreBackImageView.layer.shadowOpacity = 0.08;
        _scoreBackImageView.layer.shadowColor = DPBlackColor.CGColor;
        _scoreBackImageView.layer.shadowRadius = 5;
    }
    return _scoreBackImageView;
}

- (UIButton *)scoreTitleButton {
    if (!_scoreTitleButton) {
        _scoreTitleButton = [UIButton newAutoLayoutView];
        _scoreTitleButton.titleLabel.numberOfLines = 0;
        _scoreTitleButton.userInteractionEnabled = NO;
        _scoreTitleButton.contentHorizontalAlignment = 1;
        _scoreTitleButton.contentEdgeInsets = UIEdgeInsetsMake(0, DPBigSpacing, 0, 0);
    }
    return _scoreTitleButton;
}

- (UIButton *)scoreButton {
    if (!_scoreButton) {
        _scoreButton = [UIButton newAutoLayoutView];
        _scoreButton.titleLabel.numberOfLines = 0;
        _scoreButton.userInteractionEnabled = NO;
    }
    return _scoreButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSMutableAttributedString *titleScore = [NSString setAttributeOfFirstString:self.item.money firstFont:DPFont7 firstColor:DPBlueColor secondString:self.item.info secondFont:DPFont2 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    [self.scoreTitleButton setAttributedTitle:titleScore forState:0];
    
    NSMutableAttributedString *score = [NSString setAttributeOfFirstString:self.item.score firstFont:[UIFont fontWithName:@"PingFangSC-Medium" size:20] firstColor:DPWhiteColor secondString:@"积分可兑" secondFont:DPFont3 secondColor:DPWhiteColor align:1 space:4];
    [self.scoreButton setAttributedTitle:score forState:0];
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
