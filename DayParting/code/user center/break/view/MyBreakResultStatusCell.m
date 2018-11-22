//
//  MyBreakResultStatusCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakResultStatusCell.h"

@implementation MyBreakResultStatusCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.statusPoint1];
    [self.contentView addSubview:self.statusPoint2];
    [self.contentView addSubview:self.statusPoint3];
    
    [self.contentView addSubview:self.statusLine1];
    [self.contentView addSubview:self.statusLine2];
    [self.contentView addSubview:self.statusLine3];
    [self.contentView addSubview:self.statusLine4];

    [self.contentView addSubview:self.statusTextLabel1];
    [self.contentView addSubview:self.statusTextLabel2];
    [self.contentView addSubview:self.statusTextLabel3];
    
    //白色背景下的b控件
    [self.contentView addSubview:self.backWhiteImageView];
    
    [self.backWhiteImageView addSubview:self.successImageView];
    [self.backWhiteImageView addSubview:self.resultLabel];
    [self.backWhiteImageView addSubview:self.remindLabel];
    [self.backWhiteImageView addSubview:self.submitButton];
    [self.backWhiteImageView addSubview:self.payButton];
    
    [self.backWhiteImageView addSubview:self.lineLabel];
    
    [self.backWhiteImageView addSubview:self.numberLabel1];
    [self.backWhiteImageView addSubview:self.licenseLabel1];
    [self.backWhiteImageView addSubview:self.codeLabel1];
    [self.backWhiteImageView addSubview:self.contentLabel1];
    [self.backWhiteImageView addSubview:self.timeLabel1];
    [self.backWhiteImageView addSubview:self.addressLabel1];
    [self.backWhiteImageView addSubview:self.deductionLabel1];
    [self.backWhiteImageView addSubview:self.moneyLabel1];
    [self.backWhiteImageView addSubview:self.lateFeeLabel1];

    [self.backWhiteImageView addSubview:self.numberLabel2];
    [self.backWhiteImageView addSubview:self.licenseLabel2];
    [self.backWhiteImageView addSubview:self.codeLabel2];
    [self.backWhiteImageView addSubview:self.contentLabel2];
    [self.backWhiteImageView addSubview:self.timeLabel2];
    [self.backWhiteImageView addSubview:self.addressLabel2];
    [self.backWhiteImageView addSubview:self.deductionLabel2];
    [self.backWhiteImageView addSubview:self.moneyLabel2];
    [self.backWhiteImageView addSubview:self.lateFeeLabel2];

    
    [self setNeedsUpdateConstraints];
    
    self.topWhiteResultConstraints = [self.resultLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:38];
    self.topWhiteLineConstraints = [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:35];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.statusPoint1,self.statusPoint2,self.statusPoint3];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:17 insetSpacing:NO];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    [views autoSetViewsDimension:ALDimensionHeight toSize: 17];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:45];
    [[views lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:45];
    
    NSArray *views2 = @[self.statusLine1,self.statusLine2,self.statusLine3,self.statusLine4];
    [views2 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views2 firstObject] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.statusPoint1];
    [views2 autoSetViewsDimension:ALDimensionHeight toSize:2];
    [views2 autoSetViewsDimension:ALDimensionWidth toSize:(DPWindowWidth-45*2-17*3-6*4)/4];
    
    [self.statusLine1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.statusPoint1 withOffset:4];
    [self.statusLine2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.statusPoint2 withOffset:-4];
    [self.statusLine3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.statusPoint2 withOffset:4];
    [self.statusLine4 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.statusPoint3 withOffset:-4];
    
    NSArray *views3 = @[self.statusTextLabel1,self.statusTextLabel2,self.statusTextLabel3];
    [views3 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views3 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.statusPoint1 withOffset:20];
    
    [self.statusTextLabel1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.statusPoint1];
    [self.statusTextLabel2 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.statusPoint2];
    [self.statusTextLabel3 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.statusPoint3];

    [self.backWhiteImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPBigSpacing, DPMiddleSpacing) excludingEdge:ALEdgeTop];
    [self.backWhiteImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.statusTextLabel1 withOffset:25];
    
    [self.successImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:38];
    [self.successImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.resultLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.successImageView];
    
    [self.remindLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.resultLabel];
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.resultLabel withOffset:23];
    
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
    [self.submitButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:40];
    [self.submitButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
    
    [self.payButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.submitButton];
    [self.payButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.submitButton withOffset:DPMiddleSpacing];

    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.lineLabel autoSetDimension:ALDimensionHeight toSize:0.5];
    
    //text
    NSArray *views4 = @[self.numberLabel1,self.licenseLabel1,self.codeLabel1,self.contentLabel1,self.timeLabel1,self.addressLabel1,self.deductionLabel1,self.moneyLabel1,self.lateFeeLabel1];
    UIView *preview;
    for (UIView *vieww in views4) {
        if (preview) {
            [vieww autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:preview];
            [vieww autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:preview withOffset:30];
        }else{
            [vieww autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.lineLabel];
            [vieww autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel withOffset:30];
        }
        preview = vieww;
    }
    
    NSArray *views5 = @[self.numberLabel2,self.licenseLabel2,self.codeLabel2,self.contentLabel2,self.timeLabel2,self.addressLabel2,self.deductionLabel2,self.moneyLabel2,self.lateFeeLabel2];
    UIView *preview1;
    for (UIView *viewww in views5) {
        if (preview1) {
            [viewww autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:preview1];
            [viewww autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:preview1 withOffset:30];
        }else{
            [viewww autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.lineLabel];
            [viewww autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.numberLabel1];
        }
        preview1 = viewww;
    }
    
}

