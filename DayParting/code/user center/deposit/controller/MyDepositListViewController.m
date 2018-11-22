//
//  MyDepositListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositListViewController.h"

#import "NoDataItem.h"

@interface MyDepositListViewController ()

@property (nonatomic,strong) NSMutableArray *depositList;

@end

@implementation MyDepositListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"押金记录";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPRefreshManager[@"NoDataItem"] = @"NoDataCell";
    
    DPWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getListOfMyDepositWithPage:@"1"];
        
        [weakself.DPRefreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex ++;
        NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageIndex];
        [weakself getListOfMyDepositWithPage:page];
        
        [weakself.DPRefreshTableView.mj_footer endRefreshing];
    };
    
//    [self setupMyDepositListTableView];
}

#pragma mark - init
- (NSMutableArray *)depositList {
    if (!_depositList) {
        _depositList = [NSMutableArray array];
    }
    return _depositList;
}

#pragma mark - method
- (void) setupMyDepositListTableView {
    
    [self.DPRefreshManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPRefreshManager addSection:section];
    
    if (self.depositList.count > 0) {
        
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"list_none";
        noDataItem.buttonString = @"暂无相关记录";
        [section addItem:noDataItem];
    }
}

- (void) getListOfMyDepositWithPage:(NSString *)page {
    
    [self setupMyDepositListTableView];
    [self.DPRefreshTableView reloadData];
    
//    NSString *depositStr = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPBaseUrl,DPToken,page];
//
//    DPWeakSelf;
//    [self requestDataGetWithString:depositStr params:nil successBlock:^(id responseObject) {
//
//    } andFailBlock:^(NSError *error) {
//
//    }];
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
