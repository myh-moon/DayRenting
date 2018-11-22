//
//  MainUpCarDetailCostCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarDetailCostCell.h"

@implementation MainUpCarDetailCostCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.costButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.costButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.costButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
    }
    return _titleLabel;
}

- (UIButton *)costButton {
    if (!_costButton) {
        _costButton = [UIButton newAutoLayoutView];
        [_costButton setTitle:@"费用说明  " forState:0];
        [_costButton setTitleColor:DPLightGrayColor forState:0];
        _costButton.titleLabel.font = DPFont3;
        [_costButton swapImage];
        [_costButton setImage:[UIImage imageNamed:@"detail_remind"] forState:0];
    }
    return _costButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    //计费
    NSString *firstString = self.item.tsmoney;
    NSString *secondString = @"元/分钟 + ";
    NSString *thirdString = self.item.smoney;
    NSString *fourString = @"元/公里";
    
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@%@",firstString,secondString,thirdString,fourString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPBlueColor} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(firstString.length, secondString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPBlueColor} range:NSMakeRange(firstString.length+secondString.length, thirdString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(firstString.length+secondString.length+thirdString.length, thirdString.length)];
    
    self.titleLabel.attributedText = setAttributeString;
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
