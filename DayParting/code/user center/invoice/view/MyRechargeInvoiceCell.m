//
//  MyRechargeInvoiceCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyRechargeInvoiceCell.h"

@implementation MyRechargeInvoiceCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.signButton];
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.signButton,self.typeLabel,self.moneyLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.signButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    
    [self.typeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.signButton withOffset:18];
    
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
}

- (UIButton *)signButton {
    if (!_signButton) {
        _signButton = [UIButton newAutoLayoutView];
        [_signButton setImage:[UIImage imageNamed:@"invoice_selecteds"] forState:0];
        
        [_signButton setImage:[UIImage imageNamed:@"authenty_hollow"] forState:UIControlStateSelected];
        
        [_signButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
        }];
    }
    return _signButton;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.numberOfLines = 0;
    }
    return _typeLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
    }
    return _moneyLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.typeLabel.attributedText = [NSString setAttributeOfFirstString:@"钱包充值\n" firstFont:DPFont5 firstColor:DPDarkGrayColor secondString:@"2018-09-14 22:00" secondFont:DPFont3 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"¥ " firstFont:DPFont3 firstColor:DPBlackColor secondString:@"100.00" secondFont:DPFont8 secondColor:DPBlackColor];
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
