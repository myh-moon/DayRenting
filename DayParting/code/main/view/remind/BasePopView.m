//
//  BasePopView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@implementation BasePopView

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        [self layoutView];
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (void)layoutView {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
