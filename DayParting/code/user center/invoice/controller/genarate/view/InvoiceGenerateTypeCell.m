//
//  InvoiceGenerateTypeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "InvoiceGenerateTypeCell.h"

@implementation InvoiceGenerateTypeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.enterpriseButton];
    [self.contentView addSubview:self.personalButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.titleLabel,self.enterpriseButton,self.personalButton];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    
    [self.enterpriseButton autoPinEdge:ALEdgeLeft  toEdge:ALEdgeRight ofView:self.titleLabel withOffset:DPBigSpacing];
    
    [self.personalButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.enterpriseButton withOffset:30];
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"抬头类型";
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont4;
    }
    return _titleLabel;
}

- (UIButton *)enterpriseButton {
    if (!_enterpriseButton) {
        _enterpriseButton = [UIButton newAutoLayoutView];
        [_enterpriseButton setTitle:@"  企业单位" forState:0];
        [_enterpriseButton setTitleColor:DPDarkGrayColor forState:0];
        _enterpriseButton.titleLabel.font = DPFont4;
        [_enterpriseButton setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];
        
        DPWeakSelf;
        [_enterpriseButton addAction:^(UIButton *btn) {
            
            [btn setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];

            [weakself.personalButton setImage:[UIImage imageNamed:@"invoice_noselected"] forState:0];
            
            if (weakself.item.didSelectedBtn) {
//            weakself.item.selectedType = @"1";
                weakself.item.didSelectedBtn(38);
            }
         
        }];
    }
    return _enterpriseButton;
}

- (UIButton *)personalButton {
    if (!_personalButton) {
        _personalButton = [UIButton newAutoLayoutView];
        [_personalButton setTitle:@"  个人/非企业单位" forState:0];
        [_personalButton setTitleColor:DPDarkGrayColor forState:0];
        _personalButton.titleLabel.font = DPFont4;
        [_personalButton setImage:[UIImage imageNamed:@"invoice_noselected"] forState:0];
        
        DPWeakSelf;
        [_personalButton addAction:^(UIButton *btn) {
            
            [btn setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];
            
            [weakself.enterpriseButton setImage:[UIImage imageNamed:@"invoice_noselected"] forState:0];
            
            if (weakself.item.didSelectedBtn) {
//                weakself.item.selectedType = @"2";
                weakself.item.didSelectedBtn(39);
            }
            

        }];
    }
    return _personalButton;
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
