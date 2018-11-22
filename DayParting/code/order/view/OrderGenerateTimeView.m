//
//  OrderGenerateTimeView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateTimeView.h"

@implementation OrderGenerateTimeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.remindButton];
        [self addSubview:self.whiteBackView];
        
        [self.whiteBackView addSubview:self.cancelButton];
        [self.whiteBackView addSubview:self.titleLabel];
        [self.whiteBackView addSubview:self.okButton];

        [self addSubview:self.generateDatePicker];
        
        [self.remindButton setHidden:YES];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.remindButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.whiteBackView];
        [self.remindButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.whiteBackView];
        [self.remindButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.whiteBackView];
        [self.remindButton autoSetDimension:ALDimensionHeight toSize:35];
        
        [self.whiteBackView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.generateDatePicker];
        [self.whiteBackView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.generateDatePicker];
        [self.whiteBackView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.generateDatePicker];
        [self.whiteBackView autoSetDimension:ALDimensionHeight toSize:55];
        
        NSArray *views = @[self.cancelButton,self.titleLabel,self.okButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.okButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        
        [self.generateDatePicker autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.generateDatePicker autoSetDimension:ALDimensionHeight toSize:200];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)remindButton {
    if (!_remindButton) {
        _remindButton = [UIButton newAutoLayoutView];
        [_remindButton setTitle:@"所选时间已超4个小时，将为您转为按日计价模式    " forState:0];
        [_remindButton setTitleColor:DPWhiteColor forState:0];
        _remindButton.titleLabel.font = DPFont3;
        [_remindButton swapImage];
        [_remindButton setImage:[UIImage imageNamed:@"remind_white"] forState:0];
        
        _remindButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _remindButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, DPSmallSpacing);
        _remindButton.backgroundColor = DPBlueColor;
    }
    return _remindButton;
}

- (UIView *)whiteBackView {
    if (!_whiteBackView) {
        _whiteBackView = [UIView newAutoLayoutView];
        _whiteBackView.backgroundColor = DPWhiteColor;
    }
    return _whiteBackView;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton newAutoLayoutView];
        [_cancelButton setTitle:@"取消" forState:0];
        [_cancelButton setTitleColor:DPGrayColor forState:0];
        _cancelButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_cancelButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(@"取消");
            }
        }];
    }
    return _cancelButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"选择还车时间";
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont6;
    }
    return _titleLabel;
}

- (UIButton *)okButton {
    if (!_okButton) {
        _okButton = [UIButton newAutoLayoutView];
        [_okButton setTitleColor:DPBlueColor forState:0];
        [_okButton setTitle:@"确定" forState:0];
        _okButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_okButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                
                NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
                
                [dateFormat setDateFormat:@"yyyy/MM/dd HH:mm"];
                
                NSString* string=[dateFormat stringFromDate:weakself.generateDatePicker.date];
                
                weakself.didSelectedBtn(string);
                
            }
        }];
    }
    return _okButton;
}

- (UIDatePicker *)generateDatePicker {
    if (!_generateDatePicker) {
        _generateDatePicker = [UIDatePicker newAutoLayoutView];
        _generateDatePicker.backgroundColor = DPWhiteColor;
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"]; // 这里是用大写的 H
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        _generateDatePicker.locale = locale;
        
        NSDate * date = [NSDate date];//当前时间
        NSDate *nextDay = [NSDate dateWithTimeInterval:24*60*60 sinceDate:date];//后一天
        _generateDatePicker.minimumDate = date;
        _generateDatePicker.maximumDate = nextDay;
        
//        [NSDate dateWithTimeInterval:24*60*60 sinceDate:nextDay];//后一天
        
        /*
        //获取系统是24小时制或者12小时制
        
        NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
        
        NSRange containsA =[formatStringForHours rangeOfString:@"a"];
        
        BOOL hasAMPM =containsA.location != NSNotFound;
        
        //hasAMPM==TURE为12小时制，否则为24小时制
        
        if (hasAMPM) {
            NSLog(@"12小时制");
        }else{
            NSLog(@"24小时制");
        }
         */
        
//        //显示24小时制
//        [_generateDatePicker setCalendar:[NSCalendar currentCalendar]];
//        _generateDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
        
        
        [_generateDatePicker addTarget:self action:@selector(timeValueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _generateDatePicker;
}

- (void) timeValueChange:(UIDatePicker *)picker {

    NSDate *date = [NSDate date];
    NSDate *chooseDate = picker.date;
    
    NSTimeInterval valdistanceBetweenDates = [chooseDate timeIntervalSinceDate:date];
    double secondsInAnHour = 3600;
    double hoursBetweenDates = valdistanceBetweenDates / secondsInAnHour;
    if (hoursBetweenDates >= 4) {
        [self.remindButton setHidden:NO];
    }else{
        [self.remindButton setHidden:YES];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
