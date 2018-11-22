//
//  MyScoreListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyScoreListViewController.h"

#import "MyScoreListItem.h"
#import "NoDataItem.h"

#import "ScoreResponse.h"
#import "ScoreModel.h"

@interface MyScoreListViewController ()

@property (nonatomic,strong) NSMutableArray *myScoreList;

@end

@implementation MyScoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"积分明细";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPRefreshManager[@"MyScoreListItem"] = @"MyScoreListCell";
    self.DPRefreshManager[@"NoDataItem"] = @"NoDataCell";
    
    DPWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getMyScoreListWithPage:@"1"];
        [weakself.DPRefreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex ++ ;
        NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageIndex];
        [weakself getMyScoreListWithPage:page];
        [weakself.DPRefreshTableView.mj_footer endRefreshing];
    };
}

#pragma mark - setting
- (NSMutableArray *)myScoreList {
    if (!_myScoreList) {
        _myScoreList = [NSMutableArray array];
    }
    return _myScoreList;
}

#pragma mark - method
- (void) setupMyScoreListTableView {
    
    [self.DPRefreshManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPRefreshManager addSection:section];
    
    //list
    if (self.myScoreList.count > 0) {
        for (NSInteger i = 0; i < self.myScoreList.count ; i++) {
            
            ScoreModel *model = self.myScoreList[i];
            
            MyScoreListItem *scoreListItem = [[MyScoreListItem alloc] initWithScoreDetailModel:model];
            scoreListItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:scoreListItem];
        }
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"list_none";
        noDataItem.buttonString = @"暂无相关记录";
        [section addItem:noDataItem];
    }
}

- (void) getMyScoreListWithPage:(NSString *)page {
    NSString *scoreList = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyUserCenterOfScoreList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:scoreList params:nil successBlock:^(id responseObject) {
        
        if ([page isEqualToString:@"1"]) {
            [weakself.myScoreList removeAllObjects];
        }
        
        ScoreResponse *response = [ScoreResponse mj_objectWithKeyValues:responseObject];
        
        for (ScoreModel *model in response.data) {
            [weakself.myScoreList addObject:model];
        }
        
        [weakself setupMyScoreListTableView];
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
