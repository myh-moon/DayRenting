//
//  MyOrderInvoiceListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/30.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceListViewController.h"
#import "MyOrderInvoiceGenerateViewController.h"
#import "UIViewController+Blur.h"

#import "InvoiceTotalView.h"

#import "MyOrderInvoiceDetailItem.h"
#import "MyOrderInvoiceDetailHeaderItem.h"
#import "NoDataItem.h"

#import "MyOrderModel.h"

@interface MyOrderInvoiceListViewController ()

@property (nonatomic,strong) RETableViewManager *invoiceListManager;
@property (nonatomic,strong) UITableView *invoiceListTableView;
@property (nonatomic,strong) InvoiceTotalView *resultView;

@property (nonatomic,strong) NSMutableArray *myOrderListArray;
@property (nonatomic,strong) NSMutableArray *myOrderSelectedArray;
@property (nonatomic,strong) NSString *remindStr;

@property (nonatomic,assign) NSInteger invoicePage;

@end

@implementation MyOrderInvoiceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"按行程开票";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    _invoicePage = 1;
    
    self.remindStr = [NSString stringWithFormat:@"您本次选择待开发票行程%lu个，金额%@元，请核实",(unsigned long)self.myOrderSelectedArray.count,@"0.00"];
    
    [self.view addSubview:self.invoiceListTableView];
    [self.view addSubview:self.resultView];

    [self.view setNeedsUpdateConstraints];
    
    self.invoiceListManager = [[RETableViewManager alloc] initWithTableView:self.invoiceListTableView];;
    self.invoiceListManager[@"MyOrderInvoiceDetailItem"] = @"MyOrderInvoiceDetailCell";
    self.invoiceListManager[@"MyOrderInvoiceDetailHeaderItem"] = @"MyOrderInvoiceDetailHeaderCell";
    self.invoiceListManager[@"NoDataItem"] = @"NoDataCell";
    
    [self setupMyOrderInvoiceListTableView];
    
    [self getInvoiceListWithPage:@"1"];
}

- (void)layoutConstraints {
    [self.invoiceListTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.invoiceListTableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.invoiceListTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    [self.invoiceListTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.resultView];
    
    [self.resultView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.resultView autoSetDimension:ALDimensionHeight toSize:90];
}

#pragma mark - getter
- (UITableView *)invoiceListTableView {
    if (!_invoiceListTableView) {
        _invoiceListTableView = [UITableView newAutoLayoutView];
        _invoiceListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 90)];
        _invoiceListTableView.backgroundColor = DPBackGroundColor;
        
        DPWeakSelf;
        _invoiceListTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakself.invoicePage = 1;
            [weakself getInvoiceListWithPage:@"1"];
            [weakself.invoiceListTableView.mj_header endRefreshing];
        }];
        
        _invoiceListTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weakself.invoicePage ++;
            NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.invoicePage];
            [weakself getInvoiceListWithPage:page];
            
            [weakself.invoiceListTableView.mj_footer endRefreshing];
        }];
    }
    return _invoiceListTableView;
}

