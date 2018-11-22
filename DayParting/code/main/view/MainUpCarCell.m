//
//  MainUpCarCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarCell.h"

@implementation MainUpCarCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.oilLabel];
    [self.contentView addSubview:self.colorLabel];
    [self.contentView addSubview:self.siteLabel];
    [self.contentView addSubview:self.actImageView];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.carImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPSmallSpacing, DPMiddleSpacing, DPSmallSpacing, 0) excludingEdge:ALEdgeRight];
        [self.carImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.carImageView withMultiplier:1.78];
        
        [self.codeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.carImageView withOffset:5];
        [self.codeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.carImageView withOffset:DPMiddleSpacing];
        
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:190];
        [self.nameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.codeLabel];
        
        NSArray *views = @[self.oilLabel,self.colorLabel,self.siteLabel];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        [views autoMatchViewsDimension:ALDimensionHeight];
        [[views firstObject] autoSetDimension:ALDimensionHeight toSize:16.5];
        [[views firstObject] autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.carImageView withOffset:-5];
        
        [self.oilLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
        [self.oilLabel autoSetDimension:ALDimensionWidth toSize:56];
        
        [self.colorLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.oilLabel withOffset:DPMiddleSpacing];
        
        [self.siteLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.colorLabel withOffset:DPMiddleSpacing];
        
        [self.actImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.actImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.carImageView];
        
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

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.textColor = DPBlackColor;
        _codeLabel.font = DPFont4;
    }
    return _codeLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.textColor = DPGrayColor;
        _nameLabel.font = DPFont2;
    }
    return _nameLabel;
}

- (UILabel *)oilLabel {
    if (!_oilLabel) {
        _oilLabel = [UILabel newAutoLayoutView];
        _oilLabel.font = DPFont1;
        _oilLabel.textColor = DPBlueColor;
        _oilLabel.layer.borderColor = DPBlueColor.CGColor;
        _oilLabel.layer.borderWidth = 0.5;
        _oilLabel.layer.cornerRadius = 3;
    }
    return _oilLabel;
}


- (UILabel *)colorLabel {
    if (!_colorLabel) {
        _colorLabel = [UILabel newAutoLayoutView];
        _colorLabel.font = DPFont1;
        _colorLabel.textColor = DPLightGrayColor;
        _colorLabel.layer.cornerRadius = 3;
        _colorLabel.backgroundColor = DPWhiteColor;
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
        _siteLabel.backgroundColor = DPWhiteColor;
        _siteLabel.layer.borderWidth = 0.5;
        _siteLabel.layer.borderColor = DPLightGrayColor4.CGColor;
    }
    return _siteLabel;
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
    
    if ([self.item.showSeperate isEqualToString:@"3"]) {
        self.separatorInset = DPSeperateInsert;
    }else{
        self.separatorInset = DPSeperateInsert2;
    }

    [self.carImageView sd_setImageWithURL:[NSURL URLWithString:self.item.img] placeholderImage:[UIImage imageNamed:@""]];
    
    self.codeLabel.text = self.item.car_code;
    self.nameLabel.text = self.item.car_name;

    self.oilLabel.text = self.item.oilmass;
    self.colorLabel.text = self.item.color;
    self.siteLabel.text = self.item.sites;
    
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
