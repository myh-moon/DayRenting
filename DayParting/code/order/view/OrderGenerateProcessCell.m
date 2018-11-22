//
//  OrderGenerateProcessCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateProcessCell.h"

@implementation OrderGenerateProcessCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.serviceImageView];
    [self.contentView addSubview:self.returnImageView];
    [self.contentView addSubview:self.timeImageView];
    [self.contentView addSubview:self.dottedImageView1];

    [self.contentView addSubview:self.serviceButton];
    [self.serviceButton addSubview:self.serviceLabel1];
    [self.serviceButton addSubview:self.serviceLabel2];

    [self.contentView addSubview:self.returnButton];
    [self.returnButton addSubview:self.returnPointButton];
    [self.returnButton addSubview:self.returnImageButton];

    [self.contentView addSubview:self.timeButton];
    [self.timeButton addSubview:self.timePointButton];
    [self.timeButton addSubview:self.timeLabel2];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.serviceImageView,self.returnImageView,self.timeImageView];
        [views autoAlignViewsToAxis:ALAxisVertical];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        
        [self.serviceImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:35];
        [self.timeImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:35];
        [self.returnImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.serviceImageView withOffset:45];
        
        [self.dottedImageView1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.serviceImageView withOffset:5];
        [self.dottedImageView1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.returnImageView withOffset:-5];
        [self.dottedImageView1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.serviceImageView];
        
        NSArray *views1 = @[self.serviceButton,self.returnButton,self.timeButton];
        [views1 autoAlignViewsToAxis:ALAxisVertical];
        [views1 autoSetViewsDimension:ALDimensionHeight toSize:35];
        [views1 autoMatchViewsDimension:ALDimensionWidth];
        [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:33];
        [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];

        [self.serviceButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.serviceImageView];

        [self.returnButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.returnImageView];

        [self.timeButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.timeImageView];
        
        //service
        [self.serviceLabel1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPSmallSpacing];
        [self.serviceLabel1 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.serviceLabel2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPSmallSpacing];
        [self.serviceLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.serviceLabel1];
        
        
        //return
        [self.returnPointButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPSmallSpacing];
        [self.returnPointButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.returnPointButton autoSetDimension:ALDimensionWidth toSize:DPWindowWidth-150];
        
        [self.returnImageButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPSmallSpacing];
        [self.returnImageButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.returnPointButton];
        
        //time
        [self.timePointButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPSmallSpacing];
        [self.timePointButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.timeLabel2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPSmallSpacing];
        [self.timeLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.timePointButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)serviceImageView {
    if (!_serviceImageView) {
        _serviceImageView = [UIImageView newAutoLayoutView];
        _serviceImageView.image = [UIImage imageNamed:@"car_qc"];
    }
    return _serviceImageView;
}

- (UIImageView *)returnImageView {
    if (!_returnImageView) {
        _returnImageView = [UIImageView newAutoLayoutView];
        _returnImageView.image = [UIImage imageNamed:@"car_hc"];
    }
    return _returnImageView;
}

- (UIImageView *)timeImageView {
    if (!_timeImageView) {
        _timeImageView = [UIImageView newAutoLayoutView];
        _timeImageView.image = [UIImage imageNamed:@"car_time"];
    }
    return _timeImageView;
}

- (UIImageView *)dottedImageView1 {
    if (!_dottedImageView1) {
        _dottedImageView1 = [UIImageView newAutoLayoutView];
        _dottedImageView1.image = [UIImage imageNamed:@"order_dot"];
    }
    return _dottedImageView1;
}

- (UIButton *)serviceButton {
    if (!_serviceButton) {
        _serviceButton = [UIButton newAutoLayoutView];
        _serviceButton.backgroundColor = DPBackGroundColor;
    }
    return _serviceButton;
}

- (UILabel *)serviceLabel1 {
    if (!_serviceLabel1) {
        _serviceLabel1 = [UILabel newAutoLayoutView];
        _serviceLabel1.textColor = DPDarkGrayColor;
        _serviceLabel1.font = DPFont4;
    }
    return _serviceLabel1;
}

