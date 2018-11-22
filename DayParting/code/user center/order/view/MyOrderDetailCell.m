//
//  MyOrderDetailCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailCell.h"

@implementation MyOrderDetailCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.titleLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.contentLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.contentLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont4;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.textColor = DPDarkGrayColor;
        _contentLabel.font = DPFont4;
    }
    return _contentLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if ([self.item.showSeperate isEqualToString:@"3"]) {
        self.separatorInset = DPSeperateInsert;
    }else{
        self.separatorInset = DPSeperateInsert2;
    }
    
    if ([self.item.titleString containsString:@"优惠券"]) {
        self.titleLabel.text = self.item.titleString;
        self.contentLabel.text = self.item.contentString;
        self.contentLabel.textColor = DPBlueColor;
    }else if ([self.item.titleString containsString:@"合计"]){
        self.titleLabel.text = self.item.titleString;
        self.contentLabel.attributedText = [NSString setAttributeOfFirstString:@"实付款：" firstFont:DPFont4 firstColor:DPGrayColor secondString:self.item.contentString secondFont:[UIFont fontWithName:@"DINPro-Medium" size:20] secondColor:DPBlueColor thirdString:@"元" thirdFont:DPFont4 thirdColor:DPBlueColor];
    }else{
        self.titleLabel.text = self.item.titleString;
        self.contentLabel.text = self.item.contentString;
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
