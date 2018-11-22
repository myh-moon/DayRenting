//
//  BaseCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self layoutCellConstraints];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

@end