- (UIImageView *)statusPoint1 {
    if (!_statusPoint1) {
        _statusPoint1 = [UIImageView newAutoLayoutView];
        [_statusPoint1 setImage:[UIImage imageNamed:@"authenty_gray"]];//authenty_hollow
    }
    return _statusPoint1;
}

- (UIImageView *)statusPoint2 {
    if (!_statusPoint2) {
        _statusPoint2 = [UIImageView newAutoLayoutView];
        [_statusPoint2 setImage:[UIImage imageNamed:@"authenty_gray"]];//authenty_hollow
    }
    return _statusPoint2;
}

- (UIImageView *)statusPoint3 {
    if (!_statusPoint3) {
        _statusPoint3 = [UIImageView newAutoLayoutView];
        [_statusPoint3 setImage:[UIImage imageNamed:@"authenty_hollow"]];//authenty_hollow
    }
    return _statusPoint3;
}

- (UILabel *)statusLine1 {
    if (!_statusLine1) {
        _statusLine1 = [UILabel newAutoLayoutView];
        _statusLine1.backgroundColor = DPBlueColor;
    }
    return _statusLine1;
}

- (UILabel *)statusLine2 {
    if (!_statusLine2) {
        _statusLine2 = [UILabel newAutoLayoutView];
        _statusLine2.backgroundColor = DPBlueColor;
    }
    return _statusLine2;
}

- (UILabel *)statusLine3 {
    if (!_statusLine3) {
        _statusLine3 = [UILabel newAutoLayoutView];
        _statusLine3.backgroundColor = DPBlueColor;
    }
    return _statusLine3;
}

- (UILabel *)statusLine4 {
    if (!_statusLine4) {
        _statusLine4 = [UILabel newAutoLayoutView];
        _statusLine4.backgroundColor = DPLightGrayColor20;
    }
    return _statusLine4;
}

- (UILabel *)statusTextLabel1 {
    if (!_statusTextLabel1) {
        _statusTextLabel1 = [UILabel newAutoLayoutView];
        _statusTextLabel1.numberOfLines = 0;
    }
    return _statusTextLabel1;
}

- (UILabel *)statusTextLabel2 {
    if (!_statusTextLabel2) {
        _statusTextLabel2 = [UILabel newAutoLayoutView];
        _statusTextLabel2.numberOfLines = 0;
    }
    return _statusTextLabel2;
}

- (UILabel *)statusTextLabel3 {
    if (!_statusTextLabel3) {
        _statusTextLabel3 = [UILabel newAutoLayoutView];
        _statusTextLabel3.numberOfLines = 0;
    }
    return _statusTextLabel3;
}

