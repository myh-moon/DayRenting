//
//  AuthentyProcessSecondCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyProcessSecondCell.h"

@implementation AuthentyProcessSecondCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.faceButton];
    [self.contentView addSubview:self.waitingLabel];
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.remindLabel,self.faceButton,self.waitingLabel,self.submitButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeTop  withInset:5];
    
    [self.faceButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:40];
    [self.faceButton autoSetDimensionsToSize:CGSizeMake(142, 142)];
    
    
    [self.waitingLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.faceButton withOffset:40];
    
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.waitingLabel withOffset:40];
    [self.submitButton autoSetDimensionsToSize:CGSizeMake(300, DPCommonButtonHeight)];
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"为保障您的用车安全，请进行脸部信息登记";
        _remindLabel.textColor = DPDarkGrayColor;
        _remindLabel.font = DPFont6;
    }
    return _remindLabel;
}

- (UIButton *)faceButton {
    if (!_faceButton) {
        _faceButton = [UIButton newAutoLayoutView];
        _faceButton.layer.cornerRadius = 3;
        _faceButton.layer.masksToBounds = YES;
        _faceButton.backgroundColor = DPBlueColor;
        
        DPWeakSelf;
        [_faceButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(3434);
            }
        }];
    }
    return _faceButton;
}

- (UILabel *)waitingLabel {
    if (!_waitingLabel) {
        _waitingLabel = [UILabel newAutoLayoutView];
        _waitingLabel.numberOfLines = 0;
        _waitingLabel.attributedText = [NSString setAttributeOfFirstString:@"脸部采集中，请稍等…\n" firstFont:DPFont6 firstColor:DPDarkGrayColor secondString:@"请处于较明亮的环境中" secondFont:DPFont4 secondColor:DPLightGrayColor align:1 space:DPSmallSpacing];
    }
    return _waitingLabel;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"下一步" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        _submitButton.backgroundColor = DPBlueColor;
        
        _submitButton.layer.cornerRadius = 25;
        _submitButton.layer.shadowColor = DPBlueColor.CGColor;
        _submitButton.layer.shadowOffset = CGSizeMake(0, 3);
        _submitButton.layer.shadowOpacity = 0.4;
        _submitButton.layer.shadowRadius = 5;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(3436);
            }
        }];
    }
    return _submitButton;
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
