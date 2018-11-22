//
//  MyOrderInvoiceDetailCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/30.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceDetailCell.h"

@implementation MyOrderInvoiceDetailCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 110;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = UIEdgeInsetsZero;
    
    [self.contentView addSubview:self.chooseButton];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [self.contentView addSubview:self.startPointLabel];
    [self.contentView addSubview:self.startTimeLabel];
    [self.contentView addSubview:self.startAddressLabel];
    
    [self.contentView addSubview:self.dotLabel];
    
    [self.contentView addSubview:self.endPointLabel];
    [self.contentView addSubview:self.endTimeLabel];
    [self.contentView addSubview:self.endAddressLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.chooseButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.chooseButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.chooseButton autoSetDimensionsToSize:CGSizeMake(17, 17)];
    
    [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.chooseButton withOffset:DPMiddleSpacing];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.moneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.nameLabel];
    
    NSArray *views = @[self.startPointLabel,self.startTimeLabel,self.startAddressLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.chooseButton];
    
    [self.startPointLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
    [self.startPointLabel autoSetDimensionsToSize:CGSizeMake(6, 6)];
    
    [self.startTimeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.startPointLabel withOffset:DPSmallSpacing];
    
    [self.startAddressLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.moneyLabel];
    
    NSArray *views1 = @[self.endPointLabel,self.endTimeLabel,self.endAddressLabel];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.startPointLabel withOffset:25];
    
    [self.endPointLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startPointLabel];
    [self.endPointLabel autoSetDimensionsToSize:CGSizeMake(6, 6)];
    
    [self.endTimeLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startTimeLabel];
    
    [self.endAddressLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startAddressLabel];
    
}

- (UIButton *)chooseButton {
    if (!_chooseButton) {
        _chooseButton = [UIButton newAutoLayoutView];
        _chooseButton.userInteractionEnabled = NO;
    }
    return _chooseButton;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.textColor = DPGrayColor;
        _nameLabel.font = DPFont3;
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
    }
    return _moneyLabel;
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

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.nameLabel.text = self.item.nameString;
    self.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"¥" firstFont:DPFont3 firstColor:DPBlackColor secondString:self.item.moneyString secondFont:DPFont8 secondColor:DPBlackColor];
    
    self.startTimeLabel.text = self.item.qctimeString;
    self.endTimeLabel.text = self.item.hctimeString;
    
    self.startAddressLabel.text = self.item.qcnetString;
    self.endAddressLabel.text = self.item.hcnetString;
    
    [[RACObserve(self.item, selectedInvoice) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(id x) {

        self.chooseButton.selected = [x boolValue];
        
        if (self.chooseButton.selected) {
            [self.chooseButton setImage:[UIImage imageNamed:@"invoice_selecteds"] forState:0];
        }else{
            [self.chooseButton setImage:[UIImage imageNamed:@"bank_noselected"] forState:0];
        }
    }];
    
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
