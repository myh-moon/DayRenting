//
//  MyOrderViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderInvoiceViewController.h"
#import "MyOrderDetailViewController.h"

#import "MyOrderItem.h"
#import "MyOrderTimeItem.h"
#import "NoDataItem.h"

#import "MyOrderResponse.h"
#import "MyOrderModel.h"

@interface MyOrderViewController ()

@property (nonatomic,strong) NSMutableDictionary *myOrderDic;
@property (nonatomic,strong) NSMutableArray *myOrderList;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的订单";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"开发票" forState:0];
    
    self.DPRefreshTableView.backgroundColor = DPBackGroundColor;
    
    self.DPRefreshManager[@"MyOrderItem"] = @"MyOrderCell";
    self.DPRefreshManager[@"MyOrderTimeItem"] = @"MyOrderTimeCell";
    self.DPRefreshManager[@"NoDataItem"] = @"NoDataCell";
    
    [self setupMyOrderListTableView];
    
    DPWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getMyOrderListWithPage:@"1"];
        [weakself.DPRefreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex ++;
        NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageIndex];
        [weakself getMyOrderListWithPage:page];
        [weakself.DPRefreshTableView.mj_footer endRefreshing];
    };
}

#pragma mark - getter
- (NSMutableArray *)myOrderList {
    if (!_myOrderList) {
        _myOrderList = [NSMutableArray array];
    }
    return _myOrderList;
}

#pragma mark -  method
- (void) setupMyOrderListTableView {
    
    [self.DPRefreshManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.DPRefreshManager addSection:section];
    
    if (self.myOrderList.count > 0) {
        for (NSInteger i = 0; i < self.myOrderList.count; i++) {
            
            MyOrderModel *orderModel = self.myOrderList[i];
            if ([orderModel isKindOfClass:[NSString class]]) {
                MyOrderTimeItem *statusItem = [[MyOrderTimeItem alloc] init];
                statusItem.statusString = (NSString *)orderModel;
                statusItem.selectionStyle = UITableViewCellSelectionStyleNone;
                [section addItem:statusItem];
            }else{
                MyOrderItem *myOrderItem = [[MyOrderItem alloc] initWithOrderModel:orderModel];
                myOrderItem.selectionStyle = UITableViewCellSelectionStyleNone;
                [section addItem:myOrderItem];
                
                DPWeakSelf;
                myOrderItem.selectionHandler = ^(id item) {
                    
                    if ([orderModel.status isEqualToString:@"2"]) {
                        [weakself.navigationController popViewControllerAnimated:YES];
                    }else{
                        MyOrderDetailViewController *myOrderDetailVC = [[MyOrderDetailViewController alloc] init];
                        myOrderDetailVC.oid = orderModel.oid;
                        [weakself.navigationController pushViewController:myOrderDetailVC animated:YES];
                    }
                };
            }
        }
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"list_none";
        noDataItem.buttonString = @"暂无相关记录";
        [section addItem:noDataItem];
    }
}

- (void) getMyOrderListWithPage:(NSString *)page {
    NSString *myOrderString = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyOrderList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:myOrderString params:nil successBlock:^(id responseObject) {
        
        if ([page isEqualToString:@"1"]) {
            [weakself.myOrderList removeAllObjects];
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];

        
        NSArray *list1 = [dic[@"list"] allKeys];
        
      list1=  [list1 sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {

//            NSString *aaa = [obj1 substringToIndex:1];
//            NSString *bbb = [obj2 substringToIndex:1];
//
//            return [bbb compare:aaa];  //降序
              return  NSOrderedDescending;
        }];
        
        if (weakself.myOrderList.count > 0) {
            //若老数组最后一个model 与 新数组第一个model，是相同月份的么，则不添加该model
            MyOrderModel *model1 = [weakself.myOrderList lastObject];
            NSString *name1 = model1.statusname;
            NSString * name2 = list1[0];
            
            if (![name1 isEqualToString: name2]) {
                [weakself addEachModel:list1 WithDictionary:dic removeDuplicate:NO];
            }else{
                [weakself addEachModel:list1 WithDictionary:dic removeDuplicate:YES];
            }
        }else{
            [weakself addEachModel:list1 WithDictionary:dic removeDuplicate:NO];
        }
        
        [weakself setupMyOrderListTableView];
        [weakself.DPRefreshTableView reloadData];
        
        weakself.pageIndex ++;
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//去重
- (void) addEachModel:(NSArray *)list1 WithDictionary:(NSDictionary *)dic removeDuplicate:(BOOL)remove{
    for (NSInteger i=0; i<list1.count; i++) {
        
        NSString *key1 = list1[i];
        
        if (!remove) {
            [self.myOrderList addObject:key1];
        }
        
        NSArray *list2 = dic[@"list"][key1];
        
        for (NSInteger j=0; j<list2.count; j++) {
            MyOrderModel *orderModel = [MyOrderModel mj_objectWithKeyValues:list2[j]];
            [self.myOrderList addObject:orderModel];
        }
    }
}


- (void)addRightNavAction {
    [self showHint:@"开发票"];
    
    MyOrderInvoiceViewController *myOrderInvoiceVC = [[MyOrderInvoiceViewController alloc] init];
    [self.navigationController pushViewController:myOrderInvoiceVC animated:YES];
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
