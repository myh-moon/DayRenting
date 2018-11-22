//
//  AuthentyDriverCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyDriverCell.h"

@implementation AuthentyDriverCell


+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.faceButton];
    [self.contentView addSubview:self.oppositeButton];
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.remindLabel,self.faceButton,self.oppositeButton,self.submitButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeTop  withInset:35];
    
    [self.faceButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:35];
    [self.faceButton autoSetDimensionsToSize:CGSizeMake(256, 170)];
    
    [self.oppositeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.faceButton withOffset:30];
    [self.oppositeButton autoSetDimensionsToSize:CGSizeMake(256, 170)];
    
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.oppositeButton withOffset:50];
    [self.submitButton autoSetDimensionsToSize:CGSizeMake(300, DPCommonButtonHeight)];
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"请按照提示，上传本人有效驾驶证的主副页";
        _remindLabel.textColor = DPDarkGrayColor;
        _remindLabel.font = DPFont6;
    }
    return _remindLabel;
}

- (AuthentyPictureView *)faceButton {
    if (!_faceButton) {
        _faceButton = [AuthentyPictureView newAutoLayoutView];
        [_faceButton setBackgroundImage:[UIImage imageNamed:@"driver_face"] forState:0];
        _faceButton.imageTopConstraints.constant = 45;
        _faceButton.labelBottomConstraints.constant = DPMiddleSpacing;
        _faceButton.picImage.image = [UIImage imageNamed:@"driver_camera"];
        _faceButton.picLabel.text = @"拍摄驾驶证主页";
        _faceButton.picLabel.textColor = UIColorFromRGB(0x627181);
        
        DPWeakSelf;
        [_faceButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(3434);
            }
        }];
    }
    return _faceButton;
}

- (AuthentyPictureView *)oppositeButton {
    if (!_oppositeButton) {
        _oppositeButton = [AuthentyPictureView newAutoLayoutView];
        [_oppositeButton setBackgroundImage:[UIImage imageNamed:@"driver_opposite"] forState:0];
        _oppositeButton.imageTopConstraints.constant = 45;
        _oppositeButton.labelBottomConstraints.constant = DPMiddleSpacing;
        _oppositeButton.picImage.image = [UIImage imageNamed:@"driver_camera"];
        _oppositeButton.picLabel.text = @"拍摄驾驶证副页";
        _oppositeButton.picLabel.textColor = UIColorFromRGB(0x627181);
        
        DPWeakSelf;
        [_oppositeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(3435);
            }
        }];
    }
    return _oppositeButton;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"提交资料" forState:0];
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
