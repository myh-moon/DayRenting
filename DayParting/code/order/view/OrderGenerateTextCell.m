//
//  OrderGenerateTextCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateTextCell.h"

@implementation OrderGenerateTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.oilLabel];
    [self.contentView addSubview:self.colorLabel];
    [self.contentView addSubview:self.siteLabel];
    [self.contentView addSubview:self.autoLabel];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.carImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing, 0) excludingEdge:ALEdgeRight];
        [self.carImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.carImageView withMultiplier:1.78]; //16:9
        
        [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.carImageView withOffset:DPMiddleSpacing];
        [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.carImageView withOffset:8];
        
        NSArray *views = @[self.oilLabel,self.colorLabel,self.siteLabel,self.autoLabel];
        [views autoSetViewsDimension:ALDimensionHeight toSize:16.5];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.oilLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.carImageView withOffset:-8];
        [self.oilLabel autoPinEdge:ALEdgeLeft  toEdge:ALEdgeLeft ofView:self.nameLabel];
        
        
        [self.colorLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.oilLabel withOffset:DPSmallSpacing];
        
        [self.siteLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.colorLabel withOffset:DPSmallSpacing];
        
        [self.autoLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.siteLabel withOffset:DPSmallSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
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

- (UILabel *)oilLabel {
    if (!_oilLabel) {
        _oilLabel = [UILabel newAutoLayoutView];
        _oilLabel.textColor = DPBlueColor;
        _oilLabel.font = DPFont1;
        _oilLabel.layer.cornerRadius = 3;
        _oilLabel.layer.borderWidth = 0.5;
        _oilLabel.layer.borderColor = DPBlueColor.CGColor;
    }
    return _oilLabel;
}

- (UILabel *)colorLabel {
    if (!_colorLabel) {
        _colorLabel = [UILabel newAutoLayoutView];
        _colorLabel.font = DPFont1;
        _colorLabel.textColor = DPLightGrayColor;
        _colorLabel.layer.cornerRadius = 3;
        _colorLabel.layer.borderWidth = 0.5;
        _colorLabel.layer.borderColor = DPLightGrayColor4.CGColor;
    }
    return _colorLabel;
}

- (UILabel *)siteLabel {
    if (!_siteLabel) {
        _siteLabel = [UILabel newAutoLayoutView];
        _siteLabel.font = DPFont1;
        _siteLabel.textColor = DPLightGrayColor;
        _siteLabel.layer.cornerRadius = 3;
        _siteLabel.layer.borderWidth = 0.5;
        _siteLabel.layer.borderColor = DPLightGrayColor4.CGColor;
    }
    return _siteLabel;
}

- (UILabel *)autoLabel {
    if (!_autoLabel) {
        _autoLabel = [UILabel newAutoLayoutView];
        _autoLabel.font = DPFont1;
        _autoLabel.textColor = DPLightGrayColor;
        _autoLabel.layer.cornerRadius = 3;
        _autoLabel.layer.borderWidth = 0.5;
        _autoLabel.layer.borderColor = DPLightGrayColor4.CGColor;
    }
    return _autoLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.carImageView sd_setImageWithURL:[NSURL URLWithString:self.item.img] placeholderImage:[UIImage imageNamed:@""]];
    
    self.nameLabel.attributedText = [NSString setAttributeOfFirstString:self.item.car_code firstFont:DPFont4 firstColor:DPBlackColor secondString:self.item.car_name secondFont:DPFont2 secondColor:DPGrayColor];

    self.oilLabel.text = self.item.oil;
    self.colorLabel.text = self.item.color;
    self.siteLabel.text = self.item.sites;
    self.autoLabel.text = self.item.autos;

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
