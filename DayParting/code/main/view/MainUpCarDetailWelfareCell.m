//
//  MainUpCarDetailWelfareCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarDetailWelfareCell.h"

@implementation MainUpCarDetailWelfareCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 64;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPBackGroundColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.abatementLabel];
    [self.contentView addSubview:self.serviceButton];
    [self.contentView addSubview:self.serviceLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.abatementLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.abatementLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.serviceButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.serviceButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.serviceButton autoSetDimension:ALDimensionHeight toSize:30];
        
        [self.serviceLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.serviceButton];
        [self.serviceLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.abatementLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)abatementLabel {
    if (!_abatementLabel) {
        _abatementLabel = [UILabel newAutoLayoutView];
        _abatementLabel.numberOfLines = 0;
        
        _abatementLabel.attributedText = [NSString setAttributeOfFirstString:@"车损免赔\n" firstFont:DPFont3 firstColor:DPDarkGrayColor secondString:@"上限1500元" secondFont:DPFont3 secondColor:DPLightGrayColor align:0 space:6];
    }
    return _abatementLabel;
}

- (UIButton *)serviceButton {
    if (!_serviceButton) {
        _serviceButton = [UIButton newAutoLayoutView];
        [_serviceButton swapImage];
        
        [_serviceButton setTitle:@"尊享服务费  " forState:0];
        [_serviceButton setTitleColor:DPDarkGrayColor forState:0];
        _serviceButton.titleLabel.font = DPFont3;
        [_serviceButton setImage:[UIImage imageNamed:@"invoice_selectedss"] forState:0];
        [_serviceButton setImage:[UIImage imageNamed:@"unchecked_circle_12"] forState:UIControlStateSelected];
        
        _serviceButton.contentVerticalAlignment = 1;
        
        [_serviceButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
        }];

    }
    return _serviceButton;
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel newAutoLayoutView];
        _serviceLabel.attributedText = [NSString setAttributeOfFirstString:@"2元" firstFont:DPFont3 firstColor:DPBlueColor secondString:@"/小时  " secondFont:DPFont3 secondColor:DPLightGrayColor];
    }
    return _serviceLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    
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
