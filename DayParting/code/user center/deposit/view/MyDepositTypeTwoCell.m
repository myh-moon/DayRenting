//
//  MyDepositTypeTwoCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositTypeTwoCell.h"

@implementation MyDepositTypeTwoCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.noPowerButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.noPowerButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, 30, 0, 30) excludingEdge:ALEdgeBottom];
    [self.noPowerButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
}

- (UIButton *)noPowerButton {
    if (!_noPowerButton) {
        _noPowerButton = [UIButton newAutoLayoutView];
        [_noPowerButton setTitle:@"申请退还押金" forState:0];
        [_noPowerButton setTitleColor:DPLightGrayColor17 forState:0];
        _noPowerButton.titleLabel.font = DPFont6;
        
        _noPowerButton.layer.cornerRadius = 6;
        _noPowerButton.layer.borderWidth = 0.5;
        _noPowerButton.layer.borderColor = DPLineColor2.CGColor;
        
        DPWeakSelf;
        [_noPowerButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(56);
            }
        }];
    }
    return _noPowerButton;
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
