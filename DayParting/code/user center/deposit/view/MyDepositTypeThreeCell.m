//
//  MyDepositTypeThreeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositTypeThreeCell.h"

@implementation MyDepositTypeThreeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 170;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.powerButton];
    [self.contentView addSubview:self.remindLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.moneyLabel,self.powerButton,self.remindLabel];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];

    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.powerButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.moneyLabel withOffset:DPBigSpacing];
    [self.powerButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.powerButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.powerButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.powerButton withOffset:35];
    [self.remindLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.powerButton];
    [self.remindLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.powerButton];

    
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.text = @"可退金额：2000.00元";
        _moneyLabel.textColor = DPDarkGrayColor;
        _moneyLabel.font = DPFont3;
    }
    return _moneyLabel;
}

- (UIButton *)powerButton {
    if (!_powerButton) {
        _powerButton = [UIButton newAutoLayoutView];
        [_powerButton setTitle:@"申请退还押金" forState:0];
        [_powerButton setTitleColor:DPWhiteColor forState:0];
        _powerButton.titleLabel.font = DPFont6;
        _powerButton.backgroundColor = DPBlueColor;
        
        _powerButton.layer.cornerRadius = 25;
        _powerButton.layer.shadowColor = DPBlueColor.CGColor;
        _powerButton.layer.shadowOffset = CGSizeMake(0, 3);
        _powerButton.layer.shadowRadius = 5;
        _powerButton.layer.shadowOpacity = 0.4;
        
        DPWeakSelf;
        [_powerButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(57);
            }
        }];
    }
    return _powerButton;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
//        _remindLabel.text = @"成功提交申请后，我们会在7个工作日内，将押金退还至原支付账户";
//        _remindLabel.textColor = DPLightGrayColor;
//        _remindLabel.font = DPFont3;
        
        
        NSString *str = @"成功提交申请后，我们会在7个工作日内，将押金退还至原支付账户";
        NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
        
        [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(0, str.length)];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = DPSmallSpacing;
        style.alignment = 0;
        
        [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, str.length)];
        
        _remindLabel.attributedText = setAttributeString;
    }
    return _remindLabel;
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
