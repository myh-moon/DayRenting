//
//  MyOrderDetailQuestionCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailQuestionCell.h"

@implementation MyOrderDetailQuestionCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    self.layer.shadowColor = DPBlackColor.CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowOpacity = 0.06;
    
    [self.contentView addSubview:self.titleLabel];
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.numberOfLines = 0;
        _titleLabel.attributedText = [NSString setAttributeOfFirstString:@"订单疑问原因\n" firstFont:DPFont8 firstColor:DPBlackColor secondString:@"请选择订单异议原因，我们会及时为您处理" secondFont:DPFont4 secondColor:DPLightGrayColor align:0 space:DPMiddleSpacing];
    }
    return _titleLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.attributedText = [NSString setAttributeOfFirstString:self.item.titleString firstFont:DPFont8 firstColor:DPBlackColor secondString:self.item.contentString secondFont:DPFont4 secondColor:DPLightGrayColor align:0 space:DPMiddleSpacing];

    
//    _titleLabel.attributedText = [NSString setAttributeOfFirstString:@"订单疑问原因\n" firstFont:DPFont8 firstColor:DPBlackColor secondString:@"请选择订单异议原因，我们会及时为您处理" secondFont:DPFont4 secondColor:DPLightGrayColor align:0 space:DPMiddleSpacing];
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
