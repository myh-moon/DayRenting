//
//  ChooseTicketCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "ChooseTicketCell.h"

@implementation ChooseTicketCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 125;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.ticketBackView];
    
    [self.ticketBackView addSubview:self.remindLabel];
    [self.ticketBackView addSubview:self.moneyButton];
    
    [self.ticketBackView addSubview:self.resourceLabel];
    [self.ticketBackView addSubview:self.timeLabel];
    
    [self.ticketBackView addSubview:self.selectedButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.ticketBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, 0, 0, 0)];
    
    [self.remindLabel autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:DPBigSpacing];
    [self.remindLabel autoSetDimension:ALDimensionWidth toSize:100];
    
    [self.moneyButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.remindLabel];
    [self.moneyButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.remindLabel withOffset:-6];
    
    [self.resourceLabel autoPinEdge:ALEdgeLeft  toEdge:ALEdgeRight ofView:self.remindLabel withOffset:30];
    [self.resourceLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyButton];
    
    [self.timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.resourceLabel];
    [self.timeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.remindLabel];
    
    [self.selectedButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.selectedButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UIImageView *)ticketBackView {
    if (!_ticketBackView) {
        _ticketBackView = [UIImageView newAutoLayoutView];
        [_ticketBackView setImage:[UIImage imageNamed:@"ticket_another"]];
        
        _ticketBackView.layer.shadowColor = DPBlackColor.CGColor;
        _ticketBackView.layer.shadowOffset = CGSizeMake(0, 3);
        _ticketBackView.layer.shadowRadius = 5;
        _ticketBackView.layer.shadowOpacity = 0.04;
    }
    return _ticketBackView;
}

- (UIButton *)moneyButton {
    if (!_moneyButton) {
        _moneyButton = [UIButton newAutoLayoutView];
        _moneyButton.imageEdgeInsets = UIEdgeInsetsMake(-8, 0, 0, 0);
        [_moneyButton setImage:[UIImage imageNamed:@"¥_blue"] forState:0];
        
        [_moneyButton setTitleColor:DPBlueColor forState:0];
        _moneyButton.titleLabel.font = [UIFont systemFontOfSize:30];
    }
    return _moneyButton;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.textColor = DPLightGrayColor;
        _remindLabel.font = DPFont4;
        _remindLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _remindLabel;
}

- (UILabel *)resourceLabel {
    if (!_resourceLabel) {
        _resourceLabel = [UILabel newAutoLayoutView];
        _resourceLabel.textColor = DPDarkGrayColor;
        _resourceLabel.font = DPFont9;
    }
    return _resourceLabel;
}


- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.textColor = DPLightGrayColor17;
        _timeLabel.font = DPFont4;
    }
    return _timeLabel;
}

- (UIButton *)selectedButton {
    if (!_selectedButton) {
        _selectedButton = [UIButton newAutoLayoutView];
        _selectedButton.userInteractionEnabled = NO;
    }
    return _selectedButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.moneyButton setTitle:self.item.moneyString forState:0];
    self.remindLabel.text = @"满0元可用";
    
    self.resourceLabel.text = @"实名认证激励券";
    self.timeLabel.text = self.item.durationString;
    
    if (!self.item.selected) {
        [self.selectedButton setImage:[UIImage imageNamed:@"unselected"] forState:0];
    }else{
        [self.selectedButton setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];
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
