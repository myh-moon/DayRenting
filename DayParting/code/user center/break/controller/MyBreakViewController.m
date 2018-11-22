//
//  MyBreakViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyBreakViewController.h"
#import "MyBreakHandleResultViewController.h" //处理结果查询
#import "MyBreakHandleViewController.h" //线上缴费

#import "UIViewController+Blur.h"

#import "MyBreakItem.h"
#import "MyBreakHeaderItem.h"
#import "NoDataItem.h"

#import "MyBreakModel.h"

@interface MyBreakViewController ()

@property (nonatomic,strong) NSMutableArray *myBreakList;

@end

@implementation MyBreakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"违章查询";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"已处理" forState:0];
    
    self.DPRefreshTableView.backgroundColor = DPBackGroundColor;
    
    self.DPRefreshManager[@"MyBreakHeaderItem"] = @"MyBreakHeaderCell";
    self.DPRefreshManager[@"MyBreakItem"] = @"MyBreakCell";
    self.DPRefreshManager[@"NoDataItem"] = @"NoDataCell";

//    [self setupMyBreakTableView];
    
    DPWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getListOfBreakWithPage:@"1"];
        [weakself.DPRefreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex++;
        NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageIndex];
        [weakself getListOfBreakWithPage:page];
        [weakself.DPRefreshTableView.mj_footer endRefreshing];
    };
}
#pragma mark - init
- (NSMutableArray *)myBreakList {
    if (!_myBreakList) {
        _myBreakList = [NSMutableArray array];
    }
    return _myBreakList;
}

#pragma mark - method
- (void) setupMyBreakTableView {
    
    [self.DPRefreshManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPRefreshManager addSection:section];
    
    if (self.myBreakList.count > 0) {
        
        for ( NSInteger i=0; i<self.myBreakList.count; i++) {
            
            MyBreakModel *breakModel = self.myBreakList[i];
            
            if ([breakModel isKindOfClass: [NSString class]]) {
                //header
                MyBreakHeaderItem *myBreakHeaderItem = [[MyBreakHeaderItem alloc] init];
                myBreakHeaderItem.selectionStyle = UITableViewCellSelectionStyleNone;
                myBreakHeaderItem.licenseStr = (NSString *)breakModel;
                [section addItem:myBreakHeaderItem];
                
            }else{
                //model
                DPWeakSelf;
                MyBreakItem *myBreakItem = [[MyBreakItem alloc] initWithModel:breakModel];
                myBreakItem.selectionStyle = UITableViewCellSelectionStyleNone;
                [section addItem:myBreakItem];
                
                //查看处理进度
                myBreakItem.selectionHandler = ^(id item) {
                    MyBreakHandleResultViewController *myBreakHandleResultVC = [[MyBreakHandleResultViewController alloc] init];
                    myBreakHandleResultVC.ID = breakModel.ID;
                    [weakself.navigationController pushViewController:myBreakHandleResultVC animated:YES];
                };
                
                //去处理
                myBreakItem.didSelectedBtn = ^(NSInteger tag) {
                    [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:@"请选择处理方式，线上处理所生成的费用视您的扣分情况决定" andLeftAct:@"自行处理" leftColor:DPLightGrayColor andRightAct:@"线上缴费" rightColor:DPBlueColor finishBlock:^(NSString *unlock) {
                        
                            if ([unlock isEqualToString:@"左边"]) {
                                //1.自行处理
                                MyBreakHandleViewController *myBreakHandleVC = [[MyBreakHandleViewController alloc] init];
                                myBreakHandleVC.ID = breakModel.ID;
                                myBreakHandleVC.handleString = @"2";
                                [weakself.navigationController pushViewController:myBreakHandleVC animated:YES];
                            }else{
                                //2.线上缴费
                                MyBreakHandleViewController *myBreakHandleVC = [[MyBreakHandleViewController alloc] init];
                                myBreakHandleVC.ID = breakModel.ID;
                                myBreakHandleVC.handleString = @"1";
                                [weakself.navigationController pushViewController:myBreakHandleVC animated:YES];
                            }
                    }];
                };
            }
        }
    }else{
        //header
        MyBreakHeaderItem *myBreakHeaderItem = [[MyBreakHeaderItem alloc] init];
        myBreakHeaderItem.selectionStyle = UITableViewCellSelectionStyleNone;
        myBreakHeaderItem.numberStr = @"0";
        [section addItem:myBreakHeaderItem];
        
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"no_violation_record";
        noDataItem.buttonString = @"暂无相关违章记录";
        [section addItem:noDataItem];
    }
}

//未处理违章列表
- (void) getListOfBreakWithPage:(NSString *)page {
    NSString *noDealString = [NSString stringWithFormat:@"%@%@/%@/%@/0",DPBaseUrl,DPMyBreakList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:noDealString params:nil successBlock:^(id responseObject) {
        
        if ([page isEqualToString:@"1"]) {
            [weakself.myBreakList removeAllObjects];
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray *list1 = [dic[@"list"] allKeys];
        
        if (weakself.myBreakList.count > 0) {
            //若老数组最后一个model 与 新数组第一个model，是相同月份的么，则不添加该model
            MyBreakModel *model1 = [weakself.myBreakList lastObject];
            NSString *name1 = model1.wznumber;
            NSString * name2 = list1[0];
            
            if (![name1 isEqualToString: name2]) {
                [weakself addEachBreakModel:list1 WithDictionary:dic removeDuplicate:NO];
            }else{
                [weakself addEachBreakModel:list1 WithDictionary:dic removeDuplicate:YES];
            }
        }else{
            [weakself addEachBreakModel:list1 WithDictionary:dic removeDuplicate:NO];
        }
        
        [weakself setupMyBreakTableView];
        [weakself.DPRefreshTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//去重
- (void) addEachBreakModel:(NSArray *)list1 WithDictionary:(NSDictionary *)dic removeDuplicate:(BOOL)remove{
    for (NSInteger i=0; i<list1.count; i++) {
        
        NSString *key1 = list1[i];
        
        if (!remove) {
            [self.myBreakList addObject:key1];
        }
        
        NSArray *list2 = dic[@"list"][key1];
        
        for (NSInteger j=0; j<list2.count; j++) {
            MyBreakModel *orderModel = [MyBreakModel mj_objectWithKeyValues:list2[j]];
            [self.myBreakList addObject:orderModel];
        }
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
