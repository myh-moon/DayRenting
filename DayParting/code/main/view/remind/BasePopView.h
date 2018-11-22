//
//  BasePopView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePopView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

- (void) layoutView;

@end
