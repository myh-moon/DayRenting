//
//  MyWalletBalanceCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletBalanceCell.h"

@implementation MyWalletBalanceCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 220;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.backImageView];
    [self.backImageView addSubview:self.balanceLabel];
    [self.backImageView addSubview:self.rechargeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.backImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPBigSpacing, 0, 0, 0)];
    
    [self.balanceLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.balanceLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:34];
    
    [self.rechargeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.rechargeButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:60];
}


- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [UIImageView newAutoLayoutView];
        _backImageView.image = [UIImage imageNamed:@"wallet_back"];
        _backImageView.userInteractionEnabled = YES;
    }
    return _backImageView;
}

- (UILabel *)balanceLabel {
    if (!_balanceLabel) {
        _balanceLabel = [UILabel newAutoLayoutView];
        _balanceLabel.numberOfLines = 0;
    }
    return _balanceLabel;
}

- (UIButton *)rechargeButton {
    if (!_rechargeButton) {
        _rechargeButton = [UIButton newAutoLayoutView];
        [_rechargeButton setImage:[UIImage imageNamed:@"wallet_recharge"] forState:0];
        
        DPWeakSelf;
        [_rechargeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(2345);
            }
        }];
    }
    return _rechargeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSString *bbbb;
    if ([self.item.balance isEqualToString:@"0"]) {
        bbbb = @"0.00";
    }else{
        bbbb = self.item.balance;
    }
    self.balanceLabel.attributedText = [NSString setAttributeOfFirstString:@" 账户余额(元)\n" firstFont:DPFont4 firstColor:DPWhiteColor secondString:bbbb secondFont:[UIFont fontWithName:@"DINPro-Medium" size:33] secondColor:DPWhiteColor align:1 space:12];
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
