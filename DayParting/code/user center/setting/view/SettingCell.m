//
//  SettingCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];

    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.actButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.actButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.actButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont5;
    }
    return _titleLabel;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        [_actButton setTitleColor:DPLightGrayColor forState:0];
        _actButton.titleLabel.font = DPFont5;
        _actButton.userInteractionEnabled = NO;
        
        [_actButton swapImage];
    }
    return _actButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    [self.actButton setTitle:self.item.actString forState:0];
    
    if ([self.item.ssss isEqualToString:@"1"]) {
        [self.actButton setImage:[UIImage imageNamed:@"s"] forState:0];
    }else{
        [self.actButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    
    if ([self.item.showSeperate isEqualToString:@"3"]) {
        self.separatorInset = DPSeperateInsert;
    }else{
        self.separatorInset = DPSeperateInsert2;
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
