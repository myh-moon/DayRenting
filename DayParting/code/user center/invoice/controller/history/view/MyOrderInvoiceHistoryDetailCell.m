//
//  MyOrderInvoiceHistoryDetailCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceHistoryDetailCell.h"

@implementation MyOrderInvoiceHistoryDetailCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 40;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert1;
    
    [self.contentView addSubview:self.titleLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPLightGrayColor;
        _titleLabel.font = DPFont3;
    }
    return _titleLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    self.titleLabel.text = self.item.titleString;
    NSString *sssss = [NSString stringWithFormat:@"%@      ",self.item.titleString];
    if ([self.item.titleString isEqualToString:@"发票金额"]) {
        self.titleLabel.attributedText = [NSString setAttributeOfFirstString:sssss firstFont:DPFont4 firstColor:DPLightGrayColor17 secondString:self.item.contentString secondFont:DPFont4 secondColor:DPBlueColor thirdString:@"元" thirdFont:DPFont4 thirdColor:DPDarkGrayColor];
    }else{
        self.titleLabel.attributedText = [NSString setAttributeOfFirstString:sssss firstFont:DPFont4 firstColor:DPLightGrayColor17 secondString:self.item.contentString secondFont:DPFont4 secondColor:DPDarkGrayColor];
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
