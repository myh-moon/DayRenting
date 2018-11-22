//
//  MyWalletRechargeSubmitCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletRechargeSubmitCell.h"

@implementation MyWalletRechargeSubmitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 110;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset  =DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.submitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(50, 40, 0, 40) excludingEdge:ALEdgeBottom];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"立即充值" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        _submitButton.backgroundColor = DPBlueColor;
        
        _submitButton.layer.cornerRadius = 25;
        
        _submitButton.layer.shadowColor = DPBlueColor.CGColor;
        _submitButton.layer.shadowOffset = CGSizeMake(0, 3);
        _submitButton.layer.shadowOpacity = 0.4;
        _submitButton.layer.shadowRadius = 5;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(1234);
            }
        }];
    }
    return _submitButton;
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
