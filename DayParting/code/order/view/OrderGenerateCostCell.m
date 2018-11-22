//
//  OrderGenerateCostCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateCostCell.h"

@implementation OrderGenerateCostCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 55;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.blueLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.noteButton];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.blueLabel,self.titleLabel,self.noteButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        [[views firstObject]  autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.blueLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.blueLabel autoSetDimensionsToSize:CGSizeMake(3, 16)];
        
        [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.blueLabel withOffset:8];
        
        [self.noteButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)blueLabel {
    if (!_blueLabel) {
        _blueLabel = [UILabel newAutoLayoutView];
        _blueLabel.backgroundColor = DPBlueColor;
    }
    return _blueLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont6;
    }
    return _titleLabel;
}

- (UIButton *)noteButton {
    if (!_noteButton) {
        _noteButton = [UIButton newAutoLayoutView];
        [_noteButton swapImage];
        [_noteButton  setTitleColor:DPLightGrayColor forState:0];
        _noteButton.titleLabel.font = DPFont3;
    }
    return _noteButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = @"预计费用";
    [self.noteButton setTitle:@"费用说明  " forState:0];
    [self.noteButton setImage:[UIImage imageNamed:@"detail_remind"] forState:0];
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
