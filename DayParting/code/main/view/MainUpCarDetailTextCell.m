//
//  MainUpCarDetailTextCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarDetailTextCell.h"

@implementation MainUpCarDetailTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 240;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.lineLabel];
    [self.contentView addSubview:self.attentionButton];
    [self.contentView addSubview:self.closeButton];
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.oilLabel];
    
    [self.contentView addSubview:self.oilProgressBackView];
    [self.oilProgressBackView addSubview:self.oilClassLabel1];
    [self.oilProgressBackView addSubview:self.oilClassLabel2];
    [self.oilProgressBackView addSubview:self.oilClassLabel3];
    [self.oilProgressBackView addSubview:self.oilClassLabel4];
    [self.oilProgressBackView addSubview:self.oilClassLabel5];
    [self.oilProgressBackView addSubview:self.oilClassLabel6];
    [self.oilProgressBackView addSubview:self.oilClassLabel7];
    [self.oilProgressBackView addSubview:self.oilClassLabel8];
    [self.oilProgressBackView addSubview:self.oilClassLabel9];
    [self.oilProgressBackView addSubview:self.oilClassLabel10];
    
    [self.oilProgressBackView addSubview:self.oilTopView];

    [self.contentView addSubview:self.colorLabel];
    [self.contentView addSubview:self.siteLabel];
    [self.contentView addSubview:self.autoLabel];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
        
        [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
        [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeLabel withOffset:6];
        
        NSArray *views = @[self.lineLabel,self.attentionButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        [[views firstObject] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.codeLabel];
        
        [self.lineLabel autoSetDimensionsToSize:CGSizeMake(1, 13)];
        [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.codeLabel withOffset:DPMiddleSpacing];
        
        [self.attentionButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel withOffset:DPMiddleSpacing];
        
        [self.closeButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.closeButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.closeButton autoSetDimensionsToSize:CGSizeMake(40, 40)];

        
        [self.carImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.carImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.attentionButton withOffset:25];
        [self.carImageView autoSetDimension:ALDimensionHeight toSize:100];
        [self.carImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.carImageView withMultiplier:1.78]; //16:9
        
        [self.oilLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carImageView withOffset:DPMiddleSpacing];
        [self.oilLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.colorLabel];
        
        [self.oilProgressBackView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.oilLabel withOffset:DPBigSpacing];
        [self.oilProgressBackView autoSetDimension:ALDimensionWidth toSize:59];
        [self.oilProgressBackView autoSetDimension:ALDimensionHeight toSize:15];
        [self.oilProgressBackView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.oilLabel];
        
        NSArray *views1 = @[self.oilClassLabel1,self.oilClassLabel2,self.oilClassLabel3,self.oilClassLabel4,self.oilClassLabel5,self.oilClassLabel6,self.oilClassLabel7,self.oilClassLabel8,self.oilClassLabel9,self.oilClassLabel10];
        [views1 autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:5 insetSpacing:NO];
        [views1 autoSetViewsDimension:ALDimensionHeight toSize:15];
        [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop];
        
        [self.oilTopView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        NSArray *views2 = @[self.colorLabel,self.siteLabel,self.autoLabel];
        [views2 autoAlignViewsToAxis:ALAxisHorizontal];
        [[views2 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.oilLabel withOffset:12];
        [views2 autoSetViewsDimension:ALDimensionHeight toSize:16.5];
        
        [self.colorLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.siteLabel withOffset:-12];
        
        [self.siteLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.carImageView];
        
        [self.autoLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.siteLabel withOffset:12];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}


- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.textColor = DPBlackColor;
        _codeLabel.font = DPFont6;
    }
    return _codeLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.textColor = DPGrayColor;
        _nameLabel.font = DPFont3;
    }
    return _nameLabel;
}
- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLightGrayColor5;
    }
    return _lineLabel;
}

- (UIButton *)attentionButton {
    if (!_attentionButton) {
        _attentionButton = [UIButton newAutoLayoutView];
        [_attentionButton setTitle:@"用车事项 " forState:0];
        [_attentionButton setTitleColor:DPLightGrayColor forState:0];
        _attentionButton.titleLabel.font = DPFont3;
        [_attentionButton swapImage];
        [_attentionButton setImage:[UIImage imageNamed:@"detail_remind"] forState:0];
    }
    return _attentionButton;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton newAutoLayoutView];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:0];
        _closeButton.imageEdgeInsets = UIEdgeInsetsMake(DPMiddleSpacing, 0, 0, DPMiddleSpacing);
        _closeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _closeButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        
        DPWeakSelf;
        [_closeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(123);
            }
        }];
    }
    return _closeButton;
}

- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
    }
    return _carImageView;
}

- (UILabel *)oilLabel {
    if (!_oilLabel) {
        _oilLabel = [UILabel newAutoLayoutView];
    }
    return _oilLabel;
}

