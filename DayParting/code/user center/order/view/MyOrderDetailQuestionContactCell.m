//
//  MyOrderDetailQuestionContactCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailQuestionContactCell.h"

@implementation MyOrderDetailQuestionContactCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 250;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.submitButton];
    [self.contentView addSubview:self.contactButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.submitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(40, DPMiddleSpacing, 0, DPMiddleSpacing) excludingEdge:ALEdgeBottom];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:40];

    [self.contactButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.submitButton];
    [self.contactButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.submitButton withOffset:26];

}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        _submitButton.layer.cornerRadius = 20;
        _submitButton.layer.masksToBounds = YES;
        _submitButton.backgroundColor = DPBlueColor;
        
        [_submitButton setTitle:@"提交" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(364);
            }
        }];
    }
    return _submitButton;
}

- (UIButton *)contactButton {
    if (!_contactButton) {
        _contactButton = [UIButton newAutoLayoutView];
        [_contactButton setTitle:@"  直接联系客服" forState:0];
        [_contactButton setTitleColor:DPDarkGrayColor forState:0];
        _contactButton.titleLabel.font = DPFont3;
        
        [_contactButton setImage:[UIImage imageNamed:@"invoice_question"] forState:0];
        
        DPWeakSelf;
        [_contactButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(365);
            }
        }];
    }
    return _contactButton;
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
