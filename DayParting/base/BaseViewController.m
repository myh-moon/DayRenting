//
//  BaseViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Color.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条的字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:DPBlackColor,NSFontAttributeName:DPFont7}];
    
    //去除系统效果
//        self.navigationController.navigationBar.translucent = NO;
    
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:DPWhiteColor] forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //    if (@available(iOS 11.0, * )) {
    //        scrollview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    //    }else{
    //        self.automaticallyAdjustsScrollViewInsets = NO;
    //    }
    
    //右滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    //自动布局
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

- (UIBarButtonItem *)leftBarButtonItem {
    if (!_leftBarButtonItem) {
        UIButton *backButton = [UIButton buttonWithType:0];
        backButton.frame = CGRectMake(0, 0, 45, 44);
        [backButton setImage:[UIImage imageNamed:@"back_black"] forState:0];
        [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    return _leftBarButtonItem;
}

- (UIButton *)leftNavButton {
    if (!_leftNavButton) {
        _leftNavButton = [UIButton buttonWithType:0];
        _leftNavButton.frame = CGRectMake(0, 0, 45, 44);
        [_leftNavButton setTitleColor:DPRedColor forState:0];
        _leftNavButton.titleLabel.font = DPFont4;
        [_leftNavButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_leftNavButton addTarget:self action:@selector(addLeftNavAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftNavButton;
}

- (UIButton *)rightNavButton {
    if (!_rightNavButton) {
        _rightNavButton = [UIButton buttonWithType:0];
        _rightNavButton.frame = CGRectMake(0, 0, 80, 44);
        [_rightNavButton setTitleColor:DPGrayColor forState:0];
        _rightNavButton.titleLabel.font = DPFont5;
        [_rightNavButton addTarget:self action:@selector(addRightNavAction) forControlEvents:UIControlEventTouchUpInside];
        _rightNavButton.contentHorizontalAlignment = 2;
    }
    return _rightNavButton;
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        [self layoutConstraints];
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

//返回
- (void) back {
    [self.navigationController popViewControllerAnimated:YES];
}

//布局
- (void)layoutConstraints {
    
}

- (void)addLeftNavAction:(UIButton *)sender {
    
}

- (void)addRightNavAction {
    
}

//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
