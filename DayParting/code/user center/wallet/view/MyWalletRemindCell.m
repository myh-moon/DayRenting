//
//  MyWalletRemindCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletRemindCell.h"

@implementation MyWalletRemindCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 115;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.remindButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.remindButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

- (UIButton *)remindButton {
    if (!_remindButton) {
        _remindButton = [UIButton newAutoLayoutView];
        [_remindButton setImage:[UIImage imageNamed:@"wallet_credit"] forState:0];
        _remindButton.userInteractionEnabled = NO;
    }
    return _remindButton;
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
