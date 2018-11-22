//
//  MainUpCarDetailOrderCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarDetailOrderCell.h"

@implementation MainUpCarDetailOrderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 110;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.orderButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.orderButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:50];
        [self.orderButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:50];
        [self.orderButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.orderButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [UIButton newAutoLayoutView];
        [_orderButton setTitle:@"立即预定" forState:0];
        [_orderButton setTitleColor:DPWhiteColor forState:0];
        _orderButton.titleLabel.font = DPFont6;
        _orderButton.backgroundColor = DPBlueColor;
        
        _orderButton.layer.cornerRadius = 25;
        _orderButton.layer.shadowColor = DPBlueColor.CGColor;
        _orderButton.layer.shadowRadius = 5;
        _orderButton.layer.shadowOffset = CGSizeMake(0, 3);
        _orderButton.layer.shadowOpacity = 0.4;
        
        DPWeakSelf;
        [_orderButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(11);
            }
        }];
    }
    return _orderButton;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
