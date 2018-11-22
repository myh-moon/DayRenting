//
//  MyCapitalListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCapitalListViewController.h"

#import "MyCapitalItem.h"
#import "NoDataItem.h"

#import "CapitalResponse.h"
#import "CapitalModel.h"


@interface MyCapitalListViewController ()

@property (nonatomic,strong) NSMutableArray *capitalList;

@end

@implementation MyCapitalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"收支明细";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPRefreshManager[@"MyCapitalItem"] = @"MyCapitalCell";
    self.DPRefreshManager[@"NoDataItem"] = @"NoDataCell";
    
    DPWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getMyCapitalListWithPage:@"1"];
        
        [weakself.DPRefreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex ++;
        NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageIndex];
        [weakself getMyCapitalListWithPage:page];
        
        [weakself.DPRefreshTableView.mj_footer endRefreshing];
    };
    
}

#pragma mark - init
- (NSMutableArray *)capitalList {
    if (!_capitalList) {
        _capitalList = [NSMutableArray array];
    }
    return _capitalList;
}

- (void) setupMyCapitalListTableView {
    [self.DPRefreshManager removeAllSections];
    
    RETableViewSection *section =[RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.DPRefreshManager addSection:section];
    
    //list
    if (self.capitalList.count > 0) {
        self.DPRefreshTableView.backgroundColor = DPBackGroundColor;
        for (NSInteger i=0; i<self.capitalList.count; i++) {
            CapitalModel *model = self.capitalList[i];
            MyCapitalItem *capitalItem = [[MyCapitalItem alloc] initWithCapitalModel:model];
            capitalItem.selectionStyle = UITableViewCellSeparatorStyleNone;
            [section addItem:capitalItem];
        }
    }else{
        self.DPRefreshTableView.backgroundColor = DPWhiteColor;
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"list_none";
        noDataItem.buttonString = @"暂无相关记录";
        [section addItem:noDataItem];
    }
}

- (void) getMyCapitalListWithPage:(NSString *)page {
    NSString *capitalString = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyCapitalList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:capitalString params:nil successBlock:^(id responseObject) {
        
        CapitalResponse *response = [CapitalResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            
            if ([page isEqualToString:@"1"]) {
                [weakself.capitalList removeAllObjects];
            }
            
            for (CapitalModel *model in response.data) {
                [weakself.capitalList addObject:model];
            }
        }
        
        [weakself setupMyCapitalListTableView];
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
