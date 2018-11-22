//
//  MyOrderDetailServiceCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailServiceCell.h"

@implementation MyOrderDetailServiceCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.startPointLabel];
    [self.contentView addSubview:self.startTimeLabel];
    [self.contentView addSubview:self.startServiceLabel];
    
    [self.contentView addSubview:self.dotImageView];
    
    [self.contentView addSubview:self.endPointLabel];
    [self.contentView addSubview:self.endTimeLabel];
    [self.contentView addSubview:self.endServiceLabel];

    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.startPointLabel,self.startTimeLabel,self.startServiceLabel];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPBigSpacing];
    
    [self.startPointLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.startPointLabel autoSetDimensionsToSize:CGSizeMake(6, 6)];
    
    [self.startTimeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.startPointLabel withOffset:DPSmallSpacing];
    
    [self.startServiceLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    
    [self.dotImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.startPointLabel withOffset:5];
    [self.dotImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.endPointLabel withOffset:-5];
    [self.dotImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startPointLabel];
    [self.dotImageView autoSetDimension:ALDimensionWidth toSize:2];
    
    
    NSArray *views1 = @[self.endPointLabel,self.endTimeLabel,self.endServiceLabel];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:23];
    
    [self.endPointLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startPointLabel];
    [self.endPointLabel autoSetDimensionsToSize:CGSizeMake(6, 6)];
    
    [self.endTimeLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.startTimeLabel];
    
    [self.endServiceLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.startServiceLabel];
    
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
        _startTimeLabel.textColor = DPDarkGrayColor;
        _startTimeLabel.font = DPFont3;
    }
    return _startTimeLabel;
}

- (UILabel *)startServiceLabel {
    if (!_startServiceLabel) {
        _startServiceLabel = [UILabel newAutoLayoutView];
        _startServiceLabel.textColor = DPDarkGrayColor;
        _startServiceLabel.font = DPFont3;
    }
    return _startServiceLabel;
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
        _endTimeLabel.textColor = DPDarkGrayColor;
        _endTimeLabel.font = DPFont3;
    }
    return _endTimeLabel;
}

- (UILabel *)endServiceLabel {
    if (!_endServiceLabel) {
        _endServiceLabel = [UILabel newAutoLayoutView];
        _endServiceLabel.textColor = DPDarkGrayColor;
        _endServiceLabel.font = DPFont3;
    }
    return _endServiceLabel;
}

- (UIImageView *)dotImageView {
    if (!_dotImageView) {
        _dotImageView = [UIImageView newAutoLayoutView];
        _dotImageView.image = [UIImage imageNamed:@"order_dot"];
    }
    return _dotImageView;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.startTimeLabel.text = self.item.qctime;
    self.startServiceLabel.text = self.item.qcaddress;
    
    self.endTimeLabel.text = self.item.hctime;
    self.endServiceLabel.text = self.item.hcaddress;

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
