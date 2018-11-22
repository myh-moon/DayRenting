//
//  BankListCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BankListCell.h"

@implementation BankListCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.bankButton];
    [self.contentView addSubview:self.selectButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {

    [self.bankButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.bankButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.selectButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.selectButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.bankButton];
}

- (UIButton *)bankButton {
    if (!_bankButton) {
        _bankButton = [UIButton newAutoLayoutView];
        _bankButton.titleLabel.font = DPFont5;
        [_bankButton setTitleColor:DPDarkGrayColor forState:0];
    }
    return _bankButton;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton newAutoLayoutView];
        [_selectButton setImage:[UIImage imageNamed:@"invoice_selecteds"] forState:0];
        [_selectButton setImage:[UIImage imageNamed:@"bank_noselected"] forState:UIControlStateSelected];

        [_selectButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
        }];
    }
    return _selectButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.bankButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    [self.bankButton setTitle:@"  中国交通银行" forState:0];
    
    
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
