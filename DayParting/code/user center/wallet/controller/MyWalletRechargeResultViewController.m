//
//  MyWalletRechargeResultViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/17.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyWalletRechargeResultViewController.h"

#import "MyWalletRechargeResultItem.h"

@interface MyWalletRechargeResultViewController ()

@end

@implementation MyWalletRechargeResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值结果";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"MyWalletRechargeResultItem"] = @"MyWalletRechargeResultCell";
    
    [self setupMyWalletRechargeResultTableView];
}

- (void) setupMyWalletRechargeResultTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    MyWalletRechargeResultItem *resultItem = [[MyWalletRechargeResultItem alloc] init];
    resultItem.selectionStyle = UITableViewCellSelectionStyleNone;
    resultItem.result = self.result;
    [section addItem:resultItem];
    DPWeakSelf;
    resultItem.didSelectedBtn = ^(NSInteger tag) {
        UINavigationController *nav = weakself.navigationController;
        [nav popViewControllerAnimated:NO];
        [nav popViewControllerAnimated:NO];
    };
}

- (void)back {
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    UINavigationController *nav = self.navigationController;
    [nav popViewControllerAnimated:NO];
    [nav popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
