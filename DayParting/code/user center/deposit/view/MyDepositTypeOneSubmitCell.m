//
//  MyDepositTypeOneSubmitCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositTypeOneSubmitCell.h"

@implementation MyDepositTypeOneSubmitCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:35];
    [self.moneyLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.moneyLabel withOffset:DPMiddleSpacing];
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:40];

}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.text = @"总计：2000.00元";
        _moneyLabel.textColor = DPDarkGrayColor;
        _moneyLabel.font = DPFont3;
    }
    return _moneyLabel;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"立即支付" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        
        _submitButton.layer.cornerRadius = 20;
        _submitButton.layer.masksToBounds = YES;
        _submitButton.backgroundColor = DPBlueColor;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(43);
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