- (UIImageView *)backWhiteImageView {
    if (!_backWhiteImageView) {
        _backWhiteImageView = [UIImageView newAutoLayoutView];
        _backWhiteImageView.backgroundColor = DPWhiteColor;
        _backWhiteImageView.userInteractionEnabled = YES;
        
        _backWhiteImageView.layer.cornerRadius = 6;
        _backWhiteImageView.layer.shadowColor = DPBlackColor.CGColor;
        _backWhiteImageView.layer.shadowOffset = CGSizeMake(3, 3);
        _backWhiteImageView.layer.shadowRadius = 5;
        _backWhiteImageView.layer.shadowOpacity = 0.06;
    }
    return _backWhiteImageView;
}

- (UIImageView *)successImageView {
    if (!_successImageView) {
        _successImageView = [UIImageView newAutoLayoutView];
        [_successImageView setImage:[UIImage imageNamed:@"license_success"]];
    }
    return _successImageView;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [UILabel newAutoLayoutView];
        _resultLabel.font = DPFont6;
    }
    return _resultLabel;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
    }
    return _remindLabel;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        _submitButton.backgroundColor = DPBlueColor;
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        
        _submitButton.layer.cornerRadius = 25;
        _submitButton.layer.shadowColor = DPBlueColor.CGColor;
        _submitButton.layer.shadowOffset = CGSizeMake(3, 3);
        _submitButton.layer.shadowRadius = 5;
        _submitButton.layer.shadowOpacity = 0.4;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(331);
            }
        }];
    }
    return _submitButton;
}

- (UIButton *)payButton {
    if (!_payButton) {
        _payButton = [UIButton newAutoLayoutView];
        [_payButton setTitle:@"去线上缴费" forState:0];
        [_payButton setTitleColor:DPBlueColor forState:0];
        _payButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_payButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(332);
            }
        }];
    }
    return _payButton;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = DPLineColor2;
    }
    return _lineLabel;
}

- (UILabel *)numberLabel1 {
    if (!_numberLabel1) {
        _numberLabel1 = [UILabel newAutoLayoutView];
        _numberLabel1.text = @"决定书编号";
        _numberLabel1.font = DPFont3;
        _numberLabel1.textColor = DPLightGrayColor;
    }
    return _numberLabel1;
}

- (UILabel *)licenseLabel1 {
    if (!_licenseLabel1) {
        _licenseLabel1 = [UILabel newAutoLayoutView];
        _licenseLabel1.text = @"车牌号码 ";
        _licenseLabel1.font = DPFont3;
        _licenseLabel1.textColor = DPLightGrayColor;
    }
    return _licenseLabel1;
}

- (UILabel *)codeLabel1 {
    if (!_codeLabel1) {
        _codeLabel1 = [UILabel newAutoLayoutView];
        _codeLabel1.textColor = DPLightGrayColor;
        _codeLabel1.font= DPFont3;
        _codeLabel1.text = @"违章代码";
    }
    return _codeLabel1;
}

- (UILabel *)contentLabel1 {
    if (!_contentLabel1) {
        _contentLabel1 = [UILabel newAutoLayoutView];
        _contentLabel1.textColor = DPLightGrayColor;
        _contentLabel1.font= DPFont3;
        _contentLabel1.text = @"违章行为";
    }
    return _contentLabel1;
}

- (UILabel *)timeLabel1 {
    if (!_timeLabel1) {
        _timeLabel1 = [UILabel newAutoLayoutView];
        _timeLabel1.textColor = DPLightGrayColor;
        _timeLabel1.font= DPFont3;
        _timeLabel1.text = @"违章时间";
    }
    return _timeLabel1;
}
- (UILabel *)addressLabel1 {
    if (!_addressLabel1) {
        _addressLabel1 = [UILabel newAutoLayoutView];
        _addressLabel1.textColor = DPLightGrayColor;
        _addressLabel1.font= DPFont3;
        _addressLabel1.text = @"违章地点";
    }
    return _addressLabel1;
}