- (InvoiceTotalView *)resultView {
    if (!_resultView) {
        _resultView = [InvoiceTotalView newAutoLayoutView];
        
        _resultView.totalLabel.attributedText = [NSString setAttributeOfFirstString:@"0" firstFont:DPFont2 firstColor:DPBlueColor secondString:@"个行程，共" secondFont:DPFont2 secondColor:DPGrayColor thirdString:@"0.00元" thirdFont:DPFont2 thirdColor:DPBlueColor fourString:@"（满200包邮）" fourFont:DPFont2 fourColor:DPGrayColor];
        
        DPWeakSelf;
        _resultView.didClickBtn = ^(UIButton *btn) {
            
            
        };
        _resultView.didClickBtn = ^(UIButton *btn)  {
            if (btn.tag == 233) {//全选
                
                if (!btn.selected) {
                    //取消全选
                    [weakself.myOrderSelectedArray removeAllObjects];

                    weakself.resultView.totalLabel.attributedText = [NSString setAttributeOfFirstString:@"0" firstFont:DPFont2 firstColor:DPBlueColor secondString:@"个行程，共" secondFont:DPFont2 secondColor:DPGrayColor thirdString:@"0" thirdFont:DPFont2 thirdColor:DPBlueColor fourString:@"（满200包邮）" fourFont:DPFont2 fourColor:DPGrayColor];
                    
                    //列表内取消全选
                    for (MyOrderModel *model in weakself.myOrderListArray) {
                        
                        if ([model isKindOfClass:[MyOrderModel class]]) {
                            //1.全部选中
                            model.selected = NO;
                        }
                        
                        //刷新列表
                        [weakself setupMyOrderInvoiceListTableView];
                        [weakself.invoiceListTableView reloadData];
                    }
                }else{
                    //全选
                    [weakself.myOrderSelectedArray removeAllObjects];
                    
                    for (MyOrderModel *model in weakself.myOrderListArray) {
                        
                        if ([model isKindOfClass:[MyOrderModel class]]) {
                            //1.全部选中
                            model.selected = YES;
                            
                            //2.选中数组加入所有
                            [weakself.myOrderSelectedArray addObject:model];
                        }
                        
                        //刷新列表
                        [weakself setupMyOrderInvoiceListTableView];
                        [weakself.invoiceListTableView reloadData];
                        
                        //统计信息
                        //1.个数
                        NSString *firstString = [NSString stringWithFormat:@"%lu",(unsigned long)weakself.myOrderSelectedArray.count];
                        
                        //总金额
                        float sss = 0.00;
                        for (NSInteger k=0 ; k < self.myOrderSelectedArray.count ; k++) {
                            MyOrderModel *calModel = weakself.myOrderSelectedArray[k];
                            sss += [calModel.smoney floatValue];
                        }
                        NSString *thirdString = [NSString stringWithFormat:@"%.2f元",sss];
                        
                        weakself.resultView.totalLabel.attributedText = [NSString setAttributeOfFirstString:firstString firstFont:DPFont2 firstColor:DPBlueColor secondString:@"个行程，共" secondFont:DPFont2 secondColor:DPGrayColor thirdString:thirdString thirdFont:DPFont2 thirdColor:DPBlueColor fourString:@"（满200包邮）" fourFont:DPFont2 fourColor:DPGrayColor];
                        
                        weakself.remindStr = [NSString stringWithFormat:@"您本次选择待开发票行程%lu个，金额%.2f元，请核实",(unsigned long)weakself.myOrderSelectedArray.count,sss];
                        
                    }
                }


            }else if(btn.tag == 234){ //下一步
                if (weakself.myOrderSelectedArray.count > 0) {
                    [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:weakself.remindStr andLeftAct:@"确认开票" leftColor:DPBlueColor andRightAct:@"取消" rightColor:DPLightGrayColor finishBlock:^(NSString *unlock) {
                        if ([unlock isEqualToString:@"左边"]) {
                            
                            //oids
                            NSString *oooo = @"";
                            float money = 0;
                            for (NSInteger i=0; i<weakself.myOrderSelectedArray.count; i++) {
                                MyOrderModel *model = weakself.myOrderSelectedArray[i];
                                
                                if ([oooo isEqualToString:@""]) {
                                    oooo = model.oid;
                                }else{
                                    oooo = [NSString stringWithFormat:@"%@,%@",model.oid,oooo];
                                }
                                
                                money += [model.smoney floatValue];
                            }
                            
                            MyOrderInvoiceGenerateViewController *myOrderInvoiceGenerateVC = [[MyOrderInvoiceGenerateViewController alloc] init];
                            myOrderInvoiceGenerateVC.oids = oooo;
                            myOrderInvoiceGenerateVC.money = [NSString stringWithFormat:@"%.2f",money];
                            [weakself.navigationController pushViewController:myOrderInvoiceGenerateVC animated:YES];
                        }
                    }];
                    
                }else{
                    [weakself showHint:@"请选择行程"];
                }
            }
        };
    }
    return _resultView;
}

- (NSMutableArray *)myOrderListArray {
    if (!_myOrderListArray) {
        _myOrderListArray = [NSMutableArray array];
    }
    return _myOrderListArray;
}

- (NSMutableArray *)myOrderSelectedArray {
    if (!_myOrderSelectedArray) {
        _myOrderSelectedArray = [NSMutableArray array];
    }
    return _myOrderSelectedArray;
}

