//
//  MyBreakDetailPayCommitCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakDetailPayCommitCell.h"

@implementation MyBreakDetailPayCommitCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.commitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:35];
    [self.moneyLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.commitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.moneyLabel withOffset:DPBigSpacing];
    [self.commitButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.commitButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.commitButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.textColor = DPDarkGrayColor;
        _moneyLabel.font = DPFont3;
    }
    return _moneyLabel;
}

- (UIButton *)commitButton {
    if (!_commitButton) {
        _commitButton = [UIButton newAutoLayoutView];
        [_commitButton setTitle:@"立即缴费" forState:0];
        [_commitButton setTitleColor:DPWhiteColor forState:0];
        _commitButton.titleLabel.font = DPFont6;
        _commitButton.backgroundColor = DPBlueColor;
        
        _commitButton.layer.cornerRadius = 25;
        
        DPWeakSelf;
        [_commitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(21);
            }
        }];
    }
    return _commitButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.moneyLabel.text = [NSString stringWithFormat:@"总计：%@",self.item.moneyString];
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
