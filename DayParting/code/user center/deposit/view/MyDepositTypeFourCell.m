//
//  MyDepositTypeFourCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositTypeFourCell.h"

@implementation MyDepositTypeFourCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 170;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.powerButton];
    [self.contentView addSubview:self.useCarButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.powerButton,self.useCarButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.powerButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    [self.powerButton autoSetDimension:ALDimensionHeight toSize:95];
    [self.powerButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.powerButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];

    [self.useCarButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.powerButton withOffset:30];
    [self.useCarButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.powerButton];
    [self.useCarButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.powerButton];
    [self.useCarButton autoSetDimension:ALDimensionHeight toSize:40];
}

- (UIButton *)powerButton {
    if (!_powerButton) {
        _powerButton = [UIButton newAutoLayoutView];
        _powerButton.titleLabel.numberOfLines = 0;
        _powerButton.layer.cornerRadius = 6;
        _powerButton.layer.masksToBounds = YES;
        
        _powerButton.layer.borderWidth = 0.5;
        _powerButton.layer.borderColor = DPLineColor2.CGColor;
    
        
        NSMutableAttributedString *ssss = [NSString setAttributeOfFirstString:@"押金预授权\n" firstFont:DPFont7 firstColor:DPBlueColor secondString:@"您已完成信用卡押金预授权，无需支付用车押金" secondFont:DPFont3 secondColor:DPLightGrayColor align:1 space:DPSmallSpacing];
        [_powerButton setAttributedTitle:ssss forState:0];
        
    }
    return _powerButton;
}

- (UIButton *)useCarButton {
    if (!_useCarButton) {
        _useCarButton = [UIButton newAutoLayoutView];
        _useCarButton.backgroundColor = DPBlueColor;
        [_useCarButton setTitle:@"去用车" forState:0];
        [_useCarButton setTitleColor:DPWhiteColor forState:0];
        _useCarButton.titleLabel.font = DPFont6;
        
        _useCarButton.layer.cornerRadius = 20;
        _useCarButton.layer.masksToBounds = YES;
        
        DPWeakSelf;
        [_useCarButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(58);
            }
        }];
    }
    return _useCarButton;
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
