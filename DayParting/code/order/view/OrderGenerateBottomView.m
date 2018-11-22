//
//  OrderGenerateBottomView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateBottomView.h"

@implementation OrderGenerateBottomView

- (instancetype)initWithFrame:(CGRect)frame {
   self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DPWhiteColor;
        self.layer.shadowColor = UIColorFromRGB(0xf0f0f0).CGColor;
        self.layer.shadowOffset = CGSizeMake(0, -3);
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 1;
        
        [self addSubview:self.noteButton];
        [self addSubview:self.orderButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.noteButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.noteButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.orderButton];
        
        [self.orderButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.orderButton autoSetDimension:ALDimensionHeight toSize:40];
        [self.orderButton autoSetDimension:ALDimensionWidth toSize:DPWindowWidth*0.45];
        [self.orderButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPSmallSpacing];
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)noteButton {
    if (!_noteButton) {
        _noteButton = [UIButton newAutoLayoutView];
        [_noteButton setImage:[UIImage imageNamed:@"invoice_selected"] forState:0];
        
        NSMutableAttributedString *note = [NSString setAttributeOfFirstString:@"  尊享服务费 " firstFont:DPFont3 firstColor:DPDarkGrayColor secondString:@"2元" secondFont:DPFont3 secondColor:DPBlueColor thirdString:@"/小时" thirdFont:DPFont3 thirdColor:DPLightGrayColor];
        [_noteButton setAttributedTitle:note forState:0];
    }
    return _noteButton;
}

- (UIButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [UIButton newAutoLayoutView];
        [_orderButton setTitle:@"立即预定" forState:0];
        [_orderButton setTitleColor:DPWhiteColor forState:0];
        _orderButton.titleLabel.font = DPFont5;
        _orderButton.backgroundColor = DPBlueColor;
    }
    return _orderButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