- (UIView *)oilProgressBackView {
    if (!_oilProgressBackView) {
        _oilProgressBackView = [UIView newAutoLayoutView];
        _oilProgressBackView.layer.cornerRadius = 3;
        _oilProgressBackView.layer.masksToBounds = YES;
        _oilProgressBackView.backgroundColor = DPWhiteColor;
    }
    return _oilProgressBackView;
}

- (UILabel *)oilClassLabel1 {
    if (!_oilClassLabel1) {
        _oilClassLabel1 = [UILabel newAutoLayoutView];
        _oilClassLabel1.backgroundColor = DPBlueColor;
        _oilClassLabel1.tag = 101;
    }
    return _oilClassLabel1;
}

- (UILabel *)oilClassLabel2 {
    if (!_oilClassLabel2) {
        _oilClassLabel2 = [UILabel newAutoLayoutView];
        _oilClassLabel2.backgroundColor = DPBlueColor;
        _oilClassLabel2.tag = 102;
    }
    return _oilClassLabel2;
}

- (UILabel *)oilClassLabel3 {
    if (!_oilClassLabel3) {
        _oilClassLabel3 = [UILabel newAutoLayoutView];
        _oilClassLabel3.backgroundColor = DPBlueColor;
        _oilClassLabel3.tag = 103;
    }
    return _oilClassLabel3;
}

- (UILabel *)oilClassLabel4 {
    if (!_oilClassLabel4) {
        _oilClassLabel4 = [UILabel newAutoLayoutView];
        _oilClassLabel4.backgroundColor = DPBlueColor;
        _oilClassLabel4.tag = 104;
    }
    return _oilClassLabel4;
}

- (UILabel *)oilClassLabel5 {
    if (!_oilClassLabel5) {
        _oilClassLabel5 = [UILabel newAutoLayoutView];
        _oilClassLabel5.backgroundColor = DPBlueColor;
        _oilClassLabel5.tag = 105;
    }
    return _oilClassLabel5;
}

- (UILabel *)oilClassLabel6 {
    if (!_oilClassLabel6) {
        _oilClassLabel6 = [UILabel newAutoLayoutView];
        _oilClassLabel6.backgroundColor = DPBlueColor;
        _oilClassLabel6.tag = 106;
    }
    return _oilClassLabel6;
}

- (UILabel *)oilClassLabel7 {
    if (!_oilClassLabel7) {
        _oilClassLabel7 = [UILabel newAutoLayoutView];
        _oilClassLabel7.backgroundColor = DPBlueColor;
        _oilClassLabel7.tag = 107;
    }
    return _oilClassLabel7;
}

- (UILabel *)oilClassLabel8 {
    if (!_oilClassLabel8) {
        _oilClassLabel8 = [UILabel newAutoLayoutView];
        _oilClassLabel8.backgroundColor = DPBlueColor;
        _oilClassLabel8.tag = 108;
    }
    return _oilClassLabel8;
}

- (UILabel *)oilClassLabel9 {
    if (!_oilClassLabel9) {
        _oilClassLabel9 = [UILabel newAutoLayoutView];
        _oilClassLabel9.backgroundColor = DPBlueColor;
        _oilClassLabel9.tag = 109;
    }
    return _oilClassLabel9;
}

- (UILabel *)oilClassLabel10 {
    if (!_oilClassLabel10) {
        _oilClassLabel10 = [UILabel newAutoLayoutView];
        _oilClassLabel10.backgroundColor = DPBlueColor;
        _oilClassLabel10.tag = 110;
    }
    return _oilClassLabel10;
}

- (UIImageView *)oilTopView {
    if (!_oilTopView) {
        _oilTopView = [UIImageView newAutoLayoutView];
        _oilTopView.backgroundColor = [UIColor clearColor];
        _oilTopView.image = [UIImage imageNamed:@"oil"];
    }
    return _oilTopView;
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

- (UILabel *)autoLabel {
    if (!_autoLabel) {
        _autoLabel = [UILabel newAutoLayoutView];
        _autoLabel.font = DPFont1;
        _autoLabel.textColor = DPLightGrayColor;
        _autoLabel.layer.cornerRadius = 3;
        _autoLabel.backgroundColor = DPWhiteColor;
        _autoLabel.layer.borderWidth = 0.5;
        _autoLabel.layer.borderColor = DPLightGrayColor4.CGColor;
    }
    return _autoLabel;
}


- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.carImageView sd_setImageWithURL:[NSURL URLWithString:self.item.img] placeholderImage:[UIImage imageNamed:@""]];
    
    self.codeLabel.text = self.item.car_code;
    self.nameLabel.text = self.item.car_name;

        for (NSInteger i=10; i>self.item.oilClass; i--) {
            UILabel *shLabel = [self viewWithTag:i+100];
            shLabel.backgroundColor = DPLightGrayColor17;
            
            if (self.item.oilClass < 3) {
                
            }
        }
    
    self.oilLabel.attributedText = [NSString setAttributeOfFirstString:@"油量约：" firstFont:DPFont3 firstColor:DPDarkGrayColor secondString:self.item.oil secondFont:DPFont3 secondColor:DPBlueColor];
    
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