#pragma mark - method
- (void) setupMyOrderInvoiceListTableView {
    
    [self.invoiceListManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.invoiceListManager addSection:section];
    
    if (self.myOrderListArray.count > 0) {
        for (NSInteger i=0; i<self.myOrderListArray.count; i++) {
            
            MyOrderModel *orderModel = self.myOrderListArray[i];
            
            if ([orderModel isKindOfClass:[NSString class]]) {
                MyOrderInvoiceDetailHeaderItem *headerItem = [[MyOrderInvoiceDetailHeaderItem alloc] init];
                headerItem.timeString = (NSString *)orderModel;
                headerItem.selectionStyle = UITableViewCellSelectionStyleNone;
                [section addItem:headerItem];
            }else{
                MyOrderInvoiceDetailItem *invoiceItem = [[MyOrderInvoiceDetailItem alloc] initWithOrderModel:orderModel];
                invoiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
                [section addItem:invoiceItem];
                
                DPWeakSelf;
                invoiceItem.selectionHandler = ^(MyOrderInvoiceDetailItem *item) {
                    item.selectedInvoice = !item.selectedInvoice;
                    if (item.selectedInvoice) {
                        orderModel.selected = YES;
                        [weakself.myOrderSelectedArray addObject:orderModel];
                    }else{
                        orderModel.selected = NO;
                        [weakself.myOrderSelectedArray removeObject:orderModel];
                    }
                    //统计信息
                    //1.个数
                    NSString *firstString = [NSString stringWithFormat:@"%lu",(unsigned long)weakself.myOrderSelectedArray.count];
                    
                    //总金额
                    float sss = 0.00;
                    for (NSInteger k=0 ; k < self.myOrderSelectedArray.count ; k++) {
                        MyOrderModel *calModel = self.myOrderSelectedArray[k];
                        sss += [calModel.smoney floatValue];
                    }
                    NSString *thirdString = [NSString stringWithFormat:@"%.2f元",sss];
                    
                    weakself.resultView.totalLabel.attributedText = [NSString setAttributeOfFirstString:firstString firstFont:DPFont2 firstColor:DPBlueColor secondString:@"个行程，共" secondFont:DPFont2 secondColor:DPGrayColor thirdString:thirdString thirdFont:DPFont2 thirdColor:DPBlueColor fourString:@"（满200包邮）" fourFont:DPFont2 fourColor:DPGrayColor];
                    
                    weakself.remindStr = [NSString stringWithFormat:@"您本次选择待开发票行程%lu个，金额%.2f元，请核实",(unsigned long)self.myOrderSelectedArray.count,sss];
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

//已完成的订单，才能开具发票
- (void) getInvoiceListWithPage:(NSString *)page {
    NSString *invoiceListString = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyOrderInvoiceList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:invoiceListString params:nil successBlock:^(id responseObject) {
        
        if ([page isEqualToString:@"1"]) {
            [weakself.myOrderListArray removeAllObjects];
            
            //所选数组清空
            [weakself.myOrderSelectedArray removeAllObjects];
            
            weakself.resultView.totalLabel.attributedText = [NSString setAttributeOfFirstString:@"0" firstFont:DPFont2 firstColor:DPBlueColor secondString:@"个行程，共" secondFont:DPFont2 secondColor:DPGrayColor thirdString:@"0.00元" thirdFont:DPFont2 thirdColor:DPBlueColor fourString:@"（满200包邮）" fourFont:DPFont2 fourColor:DPGrayColor];
            
            weakself.resultView.selectTotalButton.selected = NO;
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray *list1 = [dic[@"list"] allKeys];
        
        if (weakself.myOrderListArray.count > 0) {
            
            //若老数组最后一个model 与 新数组第一个model，是相同月份的么，则不添加该model
            NSDictionary *dic1 = [weakself.myOrderListArray lastObject];
            
            MyOrderModel *orModel = [MyOrderModel mj_objectWithKeyValues:dic1];
            
            NSString *time1 = [NSDate getYMFormatterTime:orModel.addtime];
            NSString * time2 = list1[0];
            
            if (![time1 isEqualToString: time2]) {
                
                [weakself addEachModel:list1 WithDictionary:dic removeDuplicate:NO];
            }else{
                [weakself addEachModel:list1 WithDictionary:dic removeDuplicate:YES];
            }
        }else{
            [weakself addEachModel:list1 WithDictionary:dic removeDuplicate:NO];
        }
        
        [weakself setupMyOrderInvoiceListTableView];
        [weakself.invoiceListTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//去重
- (void) addEachModel:(NSArray *)list1 WithDictionary:(NSDictionary *)dic removeDuplicate:(BOOL)remove{
    for (NSInteger i=0; i<list1.count; i++) {
        
        NSString *key1 = list1[i];
        
        if (!remove) {
            [self.myOrderListArray addObject:key1];
        }
        
        NSArray *list2 = dic[@"list"][key1];
        
        for (NSDictionary *dic in list2) {
            MyOrderModel *orderModel = [MyOrderModel mj_objectWithKeyValues:dic];
            [self.myOrderListArray addObject:orderModel];
        }
    }
}

//- (void) addEachModel:(NSArray *)list1 WithDictionary:(NSDictionary *)dic{
//    for (NSInteger i=0; i<list1.count; i++) {
//
//        NSString *key1 = list1[i];
//
//        [self.myOrderListArray addObject:key1];
//
//        NSArray *list2 = dic[@"list"][key1];
//
//        for (MyOrderModel *orderModel in list2) {
//            [self.myOrderListArray addObject:orderModel];
//        }
//    }
//}


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
