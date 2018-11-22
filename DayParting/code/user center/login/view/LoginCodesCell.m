//
//  LoginCodesCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/2.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "LoginCodesCell.h"

@implementation LoginCodesCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight - 64;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.phoneLabel];

    [self.contentView addSubview:self.codeTextField];

    [self.codeTextField addSubview:self.codeLabel1];
    [self.codeTextField addSubview:self.codeLabel2];
    [self.codeTextField addSubview:self.codeLabel3];
    [self.codeTextField addSubview:self.codeLabel4];
    
    [self.contentView addSubview:self.warningImageView];
    [self.contentView addSubview:self.warningLabel];
    
    [self.contentView addSubview:self.getCodeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.phoneLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:50];
    
    [self.codeTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.phoneLabel withOffset:55];
    [self.codeTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.codeTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.codeTextField autoSetDimension:ALDimensionHeight toSize:55];

    NSArray *views = @[self.codeLabel1,self.codeLabel2,self.codeLabel3,self.codeLabel4];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:55 insetSpacing:YES];
    [views autoMatchViewsDimension:ALDimensionHeight];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.warningImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeLabel1 withOffset:DPBigSpacing];
    [self.warningImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.phoneLabel];
    
    [self.warningLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.warningImageView];
    [self.warningLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.warningImageView];
    [self.warningLabel autoSetDimensionsToSize:CGSizeMake(180, 35)];
    
    [self.getCodeButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:230];
    [self.getCodeButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.phoneLabel];
    
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        _phoneLabel = [UILabel newAutoLayoutView];
        _phoneLabel.numberOfLines = 0;
    }
    return _phoneLabel;
}

- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [UITextField newAutoLayoutView];
        _codeTextField.backgroundColor = [UIColor clearColor];
        _codeTextField.textColor = [UIColor clearColor];
        [_codeTextField resignFirstResponder];
        _codeTextField.tintColor = [UIColor clearColor];
        _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
        
        UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 1)];
        inputView.backgroundColor = DPLightGrayColor17;
        _codeTextField.inputAccessoryView = inputView;
        
        DPWeakSelf;
        [_codeTextField.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditting) {
                weakself.item.didEditting(text);
            }
        }];
    }
    return _codeTextField;
}

- (UILabel *)codeLabel1 {
    if (!_codeLabel1) {
        _codeLabel1 = [UILabel newAutoLayoutView];
        _codeLabel1.layer.cornerRadius = 10;
        _codeLabel1.textAlignment = NSTextAlignmentCenter;
        _codeLabel1.textColor = DPBlackColor;
        _codeLabel1.font = [UIFont systemFontOfSize:25];
        
        _codeLabel1.layer.borderWidth = 0.5;
        _codeLabel1.layer.borderColor = DPLightGrayColor17.CGColor;
        
        [_codeLabel1 becomeFirstResponder];
        
    }
    return _codeLabel1;
}

- (UILabel *)codeLabel2 {
    if (!_codeLabel2) {
        _codeLabel2 = [UILabel newAutoLayoutView];
        _codeLabel2.layer.cornerRadius = 10;
        _codeLabel2.textAlignment = NSTextAlignmentCenter;
        _codeLabel2.textColor = DPBlackColor;
        _codeLabel2.font = [UIFont systemFontOfSize:25];
        
        _codeLabel2.layer.borderWidth = 0.5;
        _codeLabel2.layer.borderColor = DPLightGrayColor17.CGColor;

        
    }
    return _codeLabel2;
}

- (UILabel *)codeLabel3 {
    if (!_codeLabel3) {
        _codeLabel3 = [UILabel newAutoLayoutView];
        _codeLabel3.layer.cornerRadius = 10;
        _codeLabel3.textAlignment = NSTextAlignmentCenter;
        _codeLabel3.textColor = DPBlackColor;
        _codeLabel3.font = [UIFont systemFontOfSize:25];
        
        _codeLabel3.layer.borderWidth = 0.5;
        _codeLabel3.layer.borderColor = DPLightGrayColor17.CGColor;

        
    }
    return _codeLabel3;
}

- (UILabel *)codeLabel4 {
    if (!_codeLabel4) {
        _codeLabel4 = [UILabel newAutoLayoutView];
        _codeLabel4.layer.cornerRadius = 10;
        _codeLabel4.textAlignment = NSTextAlignmentCenter;
        _codeLabel4.textColor = DPBlackColor;
        _codeLabel4.font = [UIFont systemFontOfSize:25];
        
        _codeLabel4.layer.borderWidth = 0.5;
        _codeLabel4.layer.borderColor = DPLightGrayColor17.CGColor;
        
    }
    return _codeLabel4;
}

- (UIImageView *)warningImageView {
    if (!_warningImageView) {
        _warningImageView = [UIImageView newAutoLayoutView];
        _warningImageView.image = [UIImage imageNamed:@"triangle"];
    }
    return _warningImageView;
}

- (UILabel *)warningLabel {
    if (!_warningLabel) {
        _warningLabel = [UILabel newAutoLayoutView];
        _warningLabel.text = @"请输入正确验证码";
        _warningLabel.textColor = DPWhiteColor;
        _warningLabel.font = DPFont4;
        _warningLabel.textAlignment = NSTextAlignmentCenter;
        
        _warningLabel.backgroundColor = DPOrangeColor2;
        _warningLabel.layer.cornerRadius = 6;
        _warningLabel.layer.masksToBounds = YES;
    }
    return _warningLabel;
}


- (UIButton *)getCodeButton {
    if (!_getCodeButton) {
        _getCodeButton = [UIButton newAutoLayoutView];
        _getCodeButton.titleLabel.font = DPFont4;
        
        DPWeakSelf;
        [_getCodeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(111);
            }
        }];
    }
    return _getCodeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSString *phon = [NSString stringWithFormat:@"（+86）%@ ",self.item.phoneStr];
    self.phoneLabel.attributedText = [NSString setAttributeOfFirstString:@"输入发送至以下手机号的验证码：\n" firstFont:DPFont7 firstColor:DPDarkGrayColor secondString:phon secondFont:DPFont6 secondColor:DPLightGrayColor align:1 space:DPMiddleSpacing];
    
    DPWeakSelf;
    [[RACObserve(self.item, codeStr) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *code) {
        
        //1.内容显示
        weakself.codeLabel1.text = code.length > 0 ? [code substringToIndex:1] : @"";
        weakself.codeLabel2.text = code.length >= 2 ? [code substringWithRange:NSMakeRange(1, 1)] : @"";
        weakself.codeLabel3.text = code.length >= 3 ? [code substringWithRange:NSMakeRange(2, 1)] : @"";
        weakself.codeLabel4.text = code.length >= 4 ? [code substringWithRange:NSMakeRange(3, 1)] : @"";
    }];
    
    
    //倒计时
    [[RACObserve(self.item, secondStr) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *second) {
        [weakself.getCodeButton setTitle:second forState:0];
        if ([second containsString:@"s"]) {
            [weakself.getCodeButton setTitleColor:DPLightGrayColor forState:0];
        }else{
            [weakself.getCodeButton setTitleColor:DPBlueColor forState:0];
        }
    }];
    
    [[RACObserve(self.item, statusStr) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *status) {
        if ([status isEqualToString:@"0"]) {
            [weakself.warningImageView setHidden:YES];
            [weakself.warningLabel setHidden:YES];
            weakself.item.codeStr = @"";
            weakself.codeTextField.text = nil;
        }else{
            [weakself.warningImageView setHidden:NO];
            [weakself.warningLabel setHidden:NO];
            
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
