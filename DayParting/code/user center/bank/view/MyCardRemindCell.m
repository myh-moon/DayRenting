//
//  MyCardRemindCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardRemindCell.h"

@implementation MyCardRemindCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.remindLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.remindLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(25, DPMiddleSpacing, 0, DPMiddleSpacing)];
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.textColor = DPLightGrayColor17;
        _remindLabel.font = DPFont5;
        _remindLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _remindLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.remindLabel.text = self.item.titleString;
    
    if ([self.item.titleString isEqualToString:@"解除信用卡绑定"]) {
        self.remindLabel.layer.cornerRadius = 6;
        self.remindLabel.layer.masksToBounds = YES;
        self.remindLabel.layer.borderColor = DPLineColor2.CGColor;
        self.remindLabel.layer.borderWidth = 0.5;
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
