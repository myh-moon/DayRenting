//
//  MyOrderDetailQuestionTypeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailQuestionTypeCell.h"

@implementation MyOrderDetailQuestionTypeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
//    self.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.typeImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.typeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.typeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.typeImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.typeImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.typeLabel];
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.font = DPFont4;
        _typeLabel.textColor = DPGrayColor;
    }
    return _typeLabel;
}

- (UIImageView *)typeImageView {
    if (!_typeImageView) {
        _typeImageView = [UIImageView newAutoLayoutView];
    }
    return _typeImageView;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.typeLabel.text = self.item.typeString;
    
//    if (!self.item.showSelected) {
//        [self.typeImageView setImage:[UIImage imageNamed:@"we"]];
//        self.typeLabel.textColor = DPGrayColor;
//    }else{
//        [self.typeImageView setImage:[UIImage imageNamed:@"invoice_selected"]];
//        self.typeLabel.textColor = DPBlueColor;
//    }
    
    if ([self.item.showSeperate isEqualToString:@"3"]) {
        self.separatorInset = DPSeperateInsert;
    }else{
        self.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    }
    
    [[RACObserve(self.item, showSelected) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *show) {
        if ([show isEqualToString:@"1"]) {
            [self.typeImageView setImage:[UIImage imageNamed:@"invoice_selected"]];
            self.typeLabel.textColor = DPBlueColor;
        }else{
            [self.typeImageView setImage:[UIImage imageNamed:@"we"]];
            self.typeLabel.textColor = DPGrayColor;
        }
    }];
    
//
//    [[[RACObserve(self.item, showSelected) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(BOOL showSelected) {
//        if (showSelected) {
//            <#statements#>
//        }
//    }];
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
