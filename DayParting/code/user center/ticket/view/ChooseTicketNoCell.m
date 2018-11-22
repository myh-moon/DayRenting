//
//  ChooseTicketNoCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "ChooseTicketNoCell.h"

@implementation ChooseTicketNoCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.noLabel];
    [self.contentView addSubview:self.selectButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.noLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.noLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.selectButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.selectButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.noLabel];
}

- (UILabel *)noLabel {
    if (!_noLabel) {
        _noLabel = [UILabel newAutoLayoutView];
        _noLabel.text = @"不使用优惠券";
        _noLabel.textColor = DPDarkGrayColor;
        _noLabel.font = DPFont5;
    }
    return _noLabel;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton newAutoLayoutView];
        _selectButton.userInteractionEnabled = NO;
    }
    return _selectButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if (!self.item.selected) {
        [self.selectButton setImage:[UIImage imageNamed:@"unselected"] forState:0];
    }else{
        [self.selectButton setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];
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
