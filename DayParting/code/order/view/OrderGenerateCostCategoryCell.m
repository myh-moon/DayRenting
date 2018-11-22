//
//  OrderGenerateCostCategoryCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateCostCategoryCell.h"

@implementation OrderGenerateCostCategoryCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 42;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.categoryButton];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.categoryButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.categoryButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont4;
    }
    return _titleLabel;
}

- (UIButton *)categoryButton {
    if (!_categoryButton) {
        _categoryButton = [UIButton newAutoLayoutView];
        [_categoryButton setTitleColor:DPDarkGrayColor forState:0];
        _categoryButton.titleLabel.font = DPFont4;
        [_categoryButton swapImage];
    }
    return _categoryButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.categoryButton setTitle:self.item.moneyString forState:0];
    
    if ([self.item.category isEqualToString:@"1"]) {  //公里计费
        NSString *firstString = self.item.titleString;
        NSString *secondString = @"元/分钟 + ";
        NSString *thirdString = self.item.titleString2;
        NSString *fourString = @"元/公里";
        
        NSString *str = [NSString stringWithFormat:@"%@%@%@%@",firstString,secondString,thirdString,fourString];
        NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
        
        [setAttributeString addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPBlueColor} range:NSMakeRange(0, firstString.length)];
        [setAttributeString addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(firstString.length, secondString.length)];
        [setAttributeString addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPBlueColor} range:NSMakeRange(firstString.length+secondString.length, thirdString.length)];
        [setAttributeString addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(firstString.length+secondString.length+thirdString.length, thirdString.length)];
        
        self.titleLabel.attributedText = setAttributeString;
        
        
    }else if ([self.item.category isEqualToString:@"2"]){//租车押金
        self.titleLabel.text = self.item.titleString;
        
        [self.categoryButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        [self.categoryButton setTitleColor:DPGreenColor forState:0];
    }else{//common
         self.titleLabel.text = self.item.titleString;
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
