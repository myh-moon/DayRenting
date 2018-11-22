//
//  MyCardCodeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardCodeCell.h"

@implementation MyCardCodeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 62;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
        self.separatorInset = DPSeperateInsert2;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentTextField];
    [self.contentView addSubview:self.getCodeButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:95];
    [self.contentTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
    
    [self.getCodeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.getCodeButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.contentTextField];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPGrayColor;
        _titleLabel.font = DPFont5;
    }
    return _titleLabel;
}

- (UITextField *)contentTextField {
    if (!_contentTextField) {
        _contentTextField = [UITextField newAutoLayoutView];
        _contentTextField.textColor = DPDarkGrayColor;
        _contentTextField.font = DPFont5;
    }
    return _contentTextField;
}

- (UIButton *)getCodeButton {
    if (!_getCodeButton) {
        _getCodeButton = [UIButton newAutoLayoutView];
//        [_getCodeButton setTitle:@"获取验证码" forState:0];
        _getCodeButton.titleLabel.font = DPFont3;
        
        DPWeakSelf;
        [_getCodeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(21);
            }
        }];
    }
    return _getCodeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    self.contentTextField.placeholder = self.item.placeholderString;
    
    DPWeakSelf;
    [[RACObserve(self.item, time) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *tt) {
        //倒计时
        [self.getCodeButton setTitle:self.item.time forState:0];
        
        if ([self.item.time isEqualToString:@"获取验证码"]) {
            [self.getCodeButton setTitleColor:DPBlueColor forState:0];
        }else{
            [self.getCodeButton setTitleColor:DPLightGrayColor17 forState:0];
        }

    }];
    
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
