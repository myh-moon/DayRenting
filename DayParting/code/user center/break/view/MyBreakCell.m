//
//  MyBreakCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyBreakCell.h"

@implementation MyBreakCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 225+20+10;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.breakBackView];
    
    [self.breakBackView addSubview:self.numberLabel];
    [self.breakBackView addSubview:self.checkNumberButton];
    [self.breakBackView addSubview:self.reasonLabel];
    [self.breakBackView addSubview:self.timeLabel];
    [self.breakBackView addSubview:self.addressLabel];
    [self.breakBackView addSubview:self.lineLabel];
    [self.breakBackView addSubview:self.resultLabel];
    [self.breakBackView addSubview:self.actButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.breakBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPBigSpacing, DPMiddleSpacing)];
    
    [self.numberLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset: DPMiddleSpacing];
    [self.numberLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    
    [self.checkNumberButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.checkNumberButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.numberLabel];

    [self.reasonLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.numberLabel];
    [self.reasonLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.numberLabel withOffset:24];
    [self.reasonLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.checkNumberButton];

    [self.timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.reasonLabel];
    [self.timeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reasonLabel withOffset:24];

    [self.addressLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.timeLabel];
    [self.addressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.timeLabel withOffset:DPSmallSpacing];

    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.addressLabel withOffset:DPBigSpacing];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:0.5];

    [self.resultLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.addressLabel];
    [self.resultLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:21];

    [self.actButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.resultLabel];
    [self.actButton autoSetDimensionsToSize:CGSizeMake(90, 36)];
    [self.actButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.checkNumberButton];
}

- (UIView *)breakBackView {
    if (!_breakBackView) {
        _breakBackView = [UIView newAutoLayoutView];
        _breakBackView.backgroundColor = DPWhiteColor;
        _breakBackView.layer.cornerRadius = 6;
        
        _breakBackView.layer.shadowColor = DPShadowColor.CGColor;
        _breakBackView.layer.shadowOffset = CGSizeMake(0, 5);
        _breakBackView.layer.shadowOpacity = 0.6;
        _breakBackView.layer.shadowRadius = 5;
    }
    return _breakBackView;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [UILabel newAutoLayoutView];
        _numberLabel.font = DPFont4;
        _numberLabel.textColor = DPGrayColor;
    }
    return _numberLabel;
}

- (UIButton *)checkNumberButton {
    if (!_checkNumberButton) {
        _checkNumberButton = [UIButton newAutoLayoutView];
        [_checkNumberButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
    }
    return _checkNumberButton;
}

- (UILabel *)reasonLabel {
    if (!_reasonLabel) {
        _reasonLabel = [UILabel newAutoLayoutView];
        _reasonLabel.textColor = DPBlackColor;
        _reasonLabel.font = DPFont6;
    }
    return _reasonLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
    }
    return _timeLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel newAutoLayoutView];
    }
    return _addressLabel;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLineColor3;
    }
    return _lineLabel;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [UILabel newAutoLayoutView];
    }
    return _resultLabel;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        _actButton.titleLabel.font = DPFont6;
        _actButton.layer.cornerRadius = 3;
        
        DPWeakSelf;
        [_actButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(90);
            }
        }];
    }
    return _actButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.numberLabel.text = self.item.numberString;
    self.reasonLabel.text = self.item.reasonString;
    
    self.timeLabel.attributedText = [NSString setAttributeOfFirstString:@"时间    " firstFont:DPFont4 firstColor:DPLightGrayColor secondString:self.item.timeString secondFont:DPFont4 secondColor:DPGrayColor];
    
    self.addressLabel.attributedText = [NSString setAttributeOfFirstString:@"地点    " firstFont:DPFont4 firstColor:DPLightGrayColor secondString:self.item.addressString secondFont:DPFont4 secondColor:DPGrayColor];
    
    self.resultLabel.attributedText = [NSString setAttributeOfFirstString:self.item.result1String firstFont:DPFont6 firstColor:DPBlueColor secondString:@"  |  " secondFont:DPFont6 secondColor:DPLightGrayColor17 thirdString:self.item.result2String thirdFont:DPFont6 thirdColor:DPBlueColor];

    [self.actButton setTitle:self.item.statusString forState:0];
    
    if ([self.item.statusString isEqualToString:@"立即处理"]) {
        [self.actButton setBackgroundColor:DPBlueColor];
        [self.actButton setTitleColor:DPWhiteColor1 forState:0];
    }else{
        [self.actButton setBackgroundColor:DPBlueColor4];
        [self.actButton setTitleColor:DPBlueColor forState:0];
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
