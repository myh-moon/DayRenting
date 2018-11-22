//
//  MyBreakFinishedViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakFinishedViewController.h"

#import "MyBreakItem.h"
#import "NoDataItem.h"

#import "MyBreakModel.h"

@interface MyBreakFinishedViewController ()

@property (nonatomic,strong) NSMutableArray *myBreakFinishedList;

@end

@implementation MyBreakFinishedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"已处理违章";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPRefreshTableView.backgroundColor = DPBackGroundColor;
    
    self.DPRefreshManager[@"MyBreakItem"] = @"MyBreakCell";
    self.DPRefreshManager[@"NoDataItem"] = @"NoDataCell";
    
    DPWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getListOfBreakFinishedWithPage:@"1"];
        [weakself.DPRefreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex++;
        NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageIndex];
        [weakself getListOfBreakFinishedWithPage:page];
        [weakself.DPRefreshTableView.mj_footer endRefreshing];
    };
}


#pragma mark - init
- (NSMutableArray *)myBreakFinishedList {
    if (!_myBreakFinishedList) {
        _myBreakFinishedList = [NSMutableArray array];
    }
    return _myBreakFinishedList;
}

#pragma mark - method
- (void) setupMyBreakTableView {
    
    [self.DPRefreshManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPRefreshManager addSection:section];
    
    if (self.myBreakFinishedList.count > 0) {
        
        for ( NSInteger i=0; i<self.myBreakFinishedList.count; i++) {
            
            MyBreakModel *breakModel = self.myBreakFinishedList[i];
            
            //model
            DPWeakSelf;
            MyBreakItem *myBreakItem = [[MyBreakItem alloc] initWithModel:breakModel];
            myBreakItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:myBreakItem];
            }
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"no_violation_record";
        noDataItem.buttonString = @"暂无相关记录";
        [section addItem:noDataItem];
    }
}

//未处理违章列表
- (void) getListOfBreakFinishedWithPage:(NSString *)page {
    NSString *noDealString = [NSString stringWithFormat:@"%@%@/%@/%@/0",DPBaseUrl,DPMyBreakList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:noDealString params:nil successBlock:^(id responseObject) {
        
        if ([page isEqualToString:@"1"]) {
            [weakself.myBreakFinishedList removeAllObjects];
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray *list1 = [dic[@"list"] allKeys];
        
        if (weakself.myBreakFinishedList.count > 0) {
            //若老数组最后一个model 与 新数组第一个model，是相同月份的么，则不添加该model
            MyBreakModel *model1 = [weakself.myBreakFinishedList lastObject];
            NSString *name1 = model1.wznumber;
            NSString * name2 = list1[0];
            
            if (![name1 isEqualToString: name2]) {
                [weakself addEachBreakFinishedModel:list1 WithDictionary:dic removeDuplicate:NO];
            }else{
                [weakself addEachBreakFinishedModel:list1 WithDictionary:dic removeDuplicate:YES];
            }
        }else{
            [weakself addEachBreakFinishedModel:list1 WithDictionary:dic removeDuplicate:NO];
        }
        
        [weakself setupMyBreakTableView];
        [weakself.DPRefreshTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//去重
- (void) addEachBreakFinishedModel:(NSArray *)list1 WithDictionary:(NSDictionary *)dic removeDuplicate:(BOOL)remove{
    for (NSInteger i=0; i<list1.count; i++) {
        
        NSString *key1 = list1[i];
        
        if (!remove) {
            [self.myBreakFinishedList addObject:key1];
        }
        
        NSArray *list2 = dic[@"list"][key1];
        
        for (NSInteger j=0; j<list2.count; j++) {
            MyBreakModel *orderModel = [MyBreakModel mj_objectWithKeyValues:list2[j]];
            [self.myBreakFinishedList addObject:orderModel];
        }
    }
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
