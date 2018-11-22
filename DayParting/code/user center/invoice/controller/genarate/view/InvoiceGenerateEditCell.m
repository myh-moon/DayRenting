//
//  InvoiceGenerateEditCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "InvoiceGenerateEditCell.h"

@implementation InvoiceGenerateEditCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert2;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.editTextField];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.editTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft   withInset:90];
    [self.editTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
    [self.editTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont4;
    }
    return _titleLabel;
}

- (UITextField *)editTextField {
    if (!_editTextField) {
        _editTextField = [UITextField newAutoLayoutView];
        _editTextField.textColor = DPGrayColor;
        _editTextField.font = DPFont4;
        
        DPWeakSelf;
        [_editTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _editTextField;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    
    self.editTextField.placeholder = self.item.placeholderString;
    
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
