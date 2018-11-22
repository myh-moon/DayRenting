//
//  InvoiceGenerateChooseCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "InvoiceGenerateChooseCell.h"

@implementation InvoiceGenerateChooseCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.electronicInvoiceButton];
    [self.contentView addSubview:self.paperInvoiceButton];
    [self.contentView addSubview:self.remindLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.electronicInvoiceButton,self.paperInvoiceButton];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:DPMiddleSpacing insetSpacing:YES];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    [views autoSetViewsDimension:ALDimensionHeight toSize:60];
    
    [self.remindLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.electronicInvoiceButton];
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.electronicInvoiceButton withOffset:DPMiddleSpacing];
}

- (UIButton *)electronicInvoiceButton {
    if (!_electronicInvoiceButton) {
        _electronicInvoiceButton = [UIButton newAutoLayoutView];
        _electronicInvoiceButton.titleLabel.numberOfLines = 0;
        _electronicInvoiceButton.layer.cornerRadius = 3;
        _electronicInvoiceButton.layer.borderWidth = 1;
        _electronicInvoiceButton.layer.borderColor = DPBlueColor.CGColor;
        
        NSMutableAttributedString *choose1 = [NSString setAttributeOfFirstString:@"电子发票\n" firstFont:DPFont5 firstColor:DPBlueColor secondString:@"最快5分钟开具" secondFont:DPFont3 secondColor:DPBlueColor align:1 space:5];
        [_electronicInvoiceButton setAttributedTitle:choose1 forState:0];
        
        DPWeakSelf;
        [_electronicInvoiceButton addAction:^(UIButton *btn) {
            
            NSMutableAttributedString *choose1 = [NSString setAttributeOfFirstString:@"电子发票\n" firstFont:DPFont5 firstColor:DPBlueColor secondString:@"最快5分钟开具" secondFont:DPFont3 secondColor:DPBlueColor align:1 space:5];
            [btn setAttributedTitle:choose1 forState:0];
            btn.layer.borderColor = DPBlueColor.CGColor;
            
            NSMutableAttributedString *choose2 = [NSString setAttributeOfFirstString:@"纸质发票\n" firstFont:DPFont5 firstColor:DPGrayColor secondString:@"预计5天内送达" secondFont:DPFont3 secondColor:DPGrayColor align:1 space:5];
            [weakself.paperInvoiceButton setAttributedTitle:choose2 forState:0];
            weakself.paperInvoiceButton.layer.borderColor = DPLightGrayColor.CGColor;
            
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(56);
            }
        }];
    }
    return _electronicInvoiceButton;
}

- (UIButton *)paperInvoiceButton {
    if (!_paperInvoiceButton) {
        _paperInvoiceButton = [UIButton newAutoLayoutView];
        _paperInvoiceButton.titleLabel.numberOfLines = 0;
        _paperInvoiceButton.layer.cornerRadius = 3;
        _paperInvoiceButton.layer.borderWidth = 1;
        _paperInvoiceButton.layer.borderColor = DPLightGrayColor.CGColor;
        
        NSMutableAttributedString *choose1 = [NSString setAttributeOfFirstString:@"纸质发票\n" firstFont:DPFont5 firstColor:DPGrayColor secondString:@"预计5天内送达" secondFont:DPFont3 secondColor:DPGrayColor align:1 space:5];
        [_paperInvoiceButton setAttributedTitle:choose1 forState:0];
        
        DPWeakSelf;
        [_paperInvoiceButton addAction:^(UIButton *btn) {
            
            NSMutableAttributedString *choose1 = [NSString setAttributeOfFirstString:@"纸质发票\n" firstFont:DPFont5 firstColor:DPBlueColor secondString:@"预计5天内送达" secondFont:DPFont3 secondColor:DPBlueColor align:1 space:5];
            [btn setAttributedTitle:choose1 forState:0];
            btn.layer.borderColor = DPBlueColor.CGColor;
            
            NSMutableAttributedString *choose2 = [NSString setAttributeOfFirstString:@"电子发票\n" firstFont:DPFont5 firstColor:DPGrayColor secondString:@"最快5分钟开具" secondFont:DPFont3 secondColor:DPGrayColor align:1 space:5];
            [weakself.electronicInvoiceButton setAttributedTitle:choose2 forState:0];
            weakself.electronicInvoiceButton.layer.borderColor = DPLightGrayColor.CGColor;
            
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(57);
            }
        }];
    }
    return _paperInvoiceButton;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"电子发票与纸质发票具有同等法律效力，可支持报销入账";
        _remindLabel.textColor = DPLightGrayColor17;
        _remindLabel.font = DPFont2;
    }
    return _remindLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    
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
