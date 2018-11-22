//
//  OrderGenerateCostTotalCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateCostTotalCell.h"

@implementation OrderGenerateCostTotalCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 66;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.totalLabel];
    
    [self setNeedsUpdateConstraints];
}


- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.totalLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.totalLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [UILabel newAutoLayoutView];
    }
    return _totalLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.totalLabel.attributedText = [NSString setAttributeOfFirstString:@"合计费用：" firstFont:DPFont4 firstColor:DPLightGrayColor secondString:self.item.allMoney secondFont:DPFont20 secondColor:DPDarkGrayColor thirdString:@"元" thirdFont:DPFont4 thirdColor:DPDarkGrayColor];
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
