//
//  MyTicketCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/18.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyTicketCell.h"

@implementation MyTicketCell

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
//    [self.ticketBackView addSubview:self.signLabel];
    
    [self.ticketBackView addSubview:self.resourceLabel];
    [self.ticketBackView addSubview:self.timeLabel];
    
    [self.ticketBackView addSubview:self.typeLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.ticketBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, 0, DPMiddleSpacing)];
    
    [self.remindLabel autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:25];
//    [self.remindLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.ticketBackView];
    [self.remindLabel autoSetDimension:ALDimensionWidth toSize:100];
    
    [self.moneyButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.remindLabel];
    [self.moneyButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.remindLabel withOffset:-6];
    
    [self.resourceLabel autoPinEdge:ALEdgeLeft  toEdge:ALEdgeRight ofView:self.remindLabel withOffset:30];
    [self.resourceLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyButton];
    
    [self.timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.resourceLabel];
    [self.timeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.remindLabel];
    
    [self.typeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    [self.typeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.typeLabel autoSetDimensionsToSize:CGSizeMake(55, 20)];
    
}

- (UIImageView *)ticketBackView {
    if (!_ticketBackView) {
        _ticketBackView = [UIImageView newAutoLayoutView];
        _ticketBackView.backgroundColor = DPWhiteColor;
        
        _ticketBackView.layer.shadowOpacity = 0.4;
        _ticketBackView.layer.shadowOffset = CGSizeMake(6, 6);
        _ticketBackView.layer.shadowColor = DPShadowColor.CGColor;
    }
    return _ticketBackView;
}

- (UIButton *)moneyButton {
    if (!_moneyButton) {
        _moneyButton = [UIButton newAutoLayoutView];
        _moneyButton.imageEdgeInsets = UIEdgeInsetsMake(-8, 0, 0, 0);
        [_moneyButton setImage:[UIImage imageNamed:@"¥_white"] forState:0];
        
        [_moneyButton setTitleColor:DPWhiteColor forState:0];
        _moneyButton.titleLabel.font = [UIFont systemFontOfSize:30];
    }
    return _moneyButton;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.textColor = DPWhiteColor;
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

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.textColor = DPLightGrayColor17;
        _typeLabel.font = DPFont3;
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        
        _typeLabel.layer.borderColor = DPLineColor2.CGColor;
        _typeLabel.layer.borderWidth = 0.5;
        _remindLabel.layer.cornerRadius = 5;
        _remindLabel.layer.masksToBounds = YES;
    }
    return _typeLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if ([self.item.type isEqualToString:@"0"]) {//有效
        [self.ticketBackView setImage:[UIImage imageNamed:@"ticket_available"]];
        [self.typeLabel setHidden:YES];
        
        
        if ([self.item.condition isEqualToString:@"已过期"]) {
            [self.ticketBackView setImage:[UIImage imageNamed:@"ticket_history"]];
            [self.typeLabel setHidden:NO];
            self.typeLabel.text = self.item.condition;
        }
        
    }else if([self.item.type isEqualToString:@"1"]){//已使用
        [self.ticketBackView setImage:[UIImage imageNamed:@"ticket_history"]];
        [self.typeLabel setHidden:NO];
        self.typeLabel.text = self.item.condition;

    }

    [self.moneyButton setTitle:self.item.moneyString forState:0];
    self.remindLabel.text = @"满0元可用";
//    self.item.remindString;
    
    self.resourceLabel.text = @"实名认证激励券";
    self.timeLabel.text = self.item.durationString;
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
