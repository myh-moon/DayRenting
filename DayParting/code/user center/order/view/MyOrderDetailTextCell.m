//
//  MyOrderDetailTextCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailTextCell.h"

@implementation MyOrderDetailTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.colorLabel];
    [self.contentView addSubview:self.siteLabel];
    [self.contentView addSubview:self.autoLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.carImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing, 0) excludingEdge:ALEdgeRight];
    [self.carImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.carImageView withMultiplier:1.78];
    
    [self.nameLabel autoPinEdge:ALEdgeLeft  toEdge:ALEdgeRight ofView:self.carImageView withOffset:DPMiddleSpacing];
    [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.carImageView withOffset:DPSmallSpacing];
    
    NSArray *views = @[self.colorLabel,self.siteLabel,self.autoLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.carImageView withOffset:-DPSmallSpacing];
    [views autoSetViewsDimension:ALDimensionHeight toSize:16];
    
    [self.colorLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
    
    [self.siteLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.colorLabel withOffset:DPSmallSpacing];
    
    [self.autoLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.siteLabel withOffset:DPSmallSpacing];
}

- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
    }
    return _carImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
    }
    return _nameLabel;
}

- (UILabel *)colorLabel {
    if (!_colorLabel) {
        _colorLabel = [UILabel newAutoLayoutView];
        _colorLabel.textColor = DPLightGrayColor;
        _colorLabel.font = DPFont1;
        _colorLabel.backgroundColor = DPWhiteColor;
        
        _colorLabel.layer.cornerRadius = 3;
        _colorLabel.layer.masksToBounds = YES;
        _colorLabel.layer.borderColor = DPLightGrayColor4.CGColor;
        _colorLabel.layer.borderWidth = 0.5;
    }
    return _colorLabel;
}

- (UILabel *)siteLabel {
    if (!_siteLabel) {
        _siteLabel = [UILabel newAutoLayoutView];
        _siteLabel.textColor = DPLightGrayColor;
        _siteLabel.font = DPFont1;
        _siteLabel.backgroundColor = DPWhiteColor;
        
        _siteLabel.layer.cornerRadius = 3;
        _siteLabel.layer.masksToBounds = YES;
        _siteLabel.layer.borderColor = DPLightGrayColor4.CGColor;
        _siteLabel.layer.borderWidth = 0.5;
    }
    return _siteLabel;
}

- (UILabel *)autoLabel {
    if (!_autoLabel) {
        _autoLabel = [UILabel newAutoLayoutView];
        _autoLabel.textColor = DPLightGrayColor;
        _autoLabel.font = DPFont1;
        _autoLabel.backgroundColor = DPWhiteColor;
        
        _autoLabel.layer.cornerRadius = 3;
        _autoLabel.layer.masksToBounds = YES;
        _autoLabel.layer.borderColor = DPLightGrayColor4.CGColor;
        _autoLabel.layer.borderWidth = 0.5;
    }
    return _autoLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.carImageView sd_setImageWithURL:[NSURL URLWithString:self.item.carImageString] placeholderImage:[UIImage imageNamed:@""]];
    
    self.nameLabel.attributedText = [NSString setAttributeOfFirstString:self.item.carCodeString firstFont:DPFont4 firstColor:DPDarkGrayColor secondString:self.item.carNameString secondFont:DPFont2 secondColor:DPDarkGrayColor];
    
    self.colorLabel.text = self.item.colorString;
    self.siteLabel.text = self.item.siteString;
    self.autoLabel.text = self.item.autoString;
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
