//
//  MyBreakDetailSubmitCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakDetailSubmitCell.h"

@implementation MyBreakDetailSubmitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 160;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.submitButton];
    [self.contentView addSubview:self.changeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.submitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(40, 40, 0, 40) excludingEdge:ALEdgeBottom];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:50];
    
    [self.changeButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.submitButton];
    [self.changeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.submitButton withOffset:DPBigSpacing];
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"提交材料" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        _submitButton.backgroundColor = DPBlueColor;
        
        _submitButton.layer.cornerRadius = 25;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(21);
            }
        }];
    }
    return _submitButton;
}

- (UIButton *)changeButton {
    if (!_changeButton) {
        _changeButton = [UIButton newAutoLayoutView];
        [_changeButton setTitle:@"去线上缴费" forState:0];
        [_changeButton setTitleColor:DPBlueColor forState:0];
        _changeButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_changeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(22);
            }
        }];
    }
    return _changeButton;
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
