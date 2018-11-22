//
//  AuthentyPictureView.m
//  DayParting
//
//  Created by jiamanu on 2018/9/13.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyPictureView.h"

@implementation AuthentyPictureView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
//        self.backgroundColor = DPWhiteColor;
        
//        self.layer.shadowColor = DPShadowColor.CGColor;
//        self.layer.shadowOffset = CGSizeMake(1, 1);
//        self.layer.shadowOpacity = 0.8;
        
        [self addSubview:self.picImage];
        [self addSubview:self.picLabel];
        
        [self setNeedsUpdateConstraints];
        
        
       self.imageTopConstraints =  [self.picImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:45];
        
        self.labelBottomConstraints = [self.picLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.picImage withOffset:DPMiddleSpacing];
//        [self.picLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:27];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.picImage autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.picLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.picImage];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)picImage {
    if (!_picImage) {
        _picImage = [UIImageView newAutoLayoutView];
    }
    return _picImage;
}

- (UILabel *)picLabel {
    if (!_picLabel) {
        _picLabel = [UILabel newAutoLayoutView];
        _picLabel.textColor = DPLightGrayColor;
        _picLabel.font = DPFont4;
    }
    return _picLabel;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
