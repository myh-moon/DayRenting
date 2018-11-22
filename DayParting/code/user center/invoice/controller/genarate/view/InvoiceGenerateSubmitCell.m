//
//  InvoiceGenerateSubmitCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "InvoiceGenerateSubmitCell.h"

@implementation InvoiceGenerateSubmitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPBackGroundColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.submitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(25, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing)];
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"提交" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        
        _submitButton.backgroundColor = DPBlueColor;
        _submitButton.layer.cornerRadius = 3;
        _submitButton.userInteractionEnabled = NO;
    }
    return _submitButton;
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
