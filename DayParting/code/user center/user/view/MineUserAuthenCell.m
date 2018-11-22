//
//  MineUserAuthenCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserAuthenCell.h"

@implementation MineUserAuthenCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 130;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.backWhiteView];
    [self.backWhiteView addSubview:self.authenTitleButton];
    [self.backWhiteView addSubview:self.authenStateButton];
    
    [self.backWhiteView addSubview:self.lineLabel];
    
    [self.backWhiteView addSubview:self.licenseTitleButton];
    [self.backWhiteView addSubview:self.licenseStateButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.backWhiteView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing)];
    
    [self.authenTitleButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.authenTitleButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.authenStateButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.authenStateButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.authenTitleButton];
    
    [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.authenTitleButton];
    [self.lineLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.authenStateButton];
    [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.authenTitleButton withOffset:DPMiddleSpacing];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:0.5];
    
    [self.licenseTitleButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.authenTitleButton];
    [self.licenseTitleButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel withOffset:DPMiddleSpacing];
    
    [self.licenseStateButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.licenseTitleButton];
    [self.licenseStateButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.authenStateButton];
    
}

- (UIView *)backWhiteView {
    if (!_backWhiteView) {
        _backWhiteView = [UIView newAutoLayoutView];
        _backWhiteView.backgroundColor = DPWhiteColor;
        _backWhiteView.layer.cornerRadius = 6;
//        _backWhiteView.layer.masksToBounds = YES;
        
        _backWhiteView.layer.shadowOffset = CGSizeMake(1, 1);
        _backWhiteView.layer.shadowOpacity = 0.8;
        _backWhiteView.layer.shadowColor = UIColorFromRGB1(0x485b7e, 0.1).CGColor;
    }
    return _backWhiteView;
}

- (UIButton *)authenTitleButton {
    if (!_authenTitleButton) {
        _authenTitleButton = [UIButton newAutoLayoutView];
        [_authenTitleButton setTitle:@"  实名认证" forState:0];
        [_authenTitleButton setTitleColor:DPDarkGrayColor forState:0];
        _authenTitleButton.titleLabel.font = DPFont5;
        
        [_authenTitleButton setImage:[UIImage imageNamed:@"center_authenty_id"] forState:0];
    }
    return _authenTitleButton;
}

- (UIButton *)authenStateButton {
    if (!_authenStateButton) {
        _authenStateButton = [UIButton newAutoLayoutView];
        _authenStateButton.titleLabel.font = DPFont5;
        
        DPWeakSelf;
        [_authenStateButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(576);
            }
        }];
    }
    return _authenStateButton;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLineColor2;
    }
    return _lineLabel;
}

- (UIButton *)licenseTitleButton {
    if (!_licenseTitleButton) {
        _licenseTitleButton = [UIButton newAutoLayoutView];
        [_licenseTitleButton setTitle:@"  驾照认证" forState:0];
        [_licenseTitleButton setTitleColor:DPDarkGrayColor forState:0];
        _licenseTitleButton.titleLabel.font = DPFont5;
        
        [_licenseTitleButton setImage:[UIImage imageNamed:@"center_authenty_license"] forState:0];
    }
    return _licenseTitleButton;
}
- (UIButton *)licenseStateButton {
    if (!_licenseStateButton) {
        _licenseStateButton = [UIButton newAutoLayoutView];
        _licenseStateButton.titleLabel.font = DPFont5;
                
        DPWeakSelf;
        [_licenseStateButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(577);
            }
        }];
    }
    return _licenseStateButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.authenStateButton setTitle:self.item.authenStateString forState:0];
    
    if ([self.item.authenStateString isEqualToString:@"  已认证"]) {
        [self.authenStateButton setTitleColor:DPDarkGrayColor forState:0];
        [self.authenStateButton setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];
    }else{
        [self.authenStateButton setTitleColor:DPLightGrayColor3 forState:0];
        [self.authenStateButton setImage:[UIImage imageNamed:@"invoice_noselected"] forState:0];
    }
    
    [self.licenseStateButton setTitle:self.item.licenseStateString forState:0];

    if ([self.item.licenseStateString isEqualToString:@"  已认证"]) {
        [self.licenseStateButton setTitleColor:DPDarkGrayColor forState:0];
        [self.licenseStateButton setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];
    }else{
        [self.licenseStateButton setTitleColor:DPLightGrayColor3 forState:0];
        [self.licenseStateButton setImage:[UIImage imageNamed:@"invoice_noselected"] forState:0];
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
