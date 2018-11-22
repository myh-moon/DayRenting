//
//  AuthentyProcessThirdCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyProcessThirdCell.h"

@implementation AuthentyProcessThirdCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.remindImageView];
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.waitingLabel];
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.remindImageView,self.remindLabel,self.waitingLabel,self.submitButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindImageView autoPinEdgeToSuperviewEdge:ALEdgeTop  withInset:70];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindImageView withOffset:28];
    
    [self.waitingLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:24];
    
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.waitingLabel withOffset:40];
    [self.submitButton autoSetDimensionsToSize:CGSizeMake(300, DPCommonButtonHeight)];
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
        _remindLabel.font = DPFont5;
    }
    return _remindLabel;
}

- (UILabel *)waitingLabel {
    if (!_waitingLabel) {
        _waitingLabel = [UILabel newAutoLayoutView];
        _waitingLabel.numberOfLines = 0;
        _waitingLabel.attributedText = [NSString setAttributeOfFirstString:@"我们将在2个工作日内完成审核\n" firstFont:DPFont3 firstColor:DPLightGrayColor9 secondString:@"请您耐心等待" secondFont:DPFont3 secondColor:DPLightGrayColor9 align:1 space:DPSmallSpacing];
    }
    return _waitingLabel;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"我已了解" forState:0];
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

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.remindLabel.text = self.item.remindString;
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
