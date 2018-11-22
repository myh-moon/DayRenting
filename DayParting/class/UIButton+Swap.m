//
//  UIButton+Swap.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "UIButton+Swap.h"

@implementation UIButton (Swap)

- (void)swapImage {
    
    self.transform = CGAffineTransformRotate(self.transform, M_PI);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    self.titleLabel.transform = CGAffineTransformRotate(self.titleLabel.transform, M_PI);
    
}

@end
