//
//  CarReturnCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarReturnCell.h"

@implementation CarReturnCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.serviceLabel];
    [self.contentView addSubview:self.chooseButton];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.serviceLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.serviceLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.chooseButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.chooseButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.serviceLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel newAutoLayoutView];
        _serviceLabel.numberOfLines = 0;
    }
    return _serviceLabel;
}

- (UIButton *)chooseButton {
    if (!_chooseButton) {
        _chooseButton = [UIButton newAutoLayoutView];
        [_chooseButton setTitleColor:DPGrayColor forState:0];
        _chooseButton.titleLabel.font = DPFont4;
        _chooseButton.userInteractionEnabled = NO;
        
        [_chooseButton swapImage];
        [_chooseButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    return _chooseButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.serviceLabel.attributedText = [NSString setAttributeOfFirstString:self.item.service firstFont:DPFont6 firstColor:DPDarkGrayColor secondString:self.item.address secondFont:DPFont3 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
    
    [self.chooseButton setTitle:self.item.distance forState:0];
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
