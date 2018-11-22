//
//  MyOrderInvoiceHistoryDetailCheckCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceHistoryDetailCheckCell.h"

@implementation MyOrderInvoiceHistoryDetailCheckCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.checkButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.checkButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.checkButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIButton *)checkButton {
    if (!_checkButton) {
        _checkButton = [UIButton newAutoLayoutView];
        [_checkButton setTitle:@"查看  " forState:0];
        [_checkButton setTitleColor:DPGrayColor forState:0];
        _checkButton.titleLabel.font = DPFont4;
        _checkButton.userInteractionEnabled = NO;
        
        [_checkButton swapImage];
        [_checkButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    return _checkButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.attributedText = [NSString setAttributeOfFirstString:self.item.titleString firstFont:DPFont6 firstColor:DPDarkGrayColor secondString:self.item.timeString secondFont:DPFont3 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    
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
