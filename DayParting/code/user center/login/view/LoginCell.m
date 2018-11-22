//
//  LoginCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/30.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 700;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.whiteBackView];
    
    [self.whiteBackView addSubview:self.phoneLabel];
    [self.whiteBackView addSubview:self.lineLabel1];
    [self.whiteBackView addSubview:self.codeTextField];
    [self.whiteBackView addSubview:self.lineLabel2];
    [self.whiteBackView addSubview:self.agreeButton];
    [self.whiteBackView addSubview:self.getCodeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.headerImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:220];
    
    [self.whiteBackView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:DPMiddleSpacing];
    [self.whiteBackView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.whiteBackView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.whiteBackView autoSetDimension:ALDimensionHeight toSize:310];
    
    [self.phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
    [self.phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:34];
    
    [self.lineLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.phoneLabel];
    [self.lineLabel1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.lineLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.phoneLabel withOffset:25];
    [self.lineLabel1 autoSetDimension:ALDimensionHeight toSize:0.5];
    
    [self.codeTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel1];
    [self.codeTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel1 withOffset:25];
    [self.codeTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel1];

    [self.lineLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeTextField];
    [self.lineLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel1];
    [self.lineLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeTextField withOffset:25];
    [self.lineLabel2 autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.lineLabel1];
    
    [self.agreeButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel2];
    [self.agreeButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel2];
    [self.agreeButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.getCodeButton withOffset:-DPBigSpacing];
    
    [self.getCodeButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30];
    [self.getCodeButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.agreeButton];
    [self.getCodeButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel2];
    [self.getCodeButton autoSetDimension:ALDimensionHeight toSize:50];

}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [UIImageView newAutoLayoutView];
        _headerImageView.userInteractionEnabled = YES;
        
        if (IS_IPHONE_X) {
            _headerImageView.image = [UIImage imageNamed:@"signin_top2"];
        }else{
            _headerImageView.image = [UIImage imageNamed:@"signin_top"];
        }
    }
    return _headerImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"登录";
        _titleLabel.textColor = DPWhiteColor;
        _titleLabel.font = DPFont20;
    }
    return _titleLabel;
}

- (UIView *)whiteBackView {
    if (!_whiteBackView) {
        _whiteBackView = [UIView newAutoLayoutView];
        _whiteBackView.backgroundColor = DPWhiteColor;
        _whiteBackView.layer.cornerRadius = 10;
        
        _whiteBackView.layer.shadowColor = DPBlackColor.CGColor;
        _whiteBackView.layer.shadowOffset = CGSizeMake(0, 5);
        _whiteBackView.layer.shadowRadius = 5;
        _whiteBackView.layer.shadowOpacity = 0.06;
    }
    return _whiteBackView;
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        _phoneLabel = [UILabel newAutoLayoutView];
        _phoneLabel.text = @"中国大陆（+86）";
        _phoneLabel.font = DPFont8;
        _phoneLabel.textColor = DPDarkGrayColor;
    }
    return _phoneLabel;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [UILabel newAutoLayoutView];
        _lineLabel1.backgroundColor = DPLineColor2;
    }
    return _lineLabel1;
}


- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [UITextField newAutoLayoutView];
        _codeTextField.placeholder = @"输入您的手机号";
        _codeTextField.font = DPFont6;
        _codeTextField.textColor = DPDarkGrayColor;
        _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
        [_codeTextField becomeFirstResponder];
        
        UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 1)];
        inputView.backgroundColor = DPLightGrayColor17;
        _codeTextField.inputAccessoryView = inputView;
        
        DPWeakSelf;
        [_codeTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (text.length <= 11) {
                if (weakself.item.didEditting) {
                    weakself.item.didEditting(text);
                }
            }else{
                [weakself.codeTextField resignFirstResponder];
            }
        }];
    }
    return _codeTextField;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
        _lineLabel2.backgroundColor = DPLineColor2;
    }
    return _lineLabel2;
}

- (UIButton *)agreeButton {
    if (!_agreeButton) {
        _agreeButton = [UIButton newAutoLayoutView];
        _agreeButton.titleLabel.numberOfLines = 0;
        
        NSString *aaa = @"验证手机号即代表您已同意";
        NSString *nnn = @"《软件服务协议》";
        NSString *ccc = @"并授权征信审核";

        NSString *mmmm = [NSString stringWithFormat:@"%@%@%@",aaa,nnn,ccc];
        [_agreeButton setTitle:mmmm forState:0];
        
        //下划线
        NSMutableAttributedString *originPrice = [[NSMutableAttributedString alloc] initWithString:_agreeButton.titleLabel.text];
        [originPrice setAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:NSMakeRange(aaa.length, nnn.length)];
        [originPrice addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(0, aaa.length)];
        [originPrice addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPBlueColor} range:NSMakeRange(aaa.length, nnn.length)];
        [originPrice addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPLightGrayColor} range:NSMakeRange(aaa.length+nnn.length, ccc.length)];
        [_agreeButton setAttributedTitle:originPrice forState:0];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 8;
        style.alignment = 0;
        [originPrice addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, mmmm.length)];
        
        DPWeakSelf;
        [_agreeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(58);
            }
        }];
    }
    return _agreeButton;
}

- (UIButton *)getCodeButton {
    if (!_getCodeButton) {
        _getCodeButton = [UIButton newAutoLayoutView];
        [_getCodeButton setTitle:@"获取验证码" forState:0];
        [_getCodeButton setTitleColor:DPWhiteColor forState:0];
        _getCodeButton.titleLabel.font = DPFont6;
        
        _getCodeButton.layer.cornerRadius = 25;
        _getCodeButton.backgroundColor = DPBlueColor;
        
        DPWeakSelf;
        [_getCodeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(59);
            }
        }];
    }
    return _getCodeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    DPWeakSelf;
//    [[[RACObserve(self.item, phoneString) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *phone) {
//        weakself.phoneTextField.text = phone;
//    }];
//
//    [[[RACObserve(self.item, codeString) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *code) {
//        weakself.codeTextField.text = code;
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
