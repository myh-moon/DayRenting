//
//  MyOrderInvoiceCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceCell.h"

@implementation MyOrderInvoiceCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.actImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.actImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.actImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.font = DPFont5;
        _titleLabel.textColor = DPGrayColor;
    }
    return _titleLabel;
}

- (UIImageView *)actImageView {
    if (!_actImageView) {
        _actImageView = [UIImageView newAutoLayoutView];
        [_actImageView setImage:[UIImage imageNamed:@"right_arrow"]];
    }
    return _actImageView;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if ([self.item.showSeperate isEqualToString:@"2"]) {
        self.separatorInset = DPSeperateInsert2;
    }else if ([self.item.showSeperate isEqualToString:@"3"]){
        self.separatorInset = DPSeperateInsert;
    }
    
    self.titleLabel.text = self.item.titleString;
    
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
