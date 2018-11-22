//
//  CarReturnPointsViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/24.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarReturnPointsViewController.h"
#import <MAMapKit/MAMapKit.h>

#import "PointRemindView.h"

@interface CarReturnPointsViewController ()

@property (nonatomic,strong) MAMapView *pointMapView;
@property (nonatomic,strong) PointRemindView *pointRemindView;

@end

@implementation CarReturnPointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"全部网点";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    [self.view addSubview:self.pointMapView];
    [self.view addSubview:self.pointRemindView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)layoutConstraints {
    [self.pointMapView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.pointRemindView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    
    [self.pointRemindView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.pointRemindView autoPinToTopLayoutGuideOfViewController:self withInset:DPMiddleSpacing];
    [self.pointRemindView autoSetDimensionsToSize:CGSizeMake(170, 40)];
}

- (MAMapView *)pointMapView {
    if (!_pointMapView) {
        _pointMapView = [MAMapView newAutoLayoutView];
    }
    return _pointMapView;
}

- (PointRemindView *)pointRemindView {
    if (!_pointRemindView) {
        _pointRemindView = [PointRemindView newAutoLayoutView];
    }
    return _pointRemindView;
}


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
