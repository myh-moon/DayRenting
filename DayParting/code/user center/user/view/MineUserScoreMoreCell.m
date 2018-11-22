//
//  MineUserScoreMoreCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/24.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MineUserScoreMoreCell.h"

@implementation MineUserScoreMoreCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.moreButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.moreButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.moreButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton newAutoLayoutView];
        [_moreButton setTitle:@"更多兑换，敬请期待" forState:0];
        [_moreButton setTitleColor:DPLightGrayColor17 forState:0];
        _moreButton.titleLabel.font = DPFont3;
    }
    return _moreButton;
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
