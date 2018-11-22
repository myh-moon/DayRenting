//
//  MyOrderInvoiceViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceViewController.h"
#import "MyOrderInvoiceListViewController.h"    //分时租车
#import "MyOrderInvoiceHistoryViewController.h"  //开票历史
#import "MyRechargeInvoiceListViewController.h"  //充值开票

#import "MyOrderInvoiceItem.h"
#import "SeperateItem.h"

@interface MyOrderInvoiceViewController ()

@end

@implementation MyOrderInvoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"开具发票";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;

    self.DPManager[@"MyOrderInvoiceItem"] = @"MyOrderInvoiceCell";
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    
    [self setupMyOrderInvoiceTableView];
}

- (void) setupMyOrderInvoiceTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem1.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem1];
    
    DPWeakSelf;
    MyOrderInvoiceItem *typeInvoiceItem = [[MyOrderInvoiceItem alloc] init];
    typeInvoiceItem.titleString = @"分时租车、日租车";
    typeInvoiceItem.showSeperate = @"2";
    typeInvoiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:typeInvoiceItem];
    typeInvoiceItem.selectionHandler = ^(id item) {
        MyOrderInvoiceListViewController *myOrderInvoiceListVC = [[MyOrderInvoiceListViewController alloc] init];
        [weakself.navigationController  pushViewController:myOrderInvoiceListVC animated:YES];
    };
    
    MyOrderInvoiceItem *accountInvoiceItem = [[MyOrderInvoiceItem alloc] init];
    accountInvoiceItem.titleString = @"账户充值";
    accountInvoiceItem.showSeperate = @"3";
    accountInvoiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:accountInvoiceItem];
    accountInvoiceItem.selectionHandler = ^(id item) {
        
        MyRechargeInvoiceListViewController *myRechargeInvoiceListVC = [[MyRechargeInvoiceListViewController alloc] init];
        [weakself.navigationController pushViewController:myRechargeInvoiceListVC animated:YES];
    };
    
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem2.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem2];
    
    MyOrderInvoiceItem *historyInvoiceItem = [[MyOrderInvoiceItem alloc] init];
    historyInvoiceItem.titleString = @"开票历史";
    historyInvoiceItem.showSeperate = @"2";
    historyInvoiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:historyInvoiceItem];
    historyInvoiceItem.selectionHandler = ^(id item) {
        MyOrderInvoiceHistoryViewController *myOrderInvoiceHistoryVC = [[MyOrderInvoiceHistoryViewController alloc] init];
        [weakself.navigationController pushViewController:myOrderInvoiceHistoryVC animated:YES];
    };
    
    MyOrderInvoiceItem *noteInvoiceItem = [[MyOrderInvoiceItem alloc] init];
    noteInvoiceItem.titleString = @"开票说明";
    noteInvoiceItem.showSeperate = @"3";
    noteInvoiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:noteInvoiceItem];
    
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
