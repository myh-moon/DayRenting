//
//  MyOrderInvoiceDetailHeaderCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/3.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceDetailHeaderCell.h"

@implementation MyOrderInvoiceDetailHeaderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 45;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.timeLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.timeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.font = DPFont3;
        _timeLabel.textColor = DPLightGrayColor17;
    }
    return _timeLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.timeLabel.text = self.item.timeString;
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
