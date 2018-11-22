//
//  MyGrantViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyGrantViewController.h"

#import "UIImage+Color.h"
#import "GrantItem.h"

@interface MyGrantViewController ()

@end

@implementation MyGrantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"授权管理";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
    [self.leftNavButton setImage:[UIImage imageNamed:@"back_white"] forState:0];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x1fb7ed)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:DPWhiteColor,NSFontAttributeName:DPFont6}];
    
    self.DPTableView.backgroundColor = DPWhiteColor;
    self.DPTableView.scrollEnabled = NO;
    self.DPManager[@"GrantItem"] = @"GrantCell";
    
    [self setupMyGrantTableView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:DPBlackColor,NSFontAttributeName:DPFont6}];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void) setupMyGrantTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    GrantItem *grantItem = [[GrantItem alloc] init];
    grantItem.selectionStyle = UITableViewCellSelectionStyleNone;
    grantItem.step = @"0";
    
    DPWeakSelf;
    [section addItem:grantItem];
    @weakify(grantItem);
    grantItem.didSelectedBtn = ^(NSInteger tag) {
        @strongify(grantItem);
        if ([grantItem.step isEqualToString:@"0"]) {
            grantItem.step = @"1";
            grantItem.score = @"768";
        }else if ([grantItem.step isEqualToString:@"1"]) {
            grantItem.step = @"2";
        }
    };
}

- (void)addLeftNavAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
