//
//  ResetFourCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "ResetFourCell.h"

@implementation ResetFourCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 380;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.finishImageView];
    [self.contentView addSubview:self.finishLabel];
    [self.contentView addSubview:self.finishButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.finishImageView,self.finishLabel,self.finishButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.finishImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:90];
    
    [self.finishLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.finishImageView withOffset:28];
    
    [self.finishButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.finishLabel withOffset:54];
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.finishButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
}

- (UIImageView *)finishImageView {
    if (!_finishImageView) {
        _finishImageView = [UIImageView newAutoLayoutView];
        _finishImageView.image = [UIImage imageNamed:@"license_success"];
    }
    return _finishImageView;
}

- (UILabel *)finishLabel {
    if (!_finishLabel) {
        _finishLabel = [UILabel newAutoLayoutView];
        _finishLabel.text = @"支付密码已重置";
        _finishLabel.textColor = DPBlueColor;
        _finishLabel.font = DPFont6;
    }
    return _finishLabel;
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = [UIButton newAutoLayoutView];
        [_finishButton setTitle:@"我已了解" forState:0];
        [_finishButton setTitleColor:DPWhiteColor forState:0];
        _finishButton.titleLabel.font = DPFont6;
        _finishButton.backgroundColor = DPBlueColor;
        
        _finishButton.layer.cornerRadius = 25;
        
        _finishButton.layer.shadowColor = DPBlueColor.CGColor;
        _finishButton.layer.shadowRadius = 5;
        _finishButton.layer.shadowOffset = CGSizeMake(0, 3);
        _finishButton.layer.shadowOpacity = 0.4;
        
        DPWeakSelf;
        [_finishButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(89);
            }
        }];
    }
    return _finishButton;
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
