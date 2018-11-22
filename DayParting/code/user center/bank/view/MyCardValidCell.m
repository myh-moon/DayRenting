//
//  MyCardValidCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/1.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyCardValidCell.h"

@implementation MyCardValidCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 62;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert2;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:95];
    [self.contentLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont5;
        _titleLabel.text = @"有效期至";
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.textColor = DPLightGrayColor17;
        _contentLabel.font = DPFont5;
    }
    return _contentLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [[RACObserve(self.item, contentString) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *text) {
        self.contentLabel.text = self.item.contentString;
        if ([text isEqualToString:@"选择信用卡有效期"]) {
            self.contentLabel.textColor = DPLightGrayColor17;
        }else{
            self.contentLabel.textColor = DPDarkGrayColor;
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
