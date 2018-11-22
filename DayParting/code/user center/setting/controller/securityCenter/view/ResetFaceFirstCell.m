//
//  ResetFaceFirstCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "ResetFaceFirstCell.h"

@implementation ResetFaceFirstCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.collectionImageView];
    [self.contentView addSubview:self.waitingLabel];
    [self.contentView addSubview:self.conditionLabel];
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];

}

- (void)layoutCellConstraints {
    NSArray *views = @[self.remindLabel,self.collectionImageView,self.waitingLabel,self.conditionLabel,self.submitButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:48];
    
    
    [self.collectionImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:42];
    [self.collectionImageView autoSetDimensionsToSize:CGSizeMake(142, 142)];
    
    [self.waitingLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.collectionImageView withOffset:50];
    
    [self.conditionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.waitingLabel withOffset:DPMiddleSpacing];
    
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.conditionLabel withOffset:46];
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
    
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"“人脸识别”仅用于解锁车辆中使用";
        _remindLabel.font = DPFont6;
        _remindLabel.textColor = DPDarkGrayColor;
    }
    return _remindLabel;
}

- (UIImageView *)collectionImageView {
    if (!_collectionImageView) {
        _collectionImageView = [UIImageView newAutoLayoutView];
        _collectionImageView.backgroundColor = DPRedColor;
        _collectionImageView.layer.cornerRadius = 71;
    }
    return _collectionImageView;
}

- (UILabel *)waitingLabel {
    if (!_waitingLabel) {
        _waitingLabel = [UILabel newAutoLayoutView];
        _waitingLabel.text = @"脸部信息采集中，请稍等…";
        _waitingLabel.textColor = DPDarkGrayColor;
        _waitingLabel.font = DPFont6;
    }
    return _waitingLabel;
}

- (UILabel *)conditionLabel {
    if (!_conditionLabel) {
        _conditionLabel = [UILabel newAutoLayoutView];
        _conditionLabel.text = @"请处于较明亮的环境中";
        _conditionLabel.textColor = DPLightGrayColor;
        _conditionLabel.font = DPFont4;
    }
    return _conditionLabel;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"确认提交" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        _submitButton.backgroundColor = DPBlueColor;
        
        _submitButton.layer.cornerRadius = 25;
        _submitButton.layer.shadowColor = DPBlueColor.CGColor;
        _submitButton.layer.shadowRadius = 5;
        _submitButton.layer.shadowOffset = CGSizeMake(0, 3);
        _submitButton.layer.shadowOpacity = 0.4;
        
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(87);
            }
        }];
    }
    return _submitButton;
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
