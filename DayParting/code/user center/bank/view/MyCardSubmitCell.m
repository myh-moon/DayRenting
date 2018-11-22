//
//  MyCardSubmitCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardSubmitCell.h"

@implementation MyCardSubmitCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 150;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.submitButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.submitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(35, 40, 65, 40)];
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        _submitButton.layer.cornerRadius = 25;
        
        _submitButton.backgroundColor = DPBlueColor;
        [_submitButton setTitle:@"绑定信用卡" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        
        _submitButton.layer.shadowColor = DPBlueColor.CGColor;
        _submitButton.layer.shadowOffset = CGSizeMake(3, 3);
        _submitButton.layer.shadowRadius = 5;
        _submitButton.layer.shadowOpacity = 0.4;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(7878);
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
