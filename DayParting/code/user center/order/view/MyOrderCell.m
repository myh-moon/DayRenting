//
//  MyOrderCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderCell.h"

@implementation MyOrderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 180;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPBackGroundColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.backWhiteLabel];
    
    [self.backWhiteLabel addSubview:self.codeLabel];
    [self.backWhiteLabel addSubview:self.nameLabel];
    
    [self.backWhiteLabel addSubview:self.startPointLabel];
    [self.backWhiteLabel addSubview:self.startTimeLabel];
    [self.backWhiteLabel addSubview:self.startAddressLabel];
    
    [self.backWhiteLabel addSubview:self.endPointLabel];
    [self.backWhiteLabel addSubview:self.endTimeLabel];
    [self.backWhiteLabel addSubview:self.endAddressLabel];
    
    [self.backWhiteLabel addSubview:self.dotLabel];
    
    [self.backWhiteLabel addSubview:self.lineLabel];
    [self.backWhiteLabel addSubview:self.moneyLabel];
    [self.backWhiteLabel addSubview:self.actButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.backWhiteLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing)];
    
    [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.nameLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.codeLabel];
    
    NSArray *views = @[self.startPointLabel,self.startTimeLabel,self.startAddressLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeLabel withOffset:DPBigSpacing];
    
    [self.startPointLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
    [self.startPointLabel autoSetDimensionsToSize:CGSizeMake(6, 6)];
    
    [self.startTimeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.startPointLabel withOffset:DPSmallSpacing];
    
    [self.startAddressLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.nameLabel];
    
    
    NSArray *views1 = @[self.endPointLabel,self.endTimeLabel,self.endAddressLabel];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.startPointLabel withOffset:25];
    
    [self.endPointLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startPointLabel];
    [self.endPointLabel autoSetDimensionsToSize:CGSizeMake(6, 6)];

    [self.endTimeLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startTimeLabel];

    [self.endAddressLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.startAddressLabel];
    
    [self.lineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.endPointLabel];
    [self.lineLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.endAddressLabel];
    [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.endTimeLabel withOffset:DPBigSpacing];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:0.5];
    
    NSArray *views2 = @[self.moneyLabel,self.actButton];
    [views2 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views2 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel withOffset:DPSmallSpacing];
    
    [self.moneyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel];
    
    [self.actButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel];
}

