//
//  MyDepositResultViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositResultViewController.h"
#import "MyDepositListViewController.h" //押金记录

#import "MyDepositResultItem.h"

@interface MyDepositResultViewController ()

@end

@implementation MyDepositResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"退押金进度";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"押金记录" forState:0];
    
    
    self.DPManager[@"MyDepositResultItem"] = @"MyDepositResultCell";
    
    [self setupMyDepositResultTableView];
}

- (void) setupMyDepositResultTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    MyDepositResultItem *resultItem = [[MyDepositResultItem alloc] init];
    resultItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:resultItem];
}

- (void)addRightNavAction {
    MyDepositListViewController *myDepositListVC = [[MyDepositListViewController alloc] init];
    [self.navigationController pushViewController:myDepositListVC animated:YES];
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
