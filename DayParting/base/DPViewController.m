//
//  DPViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPViewController.h"

@interface DPViewController ()

@end

@implementation DPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.DPTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.DPManager = [[RETableViewManager alloc] initWithTableView:self.DPTableView];
}

- (UITableView *)DPTableView {
    if (!_DPTableView) {
        _DPTableView = [UITableView newAutoLayoutView];
        _DPTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, DPSmallSpacing)];
        _DPTableView.showsVerticalScrollIndicator = NO;
        _DPTableView.backgroundColor = DPWhiteColor;
    }
    return _DPTableView;
}

- (void)layoutConstraints {
    [self.DPTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.DPTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
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
