//
//  CarPaymentView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarPaymentView.h"

@implementation CarPaymentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.shadowColor = DPBlackColor.CGColor;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowOpacity = 0.4;
        
//        CALayer *layer = [CALayer layer];
        

        [self addSubview:self.moneyLabel];
        [self addSubview:self.costDetailButton];
        
        [self addSubview:self.ticketLabel];
        [self addSubview:self.chooseTicketButton];
        [self addSubview:self.lineLabel1];
        
        [self addSubview:self.accountLabel];
        [self addSubview:self.accountSelectButton];
        [self addSubview:self.lineLabel2];
        
        [self addSubview:self.wechatTitleButton];
        [self addSubview:self.wechatButton];
        [self addSubview:self.payButton];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    
    [self.moneyLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    
    [self.costDetailButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.moneyLabel];
    [self.costDetailButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.moneyLabel withOffset:DPSmallSpacing];
    
    [self.ticketLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.ticketLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.costDetailButton withOffset:DPBigSpacing];
    
    [self.chooseTicketButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:17];
    [self.chooseTicketButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.ticketLabel];
    
    [self.lineLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.ticketLabel];
    [self.lineLabel1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.lineLabel1 autoSetDimension:ALDimensionHeight toSize:0.5];
    [self.lineLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.ticketLabel withOffset:DPMiddleSpacing];
    
    [self.accountLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel1];
    [self.accountLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel1 withOffset:DPMiddleSpacing];
    
    [self.accountSelectButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel1];
    [self.accountSelectButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.accountLabel];
    
    [self.lineLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.accountLabel];
    [self.lineLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.accountSelectButton];
    [self.lineLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.accountLabel withOffset:DPMiddleSpacing];
    [self.lineLabel2 autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.lineLabel1];
    
    [self.wechatTitleButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel2];
    [self.wechatTitleButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel2 withOffset:DPMiddleSpacing];
    
    [self.wechatButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel2];
    [self.wechatButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.wechatTitleButton];
    
    [self.payButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.wechatTitleButton withOffset:30];
    [self.payButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.payButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.payButton autoSetDimension:ALDimensionHeight toSize:50];
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel newAutoLayoutView];
        _moneyLabel.numberOfLines = 0;
    }
    return _moneyLabel;
}

- (UIButton *)costDetailButton {
    if (!_costDetailButton) {
        _costDetailButton = [UIButton newAutoLayoutView];
        
        [_costDetailButton setTitle:@"费用明细  " forState:0];
        [_costDetailButton setTitleColor:DPLightGrayColor forState:0];
        _costDetailButton.titleLabel.font = DPFont3;
        
        [_costDetailButton swapImage];
        [_costDetailButton setImage:[UIImage imageNamed:@"detail_remind"] forState:0];
        
        DPWeakSelf;
        [_costDetailButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(432);
            }
        }];
    }
    return _costDetailButton;
}

- (UILabel *)ticketLabel {
    if (!_ticketLabel) {
        _ticketLabel = [UILabel newAutoLayoutView];
        _ticketLabel.text = @"优惠券";
        _ticketLabel.textColor = DPDarkGrayColor;
        _ticketLabel.font = DPFont4;
    }
    return _ticketLabel;
}

- (UIButton *)chooseTicketButton {
    if (!_chooseTicketButton) {
        _chooseTicketButton = [UIButton newAutoLayoutView];
        
        [_chooseTicketButton swapImage];
        [_chooseTicketButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        
        DPWeakSelf;
        [_chooseTicketButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(433);
            }
        }];
    }
    return _chooseTicketButton;
}

- (UILabel *)accountLabel {
    if (!_accountLabel) {
        _accountLabel = [UILabel newAutoLayoutView];
        _accountLabel.textColor = DPDarkGrayColor;
        _accountLabel.font = DPFont4;
    }
    return _accountLabel;
}

- (UIButton *)accountSelectButton {
    if (!_accountSelectButton) {
        _accountSelectButton = [UIButton newAutoLayoutView];
        [_accountSelectButton setImage:[UIImage imageNamed:@"bank_noselected"] forState:0];
//        [_accountSelectButton setImage:[UIImage imageNamed:@"invoice_selecteds"] forState:UIControlStateSelected];
        
        DPWeakSelf;
        [_accountSelectButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(435);
            }
        }];
    }
    return _accountSelectButton;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [UILabel newAutoLayoutView];
        _lineLabel1.backgroundColor = DPLineColor2;
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
        _lineLabel2.backgroundColor = DPLineColor2;
    }
    return _lineLabel2;
}

- (UIButton *)wechatTitleButton {
    if (!_wechatTitleButton) {
        _wechatTitleButton = [UIButton newAutoLayoutView];
        [_wechatTitleButton setImage:[UIImage imageNamed:@"wechat_big"] forState:0];
        
        [_wechatTitleButton setTitle:@"  微信支付" forState:0];
        [_wechatTitleButton setTitleColor:DPDarkGrayColor forState:0];
        _wechatTitleButton.titleLabel.font = DPFont4;
    }
    return _wechatTitleButton;
}

- (UIButton *)wechatButton {
    if (!_wechatButton) {
        _wechatButton = [UIButton newAutoLayoutView];
        [_wechatButton setTitleColor:DPDarkGrayColor forState:0];
        _wechatButton.titleLabel.font = DPFont4;
        [_wechatButton swapImage];
        [_wechatButton setImage:[UIImage imageNamed:@"invoice_selecteds"] forState:0];
    }
    return _wechatButton;
}

- (UIButton *)payButton {
    if (!_payButton) {
        _payButton = [UIButton newAutoLayoutView];
        [_payButton setTitle:@"立即支付" forState:0];
        [_payButton setTitleColor:DPWhiteColor forState:0];
        _payButton.titleLabel.font = DPFont6;
        _payButton.layer.cornerRadius = 25;
        _payButton.backgroundColor = DPBlueColor;
        
        _payButton.layer.shadowColor = DPBlueColor.CGColor;
        _payButton.layer.shadowRadius = 5;
        _payButton.layer.shadowOpacity = 0.3;
        _payButton.layer.shadowOffset = CGSizeMake(0, 3);
        
        DPWeakSelf;
        [_payButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(434);
            }
        }];
    }
    return _payButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
