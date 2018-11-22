//
//  ExchangeCodeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/19.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "ExchangeCodeCell.h"

@implementation ExchangeCodeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 60;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert2;
    
    [self.contentView addSubview:self.codeTextField];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.codeTextField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, 0, DPMiddleSpacing) ];
    
}

- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [UITextField newAutoLayoutView];
        _codeTextField.textColor = DPDarkGrayColor;
        _codeTextField.placeholder = @"请输入兑换口令/兑换码";
        _codeTextField.font = DPFont6;
        
        DPWeakSelf;
        [_codeTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditting) {
                weakself.item.didEditting(text);
            }
        }];
    }
    return _codeTextField;
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
