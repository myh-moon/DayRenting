//
//  OrderResultCheckView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/27.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultCheckView.h"

@implementation OrderResultCheckView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = DPWhiteColor;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.confirmImageView];
        
        [self addSubview:self.remindBackLabel];
        [self.remindBackLabel addSubview:self.remindLabel];
        
        [self addSubview:self.attentionLabel];
        [self addSubview:self.notReturnButton];
        [self addSubview:self.returnButton];
        
        [self addSubview:self.horizonLabel];
        [self addSubview:self.verticalLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)layoutView {
    
    [self.confirmImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    [self.confirmImageView autoSetDimension:ALDimensionHeight toSize:190];
    
    [self.remindBackLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.remindBackLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.confirmImageView withOffset:-22];
    [self.remindBackLabel autoSetDimensionsToSize:CGSizeMake(120, 44)];
    
    [self.remindLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(7.5, 7.5, 7.5, 7.5)];
    
    [self.attentionLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.remindBackLabel];
    [self.attentionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindBackLabel withOffset:DPBigSpacing];
    
    
    NSArray *views = @[self.notReturnButton,self.returnButton];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0];
    [views autoSetViewsDimension:ALDimensionHeight toSize:44];
    
    [self.notReturnButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.notReturnButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.horizonLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.notReturnButton];
    [self.horizonLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.returnButton];
    [self.horizonLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.notReturnButton withOffset:-0.5];
    [self.horizonLabel autoSetDimension:ALDimensionHeight toSize:0.5];
    
    [self.verticalLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.notReturnButton];
    [self.verticalLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.notReturnButton];
    [self.verticalLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.notReturnButton];
    [self.verticalLabel autoSetDimension:ALDimensionWidth toSize:0.5];
    
}

- (UIImageView *)confirmImageView {
    if (!_confirmImageView) {
        _confirmImageView = [UIImageView newAutoLayoutView];
        _confirmImageView.image = [UIImage imageNamed:@"want_remind"];
    }
    return _confirmImageView;
}

- (UILabel *)remindBackLabel {
    if (!_remindBackLabel) {
        _remindBackLabel = [UILabel newAutoLayoutView];
        _remindBackLabel.backgroundColor = UIColorFromRGB1(0xffffff, 0.8);
        _remindBackLabel.layer.cornerRadius = 22.5;
        _remindBackLabel.layer.masksToBounds  = YES;
    }
    return _remindBackLabel;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.layer.cornerRadius = 15.3;
        _remindLabel.layer.masksToBounds = YES;
        _remindLabel.layer.borderColor = DPWhiteColor.CGColor;
        _remindLabel.layer.borderWidth = 0.5;
        _remindLabel.backgroundColor = UIColorFromRGB(0xbdc3c8);
        _remindLabel.textAlignment = NSTextAlignmentCenter;
        
//        _remindLabel.text = @"倒计时";
        _remindLabel.textColor = DPGrayColor;
        _remindLabel.font = DPFont5;
        
//        //remind内容
//        //倒计时
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTheCountDownWithTime) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _remindLabel;
}

- (UILabel *)attentionLabel {
    if (!_attentionLabel) {
        _attentionLabel = [UILabel newAutoLayoutView];
        _attentionLabel.numberOfLines = 0;
    }
    return _attentionLabel;
}

- (UIButton *)notReturnButton {
    if (!_notReturnButton) {
        _notReturnButton = [UIButton newAutoLayoutView];
        [_notReturnButton setTitle:@"故障上报" forState:0];
        [_notReturnButton setTitleColor:DPLightGrayColor forState:0];
        _notReturnButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_notReturnButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(47);
            }
        }];
    }
    return _notReturnButton;
}

- (UIButton *)returnButton {
    if (!_returnButton) {
        _returnButton = [UIButton newAutoLayoutView];
        [_returnButton setTitle:@"车辆正常" forState:0];
        [_returnButton setTitleColor:DPBlueColor forState:0];
        _returnButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_returnButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(48);
            }
        }];
    }
    return _returnButton;
}

- (UILabel *)horizonLabel {
    if (!_horizonLabel) {
        _horizonLabel = [UILabel newAutoLayoutView];
        _horizonLabel.backgroundColor = DPLineColor2;
    }
    return _horizonLabel;
}

- (UILabel *)verticalLabel {
    if (!_verticalLabel) {
        _verticalLabel = [UILabel newAutoLayoutView];
        _verticalLabel.backgroundColor = DPLineColor2;
    }
    return _verticalLabel;
}

////倒计时10分钟
//- (void) startTheCountDownWithTime {
////    AvailableOrderModel *orderModel = self.currentArray[0];
////
////    //当前时间戳
////    NSDate *currentDate = [NSDate date];
////    NSString *currentString = [NSString stringWithFormat:@"%f",[currentDate timeIntervalSince1970]];
////
////    //差值：addtime + 1800秒 - 当前时间戳 = 倒计时时间
////    NSInteger value = [orderModel.addtime integerValue] + 1800 - [currentString integerValue];
//
//    NSInteger value = 600;
//    
//    NSString *ssssss;
//    value--;
//    if (value > 0) {//倒计时未结束
//        ssssss = [NSString stringWithFormat:@"%02ld:%02ld",value/60,value%60];
//        self.remindLabel.text = ssssss;
//    }else{
//        [_timer invalidate];
//    }
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