- (UILabel *)serviceLabel2 {
    if (!_serviceLabel2) {
        _serviceLabel2 = [UILabel newAutoLayoutView];
        _serviceLabel2.textColor = DPLightGrayColor6;
        _serviceLabel2.font = DPFont4;
        _serviceLabel2.text = @"取车点";
    }
    return _serviceLabel2;
}

- (UIButton *)returnButton {
    if (!_returnButton) {
        _returnButton = [UIButton newAutoLayoutView];
        _returnButton.backgroundColor = DPBackGroundColor;
    }
    return _returnButton;
}

- (UIButton *)returnPointButton {
    if (!_returnPointButton) {
        _returnPointButton = [UIButton newAutoLayoutView];
        [_returnPointButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        _returnPointButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        
        [_returnPointButton setTitle:@"请选择还车点（实际还车时可更改）" forState:0];
        [_returnPointButton setTitleColor:DPLightGrayColor forState:0];
        _returnPointButton.titleLabel.font = DPFont4;
        
        DPWeakSelf;
        [_returnPointButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(109);
            }
        }];
    }
    return _returnPointButton;
}

- (UIButton *)returnImageButton {
    if (!_returnImageButton) {
        _returnImageButton = [UIButton newAutoLayoutView];
        [_returnImageButton setTitle:@"  同取车" forState:0];
        [_returnImageButton setTitleColor:DPBlueColor forState:0];
        _returnImageButton.titleLabel.font = DPFont4;
        [_returnImageButton setImage:[UIImage imageNamed:@"copy"] forState:0];
        
        DPWeakSelf;
        [_returnImageButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(110);
            }
        }];
    }
    return _returnImageButton;
}

- (UIButton *)timeButton {
    if (!_timeButton) {
        _timeButton = [UIButton newAutoLayoutView];
        _timeButton.backgroundColor = DPBackGroundColor;
        
        DPWeakSelf;
        [_timeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(111);
            }
        }];
    }
    return _timeButton;
}

- (UIButton *)timePointButton {
    if (!_timePointButton) {
        _timePointButton = [UIButton newAutoLayoutView];
        [_timePointButton setTitle:@"请选择还车时间" forState:0];
        [_timePointButton setTitleColor:DPLightGrayColor forState:0];
        _timePointButton.titleLabel.font = DPFont4;
        _timePointButton.userInteractionEnabled = NO;
        
    }
    return _timePointButton;
}

- (UILabel *)timeLabel2 {
    if (!_timeLabel2) {
        _timeLabel2 = [UILabel newAutoLayoutView];
        _timeLabel2.textColor = DPLightGrayColor6;
        _timeLabel2.font = DPFont4;
        _timeLabel2.text = @"时间点";
    }
    return _timeLabel2;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.serviceLabel1.text = [NSString stringWithFormat:@"%@ · 服务点",self.item.bname];
//    @"东海SOHO · 服务点";
    
    
    DPWeakSelf;
//    [[[RACObserve(self.item, addressSelected) skip:0] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *addressSelected) {
//        if ([addressSelected isEqualToString:@"1"]) {
//            weakself.returnPointButton.selected = YES;
//        }
//    }];
//
//
//    [[[RACObserve(self.item, timeSelected) skip:0] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *timeSelected) {
//        if ([timeSelected isEqualToString:@"1"]) {
//            weakself.timePointButton.selected = YES;
//        }
//    }];
    
    [[[RACObserve(self.item, hcaddress) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *address) {
        [weakself.returnPointButton setTitle:address forState:0];
        [weakself.returnPointButton setTitleColor:DPDarkGrayColor forState:0];
    }];
    
    
    [[[RACObserve(self.item, hctime) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *time) {
        [weakself.timePointButton setTitle:time forState:0];
        [weakself.timePointButton setTitleColor:DPDarkGrayColor forState:0];
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