- (UILabel *)deductionLabel1 {
    if (!_deductionLabel1) {
        _deductionLabel1 = [UILabel newAutoLayoutView];
        _deductionLabel1.textColor = DPLightGrayColor;
        _deductionLabel1.font= DPFont3;
        _deductionLabel1.text = @"违章扣分";
    }
    return _deductionLabel1;
}
- (UILabel *)moneyLabel1 {
    if (!_moneyLabel1) {
        _moneyLabel1 = [UILabel newAutoLayoutView];
        _moneyLabel1.textColor = DPLightGrayColor;
        _moneyLabel1.font= DPFont3;
        _moneyLabel1.text = @"违章金额";
    }
    return _moneyLabel1;
}
- (UILabel *)lateFeeLabel1 {
    if (!_lateFeeLabel1) {
        _lateFeeLabel1 = [UILabel newAutoLayoutView];
        _lateFeeLabel1.textColor = DPLightGrayColor;
        _lateFeeLabel1.font= DPFont3;
        _lateFeeLabel1.text = @"滞纳金";
    }
    return _lateFeeLabel1;
}

- (UILabel *)numberLabel2 {
    if (!_numberLabel2) {
        _numberLabel2 = [UILabel newAutoLayoutView];
        _numberLabel2.text = @"决定书编号";
        _numberLabel2.font = DPFont3;
        _numberLabel2.textColor = DPDarkGrayColor;
    }
    return _numberLabel2;
}

- (UILabel *)licenseLabel2 {
    if (!_licenseLabel2) {
        _licenseLabel2 = [UILabel newAutoLayoutView];
        _licenseLabel2.text = @"车牌号码 ";
        _licenseLabel2.font = DPFont3;
        _licenseLabel2.textColor = DPDarkGrayColor;
    }
    return _licenseLabel2;
}

- (UILabel *)codeLabel2 {
    if (!_codeLabel2) {
        _codeLabel2 = [UILabel newAutoLayoutView];
        _codeLabel2.textColor = DPDarkGrayColor;
        _codeLabel2.font= DPFont3;
        _codeLabel2.text = @"违章代码";
    }
    return _codeLabel2;
}

- (UILabel *)contentLabel2 {
    if (!_contentLabel2) {
        _contentLabel2 = [UILabel newAutoLayoutView];
        _contentLabel2.textColor = DPDarkGrayColor;
        _contentLabel2.font= DPFont3;
        _contentLabel2.text = @"违章行为";
    }
    return _contentLabel2;
}

- (UILabel *)timeLabel2 {
    if (!_timeLabel2) {
        _timeLabel2 = [UILabel newAutoLayoutView];
        _timeLabel2.textColor = DPDarkGrayColor;
        _timeLabel2.font= DPFont3;
        _timeLabel2.text = @"违章时间";
    }
    return _timeLabel2;
}
- (UILabel *)addressLabel2 {
    if (!_addressLabel2) {
        _addressLabel2 = [UILabel newAutoLayoutView];
        _addressLabel2.textColor = DPDarkGrayColor;
        _addressLabel2.font= DPFont3;
        _addressLabel2.text = @"违章地点";
    }
    return _addressLabel2;
}

