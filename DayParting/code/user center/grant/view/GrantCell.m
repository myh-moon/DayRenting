//
//  GrantCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "GrantCell.h"

@implementation GrantCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 62 * DPWindowWidth / 125 + 180;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.grantBackImageView];
    [self.grantBackImageView addSubview:self.headerLabel];
    [self.grantBackImageView addSubview:self.firstImageView];
    [self.grantBackImageView addSubview:self.lineLabel1];
    [self.grantBackImageView addSubview:self.lineLabel2];
    [self.grantBackImageView addSubview:self.secondImageView];

    
    [self.contentView addSubview:self.whiteBackView];
    [self.whiteBackView addSubview:self.zhimaImageView];
    [self.whiteBackView addSubview:self.zhimaLabel];
    [self.whiteBackView addSubview:self.remindLabel];
    [self.whiteBackView addSubview:self.actButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.grantBackImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    
    [self.headerLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [self.headerLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    NSArray *views = @[self.firstImageView,self.lineLabel1,self.lineLabel2,self.secondImageView];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerLabel withOffset:30];
    
    [self.firstImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:55];
    
    [self.lineLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.firstImageView withOffset:8];
    [self.lineLabel1 autoSetDimension:ALDimensionWidth toSize:40];
    [self.lineLabel1 autoSetDimension:ALDimensionHeight toSize:2];
    
    [self.lineLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel1 withOffset:4];
    [self.lineLabel2 autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.lineLabel1];
    [self.lineLabel2 autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.lineLabel1];

    [self.secondImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel2 withOffset:8];
    
    [self.whiteBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, 3, DPMiddleSpacing) excludingEdge:ALEdgeTop];
    [self.whiteBackView autoSetDimension:ALDimensionHeight toSize:260];//245
    
    [self.zhimaImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
    [self.zhimaImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    
    [self.zhimaLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
    [self.zhimaLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.zhimaImageView];
    
    [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.zhimaImageView withOffset:35];
    [self.remindLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.remindLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.zhimaImageView];
    [self.remindLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.zhimaLabel];
    
    [self.actButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:40];
    [self.actButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.remindLabel];
    [self.actButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.remindLabel];
    [self.actButton autoSetDimension:ALDimensionHeight toSize:DPCommonButtonHeight];
}

- (UIImageView *)grantBackImageView {
    if (!_grantBackImageView) {
        _grantBackImageView = [UIImageView newAutoLayoutView];
        _grantBackImageView.image = [UIImage imageNamed:@"authentication-02"];
    }
    return _grantBackImageView;
}

- (UILabel *)headerLabel {
    if (!_headerLabel) {
        _headerLabel = [UILabel newAutoLayoutView];
        _headerLabel.text = @"两步立享租车免押金";
        _headerLabel.font = DPFont4;
        _headerLabel.textColor = DPWhiteColor;
    }
    return _headerLabel;
}

- (UIImageView *)firstImageView {
    if (!_firstImageView) {
        _firstImageView = [UIImageView newAutoLayoutView];
    }
    return _firstImageView;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [UILabel newAutoLayoutView];
        _lineLabel1.backgroundColor = DPWhiteColor;
        _lineLabel1.layer.cornerRadius = 2;
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
        _lineLabel2.layer.cornerRadius = 2;
    }
    return _lineLabel2;
}

- (UIImageView *)secondImageView {
    if (!_secondImageView) {
        _secondImageView = [UIImageView newAutoLayoutView];
    }
    return _secondImageView;
}

- (UIView *)whiteBackView {
    if (!_whiteBackView) {
        _whiteBackView = [UIView newAutoLayoutView];
        _whiteBackView.backgroundColor = DPWhiteColor;
        
        _whiteBackView.layer.cornerRadius = 10;
        
        _whiteBackView.layer.shadowColor = DPShadowColor.CGColor;
        _whiteBackView.layer.shadowOffset = CGSizeMake(2, 2);
        _whiteBackView.layer.shadowOpacity = 0.9;
    }
    return _whiteBackView;
}

- (UIImageView *)zhimaImageView {
    if (!_zhimaImageView) {
        _zhimaImageView = [UIImageView newAutoLayoutView];
        [_zhimaImageView setImage:[UIImage imageNamed:@"zhima"]];
    }
    return _zhimaImageView;
}

- (UILabel *)zhimaLabel {
    if (!_zhimaLabel) {
        _zhimaLabel = [UILabel newAutoLayoutView];
        _zhimaLabel.textColor = DPGreenColor2;
        _zhimaLabel.font = DPFont4;
    }
    return _zhimaLabel;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.numberOfLines = 0;
    }
    return _remindLabel;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        _actButton.layer.cornerRadius = 25;
        _actButton.titleLabel.font = DPFont6;
        
        
        DPWeakSelf;
        [_actButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(99);
            }
        }];
    }
    return _actButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [[RACObserve(self.item, step) takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *stepStr) {
        
        if ([stepStr isEqualToString:@"0"]) {
            [self.firstImageView setImage:[UIImage imageNamed:@"grant_first"]];
            self.lineLabel1.backgroundColor = DPWhiteColor;
            self.lineLabel2 .backgroundColor = DPLightGrayColor22;
            [self.secondImageView setImage:[UIImage imageNamed:@"grant_second_gray"]];
            self.zhimaLabel.text = @"芝麻信用分授权查询";
            
            NSString *str = @"芝麻信用分700分及以上，有机会享受免5000元及以下车型的租车和违章押金服务";
            NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
            [setAttributeString addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPDarkGrayColor} range:NSMakeRange(0, str.length)];
            
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            style.lineSpacing = 10;
            style.alignment = 0;
            
            [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, str.length)];
            
            self.remindLabel.attributedText = setAttributeString;
            
            self.actButton.backgroundColor = DPGreenColor2;
            [self.actButton setTitle:@"去支付宝授权" forState:0];
            [self.actButton setTitleColor:DPWhiteColor forState:0];
            
            self.actButton.layer.shadowColor = DPGreenColor2.CGColor;
            self.actButton.layer.shadowOpacity = 0.4;
            self.actButton.layer.shadowRadius = 5;
            self.actButton.layer.shadowOffset = CGSizeMake(0, 3);
            
        }else if ([stepStr isEqualToString:@"1"]){
            [self.firstImageView setImage:[UIImage imageNamed:@"grant_success"]];
            self.lineLabel1.backgroundColor = DPWhiteColor;
            self.lineLabel2 .backgroundColor = DPWhiteColor;
            [self.secondImageView setImage:[UIImage imageNamed:@"grant_second"]];
            self.zhimaLabel.text = @"免密支付授权";
            
            self.remindLabel.attributedText = [NSString setAttributeOfFirstString:@"当前信用分" firstFont:DPFont4 firstColor:DPDarkGrayColor secondString:@"780" secondFont:DPFont4 secondColor:DPGreenColor2 thirdString:@",现在授权芝麻信用免密支付，即可享受租车免押金" thirdFont:DPFont4 thirdColor:DPDarkGrayColor align:0 space:10];
            
            self.actButton.backgroundColor = DPGreenColor2;
            [self.actButton setTitle:@"现在授权" forState:0];
            [self.actButton setTitleColor:DPWhiteColor forState:0];
            
            self.actButton.layer.shadowColor = DPGreenColor2.CGColor;
            self.actButton.layer.shadowOpacity = 0.4;
            self.actButton.layer.shadowRadius = 5;
            self.actButton.layer.shadowOffset = CGSizeMake(0, 3);
            
        }else{
            [self.firstImageView setImage:[UIImage imageNamed:@"grant_success"]];
            self.lineLabel1.backgroundColor = DPWhiteColor;
            self.lineLabel2 .backgroundColor = DPWhiteColor;
            [self.secondImageView setImage:[UIImage imageNamed:@"grant_success"]];
            self.zhimaLabel.text = @"免密支付授权";
            
            NSString *str = @"恭喜您，现在可享受享受免5000元及以下车型的租车和违章押金服务";
            NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
            [setAttributeString addAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPDarkGrayColor} range:NSMakeRange(0, str.length)];
            
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            style.lineSpacing = 6;
            style.alignment = 0;
            
            [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, str.length)];
            self.remindLabel.attributedText = setAttributeString;
            
            self.actButton.backgroundColor = DPWhiteColor;
            [self.actButton setTitle:@"免密支付已授权" forState:0];
            [self.actButton setTitleColor:DPGreenColor2 forState:0];
            self.actButton.layer.borderColor = DPGreenColor2.CGColor;
            self.actButton.layer.borderWidth = 0.5;
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
