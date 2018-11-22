//
//  MyDepositResultCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositResultCell.h"

@implementation MyDepositResultCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.resultImageView];
    [self.contentView addSubview:self.resultLabel];
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.finishButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.resultImageView,self.resultLabel,self.remindLabel,self.finishButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.resultImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:80];
    
    [self.resultLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.resultImageView withOffset:28];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.resultLabel withOffset:24];
    
    [self.finishButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:40];
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.finishButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.finishButton autoSetDimension:ALDimensionHeight toSize:40];
}

- (UIImageView *)resultImageView {
    if (!_resultImageView) {
        _resultImageView = [UIImageView newAutoLayoutView];
        [_resultImageView setImage:[UIImage imageNamed:@"license_success"]];
    }
    return _resultImageView;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [UILabel newAutoLayoutView];
        _resultLabel.attributedText = [NSString setAttributeOfFirstString:@"2000元 " firstFont:DPFont5 firstColor:DPBlueColor secondString:@"退款申请已提交" secondFont:DPFont5 secondColor:DPDarkGrayColor];
    }
    return _resultLabel;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
        
        NSString *str = @"预计7个工作日内原路退回支付账户\n请您耐心等待";
        NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
        
        [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(0, str.length)];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = DPSmallSpacing;
        style.alignment = 1;
        
        [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, str.length)];
        
        _remindLabel.attributedText = setAttributeString;
        
    }
    return _remindLabel;
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = [UIButton newAutoLayoutView];
        _finishButton.backgroundColor = DPBlueColor;
        [_finishButton setTitle:@"完成" forState:0];
        [_finishButton setTitleColor:DPWhiteColor forState:0];
        _finishButton.titleLabel.font = DPFont6;
        
        _finishButton.layer.cornerRadius = 20;
        _finishButton.layer.masksToBounds = YES;
        
        DPWeakSelf;
        [_finishButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(59);
            }
        }];
    }
    return _finishButton;
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
