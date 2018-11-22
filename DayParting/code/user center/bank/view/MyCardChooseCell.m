//
//  MyCardChooseCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardChooseCell.h"

@implementation MyCardChooseCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 62;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.actImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:95];
    [self.contentLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
    
    [self.actImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.actImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.contentLabel];

}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont5;
        _titleLabel.text = @"发卡银行";
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.textColor = DPDarkGrayColor;
        _contentLabel.font = DPFont5;
    }
    return _contentLabel;
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
        
    [[RACObserve(self.item, bankName) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *bank) {
        self.contentLabel.text = self.item.bankName;        
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
