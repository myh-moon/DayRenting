//
//  MyWalletRechargeResultCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/17.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyWalletRechargeResultCell.h"

@implementation MyWalletRechargeResultCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight-64;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.remindImageView];
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.remindButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.remindImageView,self.remindLabel,self.remindButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:90];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindImageView withOffset:28];
    
    [self.remindButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:54];
    [self.remindButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.remindButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.remindButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
}

- (UIImageView *)remindImageView {
    if (!_remindImageView) {
        _remindImageView = [UIImageView newAutoLayoutView];
        [_remindImageView setImage:[UIImage imageNamed:@"license_success"]];
    }
    return _remindImageView;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.textColor = DPBlueColor;
        _remindLabel.font = DPFont6;
    }
    return _remindLabel;
}

- (UIButton *)remindButton {
    if (!_remindButton) {
        _remindButton = [UIButton newAutoLayoutView];
        [_remindButton setTitle:@"确定" forState:0];
        [_remindButton setTitleColor:DPWhiteColor forState:0];
        _remindButton.titleLabel.font = DPFont6;
        _remindButton.backgroundColor = DPBlueColor;
        
        _remindButton.layer.cornerRadius = 25;
        _remindButton.layer.shadowColor = DPBlueColor.CGColor;
        _remindButton.layer.shadowOffset = CGSizeMake(0, 3);
        _remindButton.layer.shadowRadius = 5;
        _remindButton.layer.shadowOpacity = 0.4;
        
        DPWeakSelf;
        [_remindButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(68);
            }
        }];
    }
    return _remindButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.remindLabel.text = self.item.result;
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
