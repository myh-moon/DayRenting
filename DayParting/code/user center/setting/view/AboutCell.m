//
//  AboutCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AboutCell.h"

@implementation AboutCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight-64;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.appImageView];
    [self.contentView addSubview:self.appNameLabel];
    [self.contentView addSubview:self.appVersionLabel];
    [self.contentView addSubview:self.appRemindLabel];
    [self.contentView addSubview:self.appCopyrightLabel];
    [self.contentView addSubview:self.appCheckButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.appImageView,self.appNameLabel,self.appVersionLabel,self.appRemindLabel,self.appCopyrightLabel,self.appCheckButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.appImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:33];
    [self.appImageView autoSetDimensionsToSize:CGSizeMake(95, 95)];
    
    
    [self.appNameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.appImageView withOffset:18];

    [self.appVersionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.appNameLabel withOffset:12];
    
    [self.appRemindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.appVersionLabel withOffset:26];

    [self.appCopyrightLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.appCheckButton withOffset:-DPSmallSpacing];
    [self.appCopyrightLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.appCopyrightLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];

    [self.appCheckButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30];
}

- (UIImageView *)appImageView {
    if (!_appImageView) {
        _appImageView = [UIImageView newAutoLayoutView];
        _appImageView.backgroundColor = DPRedColor;
    }
    return _appImageView;
}

- (UILabel *)appNameLabel {
    if (!_appNameLabel) {
        _appNameLabel = [UILabel newAutoLayoutView];
        _appNameLabel.text = @"用了个车";
        _appNameLabel.font = [UIFont systemFontOfSize:30];
        _appNameLabel.textColor = DPBlackColor;
    }
    return _appNameLabel;
}

- (UILabel *)appVersionLabel {
    if (!_appVersionLabel) {
        _appVersionLabel = [UILabel newAutoLayoutView];
        _appVersionLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *currentVersion = [NSString stringWithFormat:@"version %@",[infoDic objectForKey:@"CFBundleShortVersionString"]];
        _appVersionLabel.text = currentVersion;
        _appVersionLabel.textColor = DPLightGrayColor;
    }
    return _appVersionLabel;
}

- (UILabel *)appRemindLabel {
    if (!_appRemindLabel) {
        _appRemindLabel = [UILabel newAutoLayoutView];
        _appRemindLabel.text = @"当前是最新版本";
        _appRemindLabel.textColor = DPLightGrayColor;
        _appRemindLabel.font = DPFont4;
    }
    return _appRemindLabel;
}

- (UILabel *)appCopyrightLabel {
    if (!_appCopyrightLabel) {
        _appCopyrightLabel = [UILabel newAutoLayoutView];
        _appCopyrightLabel.numberOfLines = 0;
        
        _appCopyrightLabel.attributedText = [NSString setAttributeOfFirstString:@"朝槿公司 版权所有\n" firstFont:DPFont3 firstColor:DPLightGrayColor secondString:@"Copyright © 2018-2018 ZhaoJin. All Rights Reserved" secondFont:DPFont3 secondColor:DPLightGrayColor align:1 space:DPSmallSpacing];
    }
    return _appCopyrightLabel;
}

- (UIButton *)appCheckButton {
    if (!_appCheckButton) {
        _appCheckButton = [UIButton newAutoLayoutView];
        [_appCheckButton setTitleColor:DPLightGrayColor forState:0];
        _appCheckButton.titleLabel.font = DPFont4;
        
        
        NSString *mmmm = @"软件许可及服务协议";
        [_appCheckButton setTitle:mmmm forState:0];
        
        //下划线
        NSMutableAttributedString *originPrice = [[NSMutableAttributedString alloc] initWithString:_appCheckButton.titleLabel.text];
        [originPrice setAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:NSMakeRange(0, mmmm.length)];
        
        [_appCheckButton setAttributedTitle:originPrice forState:0];
        
        DPWeakSelf;
        [_appCheckButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(1234);
            }
        }];
    }
    return _appCheckButton;
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
