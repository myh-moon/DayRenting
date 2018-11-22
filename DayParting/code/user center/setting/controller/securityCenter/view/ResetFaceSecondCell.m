//
//  ResetFaceSecondCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "ResetFaceSecondCell.h"

@implementation ResetFaceSecondCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.collectionImageView];
    [self.contentView addSubview:self.submitButton];
    [self.contentView addSubview:self.waitingLabel];
    
    [self setNeedsUpdateConstraints];
    
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.remindLabel,self.collectionImageView,self.submitButton,self.waitingLabel];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:34];
    
    [self.collectionImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:58];
    [self.collectionImageView autoSetDimensionsToSize:CGSizeMake(116, 116)];
    
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.collectionImageView withOffset:118];
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
    
    [self.waitingLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.collectionImageView withOffset:50];
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
        _remindLabel.attributedText = [NSString setAttributeOfFirstString:@"注册脸部信息\n" firstFont:[UIFont systemFontOfSize:25] firstColor:DPDarkGrayColor secondString:@"已完成录入" secondFont:DPFont5 secondColor:DPBlueColor align:1 space:22];
    }
    return _remindLabel;
}

- (UIImageView *)collectionImageView {
    if (!_collectionImageView) {
        _collectionImageView = [UIImageView newAutoLayoutView];
        _collectionImageView.backgroundColor = DPRedColor;
        _collectionImageView.layer.cornerRadius = 58;
    }
    return _collectionImageView;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"重新验证脸部信息" forState:0];
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
                weakself.item.didSelectedBtn(88);
            }
        }];
    }
    return _submitButton;
}

- (UILabel *)waitingLabel {
    if (!_waitingLabel) {
        _waitingLabel = [UILabel newAutoLayoutView];
        _waitingLabel.text = @"“人脸识别”仅用于解锁车辆中使用";
        _waitingLabel.textColor = DPLightGrayColor;
        _waitingLabel.font = DPFont5;
    }
    return _waitingLabel;
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
