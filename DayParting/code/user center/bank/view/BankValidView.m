//
//  BankValidView.m
//  DayParting
//
//  Created by jiamanu on 2018/11/1.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BankValidView.h"

@interface BankValidView ()

@property (nonatomic,strong) NSString *monthString;
@property (nonatomic,strong) NSString *yearString;

@end

@implementation BankValidView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.whiteBackView];
        
        [self.whiteBackView addSubview:self.cancelButton];
        [self.whiteBackView addSubview:self.okButton];
        [self addSubview:self.validPickerView];
        
        self.monthString = @"01";
        self.yearString = @"2018";
    }
    return self;
}

- (void) layoutView {
    
    [self.whiteBackView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.validPickerView];
    [self.whiteBackView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.validPickerView];
    [self.whiteBackView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.validPickerView];
    [self.whiteBackView autoSetDimension:ALDimensionHeight toSize:55];
    
    NSArray *views = @[self.cancelButton,self.okButton];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    
//    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.okButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    
    [self.validPickerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.validPickerView autoSetDimension:ALDimensionHeight toSize:200];
    
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

//- (UILabel *)titleLabel {
//    if (!_titleLabel) {
//        _titleLabel = [UILabel newAutoLayoutView];
//        _titleLabel.text = @"选择有效期";
//        _titleLabel.textColor = DPDarkGrayColor;
//        _titleLabel.font = DPFont6;
//    }
//    return _titleLabel;
//}

- (UIButton *)okButton {
    if (!_okButton) {
        _okButton = [UIButton newAutoLayoutView];
        [_okButton setTitleColor:DPBlueColor forState:0];
        [_okButton setTitle:@"确定" forState:0];
        _okButton.titleLabel.font = DPFont6;
        
        DPWeakSelf;
        [_okButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                
//                NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
//
////                [dateFormat setDateFormat:@"yyyy/MM/dd HH:mm"];
//                [dateFormat setDateFormat:@"MM/yyyy"];
//
//                NSString* string=[dateFormat stringFromDate:weakself.generateDatePicker.date];
                
                NSString *date = [NSString stringWithFormat:@"%@/%@",weakself.monthString,weakself.yearString];
                weakself.didSelectedBtn(date);
                
            }
        }];
    }
    return _okButton;
}

- (UIPickerView *)validPickerView {
    if (!_validPickerView) {
        _validPickerView = [UIPickerView newAutoLayoutView];
        _validPickerView.backgroundColor = DPWhiteColor;
        
        _validPickerView.delegate = self;
        _validPickerView.dataSource = self;
    }
    return _validPickerView;
}

#pragma mark - delegate and datasource
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return DPWindowWidth/3;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 12;
    }
    return 100;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        NSString *tt = [NSString stringWithFormat:@"%02d月",row+1];

        return tt;
    }
        NSString *dd = [NSString stringWithFormat:@"%d年",row+2018];
        return dd;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.monthString = [NSString stringWithFormat:@"%02d",row+1];
    }else{
        self.yearString = [NSString stringWithFormat:@"%d",row+2018];
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
