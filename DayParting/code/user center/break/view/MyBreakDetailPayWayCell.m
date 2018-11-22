//
//  MyBreakDetailPayWayCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakDetailPayWayCell.h"

@implementation MyBreakDetailPayWayCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.wayButton];
    [self.contentView addSubview:self.wayImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.wayButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.wayButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.wayImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.wayImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.wayButton];
}

- (UIButton *)wayButton {
    if (!_wayButton) {
        _wayButton = [UIButton newAutoLayoutView];
        [_wayButton setTitle:@"  微信支付" forState:0];
        [_wayButton setTitleColor:DPDarkGrayColor forState:0];
        _wayButton.titleLabel.font = DPFont3;
        
        [_wayButton setImage:[UIImage imageNamed:@"wechat"] forState:0];
    }
    return _wayButton;
}

- (UIImageView *)wayImageView {
    if (!_wayImageView) {
        _wayImageView = [UIImageView newAutoLayoutView];
        [_wayImageView setImage:[UIImage imageNamed:@"invoice_selecteds"]];
    }
    return _wayImageView;
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
