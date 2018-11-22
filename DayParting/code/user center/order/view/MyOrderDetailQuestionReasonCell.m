//
//  MyOrderDetailQuestionReasonCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailQuestionReasonCell.h"

@implementation MyOrderDetailQuestionReasonCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 145;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.backWhiteView];
    [self.backWhiteView addSubview:self.reasonTextView];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.backWhiteView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 30, 30, 30)];
    
    [self.reasonTextView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPBigSpacing, DPMiddleSpacing, DPBigSpacing, DPMiddleSpacing)];
}

- (UIView *)backWhiteView {
    if (!_backWhiteView) {
        _backWhiteView = [UIView newAutoLayoutView];
        _backWhiteView.backgroundColor = DPWhiteColor;
    }
    return _backWhiteView;
}

- (UITextView *)reasonTextView {
    if (!_reasonTextView) {
        _reasonTextView = [UITextView newAutoLayoutView];
        _reasonTextView.textColor = DPLightGrayColor17;
        _reasonTextView.font = DPFont4;
        _reasonTextView.text = @"请尽可能详细描述您所遇到的问题…";
        
        DPWeakSelf;
        [_reasonTextView.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditing) {
                weakself.item.didEditing(text);
            }
        }];
    }
    return _reasonTextView;
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
