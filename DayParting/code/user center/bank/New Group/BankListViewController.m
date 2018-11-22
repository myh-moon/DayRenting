//
//  BankListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BankListViewController.h"

#import "BankListItem.h"

@interface BankListViewController ()

@end

@implementation BankListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择发卡银行";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"BankListItem"] = @"BankListCell";
    
    [self setupBankListTableView];
}

- (void) setupBankListTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.DPManager addSection:section];
    
    for (NSInteger i=0; i<4; i++) {
        BankListItem *bankItem = [[BankListItem alloc] init];
        bankItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:bankItem];        
    }
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
