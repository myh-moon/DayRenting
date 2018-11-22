//
//  MyOrderInvoiceHistoryViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceHistoryViewController.h"
#import "MyOrderInvoiceHistoryDetailViewController.h"

#import "SeperateItem.h"
#import "MyOrderInvoiceHistoryItem.h"
#import "NoDataItem.h"

#import "MyHistoryResponse.h"
#import "MyHistoryModel.h"

@interface MyOrderInvoiceHistoryViewController ()

@property (nonatomic,strong) NSMutableArray *historyList;

@end

@implementation MyOrderInvoiceHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title  = @"开票历史";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPRefreshManager[@"SeperateItem"] = @"SeperateCell";
    self.DPRefreshManager[@"MyOrderInvoiceHistoryItem"] = @"MyOrderInvoiceHistoryCell";
    self.DPRefreshManager[@"NoDataItem"] = @"NoDataCell";

    [self setupMyOrderInvoiceHistoryTableView];
    
    DPWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself  getMyInvoiceHistoryListWithPage:@"1"];
        [weakself.DPRefreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex ++;
        NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageIndex];
        [weakself getMyInvoiceHistoryListWithPage:page];
        [weakself.DPRefreshTableView.mj_footer endRefreshing];
    };
}

#pragma mark - getter
- (NSMutableArray *)historyList {
    if (!_historyList) {
        _historyList = [NSMutableArray array];
    }
    return _historyList;
}

- (void) setupMyOrderInvoiceHistoryTableView {
    
    [self.DPRefreshManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPRefreshManager addSection:section];
    
    if (self.historyList.count > 0) {
        for (NSInteger i = 0;  i < self.historyList.count; i++) {
            
            MyHistoryModel *historyModel = self.historyList[i];
            
            DPWeakSelf;
            MyOrderInvoiceHistoryItem *historyItem = [[MyOrderInvoiceHistoryItem alloc] initWithHistoryModel:historyModel];
            historyItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:historyItem];
            historyItem.selectionHandler = ^(id item) {
                
                if ([historyModel.type isEqualToString:@"0"]) {//电子发票
                    MyOrderInvoiceHistoryDetailViewController *myOrderInvoiceHistoryDetailVC = [[MyOrderInvoiceHistoryDetailViewController alloc] init];
                    myOrderInvoiceHistoryDetailVC.ID = historyModel.ID;
                    myOrderInvoiceHistoryDetailVC.type = historyModel.type;
                    [weakself.navigationController pushViewController:myOrderInvoiceHistoryDetailVC animated:YES];
                }else{
                    [weakself showHint:@"纸质发票已寄出"];
                }
            };
        }
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"list_none";
        noDataItem.buttonString = @"暂无相关记录";
        [section addItem:noDataItem];
    }
}

- (void) getMyInvoiceHistoryListWithPage:(NSString *)page {
    NSString *historyString = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyOrderInvoiceHistoryList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:historyString params:nil successBlock:^(id responseObject) {
        
        if ([page isEqualToString:@"1"]) {
            [weakself.historyList removeAllObjects];
        }
        
        MyHistoryResponse *response = [MyHistoryResponse mj_objectWithKeyValues:responseObject];
        
        for (MyHistoryModel *historyModel in response.list) {
            [weakself.historyList addObject:historyModel];
        }
        
        [weakself setupMyOrderInvoiceHistoryTableView];
        [weakself.DPRefreshTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
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
