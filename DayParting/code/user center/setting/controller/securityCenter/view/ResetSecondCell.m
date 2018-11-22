//
//  ResetSecondCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/11.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "ResetSecondCell.h"

@implementation ResetSecondCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.showButton];
    [self.contentView addSubview:self.pwdTextField];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.headerImageView,self.remindLabel,self.showButton,self.pwdTextField];
    [views autoAlignViewsToAxis:ALAxisVertical];

    [self.headerImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    [self.headerImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerImageView withOffset:32];

    [self.showButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:35];

    [self.pwdTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.showButton withOffset:38];
    [self.pwdTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.pwdTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.pwdTextField autoSetDimension:ALDimensionHeight toSize:55];

}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [UIImageView newAutoLayoutView];
        [_headerImageView setImage:[UIImage imageNamed:@"password_code"]];
    }
    return _headerImageView;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"设置6位数字支付密码：";
        _remindLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _remindLabel.textColor = DPDarkGrayColor;
    }
    return _remindLabel;
}

- (UIButton *)showButton {
    if (!_showButton) {
        _showButton = [UIButton newAutoLayoutView];
        [_showButton setImage:[UIImage imageNamed:@"eye_off"] forState:0];
        [_showButton setImage:[UIImage imageNamed:@"eye_open"] forState:UIControlStateSelected];
        
        
        DPWeakSelf;
        [_showButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
            if (btn.selected) {
//                weakself.pwdTextField.securityCharacterType = SecurityCharacterTypeSecurityDot;
                weakself.item.textType = @"1";
            }else{
//                weakself.pwdTextField.securityCharacterType = SecurityCharacterTypePlainText;
                weakself.item.textType = @"0";
            }
        }];
    }
    return _showButton;
}

- (LYSecurityField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypePlainText borderType:BorderTypeHaveRoundedCorner];
        _pwdTextField.tintColor = DPLightGrayColor4;

        UIView *lloloView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 1)];
        lloloView.backgroundColor = DPLightGrayColor17;
        _pwdTextField.inputAccessoryView =lloloView;
        
        DPWeakSelf;
        _pwdTextField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
            if (weakself.item.didEditting) {
                weakself.item.didEditting(text);
            }
        };
    }
    return _pwdTextField;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.pwdTextField clear];
    
//
//    [[RACObserve(self.item, textType) takeUntil:[self rac_prepareForReuseSignal]]subscribeNext:^(id x) {
//        if ([self.item.textType isEqualToString:@"0"]) {//暗文
//            self.pwdTextField.securityCharacterType = SecurityCharacterTypeSecurityDot;
//        }else{//明文
//            self.pwdTextField.securityCharacterType = SecurityCharacterTypePlainText;
//        }
//    }];
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
