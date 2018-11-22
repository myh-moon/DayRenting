//
//  UIButton+Action.m
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "UIButton+Action.h"
#import <objc/runtime.h>

@implementation UIButton (Action)

static char actionTag;


- (void)addAction:(ButtonBlock )block {
    objc_setAssociatedObject(self, &actionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(act) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) act {
    ButtonBlock block =  objc_getAssociatedObject(self, &actionTag);
    if (block) {
        block(self);
    }
}

@end