- (UIView *)backWhiteLabel {
    if (!_backWhiteLabel) {
        _backWhiteLabel = [UIView newAutoLayoutView];
        _backWhiteLabel.backgroundColor = DPWhiteColor;
        _backWhiteLabel.layer.cornerRadius = 6;
        
        _backWhiteLabel.layer.shadowColor = DPBlackColor.CGColor;
        _backWhiteLabel.layer.shadowOffset = CGSizeMake(5, 5);
        _backWhiteLabel.layer.shadowOpacity = 0.03;
    }
    return _backWhiteLabel;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.textColor = DPGrayColor;
        _codeLabel.font = DPFont3;
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

- (UILabel *)startPointLabel {
    if (!_startPointLabel) {
        _startPointLabel = [UILabel newAutoLayoutView];
        _startPointLabel.layer.cornerRadius = 3;
        _startPointLabel.layer.masksToBounds = YES;
        _startPointLabel.backgroundColor = DPBlueColor;
    }
    return _startPointLabel;
}

- (UILabel *)startTimeLabel {
    if (!_startTimeLabel) {
        _startTimeLabel = [UILabel newAutoLayoutView];
        _startTimeLabel.textColor = DPLightGrayColor;
        _startTimeLabel.font = DPFont3;
    }
    return _startTimeLabel;
}

- (UILabel *)startAddressLabel {
    if (!_startAddressLabel) {
        _startAddressLabel = [UILabel newAutoLayoutView];
        _startAddressLabel.textColor = DPLightGrayColor;
        _startAddressLabel.font = DPFont3;
    }
    return _startAddressLabel;
}

- (UILabel *)endPointLabel {
    if (!_endPointLabel) {
        _endPointLabel = [UILabel newAutoLayoutView];
        _endPointLabel.layer.cornerRadius = 3;
        _endPointLabel.layer.masksToBounds = YES;
        _endPointLabel.backgroundColor = DPGreenColor1;
    }
    return _endPointLabel;
}

- (UILabel *)endTimeLabel {
    if (!_endTimeLabel) {
        _endTimeLabel = [UILabel newAutoLayoutView];
        _endTimeLabel.textColor = DPLightGrayColor;
        _endTimeLabel.font = DPFont3;
    }
    return _endTimeLabel;
}

- (UILabel *)endAddressLabel {
    if (!_endAddressLabel) {
        _endAddressLabel = [UILabel newAutoLayoutView];
        _endAddressLabel.textColor = DPLightGrayColor;
        _endAddressLabel.font = DPFont3;
    }
    return _endAddressLabel;
}

- (UILabel *)dotLabel {
    if (!_dotLabel) {
        _dotLabel = [UILabel newAutoLayoutView];
    }
    return _dotLabel;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLineColor2;
    }
    return _lineLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
    }
    return _moneyLabel;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        [_actButton swapImage];
        _actButton.titleLabel.font = DPFont3;
    }
    return _actButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.codeLabel.text = self.item.number;
    self.nameLabel.text = self.item.car_name;
    self.startTimeLabel.text = self.item.qctime;
    self.endTimeLabel.text = self.item.hctime;
    self.startAddressLabel.text = self.item.qcaddress;
    self.endAddressLabel.text = self.item.hcaddress;
    
    //已支付，已还车，已取消
    if ([self.item.status isEqualToString:@"4"]) {
        [self.actButton setImage:[UIImage imageNamed:@""] forState:0];
        [self.actButton setTitleColor:DPGrayColor forState:0];
         [self.actButton setTitle:@"已取消" forState:0];
        
        [self.endPointLabel setHidden:YES];
        [self.endTimeLabel setHidden:YES];
        [self.endAddressLabel setHidden:YES];
        
        NSString *mmm = @"";
        self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"¥" firstFont:DPFont3 firstColor:DPBlackColor secondString:@"0.00" secondFont:DPFont8 secondColor:DPBlackColor thirdString:mmm thirdFont:DPFont3 thirdColor:DPGrayColor];

    }else if ([self.item.status isEqualToString:@"2"]) {
        [self.actButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        [self.actButton setTitleColor:DPBlueColor forState:0];
        NSString *sdsdsd = [NSString stringWithFormat:@"%@  ",@"现在支付"];
         [self.actButton setTitle:sdsdsd forState:0];
        
        [self.endPointLabel setHidden:NO];
        [self.endTimeLabel setHidden:NO];
        [self.endAddressLabel setHidden:NO];
        
        NSString *mmm = @"";
        self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"¥" firstFont:DPFont3 firstColor:DPBlackColor secondString:self.item.money secondFont:DPFont8 secondColor:DPBlackColor thirdString:mmm thirdFont:DPFont3 thirdColor:DPGrayColor];
        
    }else if ([self.item.status isEqualToString:@"3"]) {
        [self.actButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        [self.actButton setTitleColor:DPGrayColor forState:0];
        NSString *sdsdsd = [NSString stringWithFormat:@"%@  ",@"已支付"];
        [self.actButton setTitle:sdsdsd forState:0];
        
        [self.endPointLabel setHidden:NO];
        [self.endTimeLabel setHidden:NO];
        [self.endAddressLabel setHidden:NO];
        
        NSString *mmm = [NSString stringWithFormat:@"（实付 ¥%@)",self.item.smoney];
        self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"¥" firstFont:DPFont3 firstColor:DPBlackColor secondString:self.item.money secondFont:DPFont8 secondColor:DPBlackColor thirdString:mmm thirdFont:DPFont3 thirdColor:DPGrayColor];
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
