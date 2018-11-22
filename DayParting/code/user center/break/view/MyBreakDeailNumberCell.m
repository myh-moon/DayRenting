//
//  MyBreakDeailNumberCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakDeailNumberCell.h"

@implementation MyBreakDeailNumberCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset= DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.numberLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.numberLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.numberLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [UILabel newAutoLayoutView];
        _numberLabel.textColor = DPDarkGrayColor;
        _numberLabel.font = DPFont4;
    }
    return _numberLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.numberLabel.text = [NSString stringWithFormat:@"决定书编号：%@",self.item.numberStr];
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
