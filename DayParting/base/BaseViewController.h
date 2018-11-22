//
//  BaseViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIBarButtonItem *leftBarButtonItem;

@property (nonatomic,strong) UIButton *leftNavButton;
@property (nonatomic,strong) UIButton *rightNavButton;

- (void) layoutConstraints;

- (void) addLeftNavAction:(UIButton *)sender;
- (void) addRightNavAction;

- (void) back;

@end
