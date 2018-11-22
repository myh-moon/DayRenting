//
//  MyOrderTimeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/3.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderTimeCell.h"

@implementation MyOrderTimeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 45;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPBackGroundColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.statusLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.statusLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.statusLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPBigSpacing];
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel newAutoLayoutView];
        _statusLabel.textColor = DPLightGrayColor17;
        _statusLabel.font = DPFont3;
    }
    return _statusLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if ([self.item.statusString isEqualToString:@"nofinish"]) {
        self.statusLabel.text  = @"待支付订单";
    }else if ([self.item.statusString isEqualToString:@"finish"]){
        self.statusLabel.text  = @"已完成订单";
    }else{
        self.statusLabel.text  = @"已取消订单";
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