- (UILabel *)deductionLabel2 {
    if (!_deductionLabel2) {
        _deductionLabel2 = [UILabel newAutoLayoutView];
        _deductionLabel2.textColor = DPDarkGrayColor;
        _deductionLabel2.font= DPFont3;
        _deductionLabel2.text = @"违章扣分";
    }
    return _deductionLabel2;
}
- (UILabel *)moneyLabel2 {
    if (!_moneyLabel2) {
        _moneyLabel2 = [UILabel newAutoLayoutView];
        _moneyLabel2.textColor = DPDarkGrayColor;
        _moneyLabel2.font= DPFont3;
        _moneyLabel2.text = @"违章金额";
    }
    return _moneyLabel2;
}
- (UILabel *)lateFeeLabel2 {
    if (!_lateFeeLabel2) {
        _lateFeeLabel2 = [UILabel newAutoLayoutView];
        _lateFeeLabel2.textColor = DPDarkGrayColor;
        _lateFeeLabel2.font= DPFont3;
        _lateFeeLabel2.text = @"滞纳金";
    }
    return _lateFeeLabel2;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    //status
    self.statusTextLabel1.attributedText = [NSString setAttributeOfFirstString:@"材料提交\n" firstFont:DPFont4 firstColor:DPBlueColor secondString:@"09-15 12:20" secondFont:DPFont3 secondColor:DPBlueColor align:1 space:6];
    
    self.statusTextLabel2.attributedText = [NSString setAttributeOfFirstString:@"核实材料\n" firstFont:DPFont4 firstColor:DPBlueColor secondString:@"09-15 12:20" secondFont:DPFont3 secondColor:DPBlueColor align:1 space:6];
    
    //result
    if ([self.item.status isEqualToString:@"2"]) {//正在核实材料
        //point
        self.statusTextLabel3.attributedText = [NSString setAttributeOfFirstString:@"处理完成\n" firstFont:DPFont4 firstColor:DPLightGrayColor9 secondString:@"09-15 12:20" secondFont:DPFont3 secondColor:DPLightGrayColor9 align:1 space:6];

        
        [self.successImageView setHidden:YES];
        self.topWhiteResultConstraints.constant = 38;
        
        self.resultLabel.text = @"正加紧处理中";
        self.resultLabel.textColor = DPBlueColor;
        
        self.remindLabel.attributedText = [NSString setAttributeOfFirstString:@"我们将在3个工作日内完成审核\n" firstFont:DPFont4 firstColor:DPLightGrayColor9 secondString:@"请您耐心等待" secondFont:DPFont4 secondColor:DPLightGrayColor9 align:1 space:6];
        
        [self.submitButton setHidden:YES];
        [self.payButton setHidden:YES];
        

    }else if ([self.item.status isEqualToString:@"3"]){
        //point
        self.statusTextLabel3.attributedText = [NSString setAttributeOfFirstString:@"处理完成\n" firstFont:DPFont4 firstColor:DPLightGrayColor9 secondString:@"09-15 12:20" secondFont:DPFont3 secondColor:DPLightGrayColor9 align:1 space:6];

        [self.successImageView setHidden:YES];
        self.topWhiteResultConstraints.constant = 38;
        
        self.resultLabel.text = @"您提交的材料未通过审核";
        self.resultLabel.textColor = DPRedColor;
        
//        请在即日起3天内，重新提交处理材料
        self.remindLabel.attributedText = [NSString setAttributeOfFirstString:@"请在即日起3天内，重新提交处理材料" firstFont:DPFont4 firstColor:DPLightGrayColor9 secondString:@"" secondFont:DPFont4 secondColor:DPLightGrayColor9 align:1 space:6];
        
        [self.submitButton setHidden:NO];
        [self.submitButton setTitle:@"重新提交材料" forState:0];
        [self.payButton setHidden:NO];
        self.topWhiteLineConstraints.constant = 150;

    }else if ([self.item.status isEqualToString:@"4"]){
        //point
        [self.statusPoint3 setImage:[UIImage imageNamed:@"authenty_gray"]];
        self.statusLine4.backgroundColor = DPBlueColor;
        
        self.statusTextLabel3.attributedText = [NSString setAttributeOfFirstString:@"处理完成\n" firstFont:DPFont4 firstColor:DPBlueColor secondString:@"09-15 12:20" secondFont:DPFont3 secondColor:DPBlueColor align:1 space:6];

        
        [self.successImageView setHidden:NO];
        self.topWhiteResultConstraints.constant = 120;
        
        self.resultLabel.text = @"违章已处理完成";
        self.resultLabel.textColor = DPBlueColor;
        
        self.remindLabel.attributedText = [NSString setAttributeOfFirstString:@"良好的行车习惯，是减少违章的首要条件\n" firstFont:DPFont4 firstColor:DPLightGrayColor9 secondString:@"安全出行你我共建" secondFont:DPFont4 secondColor:DPLightGrayColor9 align:1 space:6];
        
        [self.submitButton setHidden:NO];
        [self.submitButton setTitle:@"我已了解" forState:0];
        [self.payButton setHidden:YES];
        self.topWhiteLineConstraints.constant = 120;
    }
    
    //text显示
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
