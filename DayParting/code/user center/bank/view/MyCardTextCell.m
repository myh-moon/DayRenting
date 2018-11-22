//
//  MyCardTextCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardTextCell.h"

@implementation MyCardTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 62;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
//    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentTextField];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:95];
    [self.contentTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
    [self.contentTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont5;
    }
    return _titleLabel;
}

- (UITextField *)contentTextField {
    if (!_contentTextField) {
        _contentTextField = [UITextField newAutoLayoutView];
        _contentTextField.textColor = DPDarkGrayColor;
        _contentTextField.font = DPFont5;
        _contentTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _contentTextField;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    self.contentTextField.placeholder = self.item.placeholderString;
    
    if (self.item.contentString) {
        self.contentTextField.text = self.item.contentString;
    }
    
    if ([self.item.showSeperate isEqualToString:@"3"]) {
        self.separatorInset = DPSeperateInsert;
    }else{
        self.separatorInset = DPSeperateInsert2;
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
