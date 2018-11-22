//
//  UIButton+Action.h
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock) (UIButton *btn);

@interface UIButton (Action)

- (void) addAction:(ButtonBlock )block;

@end
