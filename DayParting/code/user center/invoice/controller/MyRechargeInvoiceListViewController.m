//
//  MyRechargeInvoiceListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/12.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyRechargeInvoiceListViewController.h"
#import "UIViewController+Blur.h"
#import "InvoiceTotalView.h"

#import "SeperateItem.h"
#import "MyRechargeInvoiceItem.h"
#import "NoDataItem.h"

@interface MyRechargeInvoiceListViewController ()

@property (nonatomic,strong) RETableViewManager *rechargeInvoiceListManager;
@property (nonatomic,strong) UITableView *rechargeInvoiceListTableView;
@property (nonatomic,strong) InvoiceTotalView *rechargeInvoiceResultView;

@property (nonatomic,strong) NSMutableArray *myRechargeListArray;
@property (nonatomic,strong) NSMutableArray *myRechargeSelectedArray;

@property (nonatomic,assign) NSInteger invoicePage;

@end

@implementation MyRechargeInvoiceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"按充值开票";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.view.backgroundColor = DPRedColor;
    
    [self.view addSubview:self.rechargeInvoiceListTableView];
    [self.view addSubview:self.rechargeInvoiceResultView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.rechargeInvoiceListManager = [[RETableViewManager alloc] initWithTableView:self.rechargeInvoiceListTableView];
    
    self.rechargeInvoiceListManager[@"SeperateItem"] = @"SeperateCell";
    self.rechargeInvoiceListManager[@"MyRechargeInvoiceItem"] = @"MyRechargeInvoiceCell";
    self.rechargeInvoiceListManager[@"NoDataItem"] = @"NoDataCell";

    [self getMyRechargeListWithPage:@"1"];
}

- (void)layoutConstraints {
    [self.rechargeInvoiceListTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.rechargeInvoiceListTableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.rechargeInvoiceListTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    [self.rechargeInvoiceListTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:92];
    
    [self.rechargeInvoiceResultView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.rechargeInvoiceResultView autoSetDimension:ALDimensionHeight toSize:92];
}

#pragma mark - init
- (UITableView *)rechargeInvoiceListTableView {
    if (!_rechargeInvoiceListTableView) {
        _rechargeInvoiceListTableView = [UITableView newAutoLayoutView];
        _rechargeInvoiceListTableView.backgroundColor = DPWhiteColor;
        _rechargeInvoiceListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, DPMiddleSpacing)];
        
        DPWeakSelf;
        _rechargeInvoiceListTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself.rechargeInvoiceListTableView.mj_header beginRefreshing];
            [weakself headerFreshOfMyRechargeList];
        }];
        
        _rechargeInvoiceListTableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
            [weakself.rechargeInvoiceListTableView.mj_footer beginRefreshing];
            [weakself footerFreshOfMyRechargeList];
        }];
    }
    return _rechargeInvoiceListTableView;
}

- (InvoiceTotalView *)rechargeInvoiceResultView {
    if (!_rechargeInvoiceResultView) {
        _rechargeInvoiceResultView = [InvoiceTotalView newAutoLayoutView];

        _rechargeInvoiceResultView.totalLabel.attributedText = [NSString setAttributeOfFirstString:@"0" firstFont:DPFont2 firstColor:DPBlueColor secondString:@"个充值记录，共" secondFont:DPFont2 secondColor:DPGrayColor thirdString:@"0.00元" thirdFont:DPFont2 thirdColor:DPBlueColor fourString:@"（满200包邮）" fourFont:DPFont2 fourColor:DPGrayColor];
        
        DPWeakSelf;
        [_rechargeInvoiceResultView.nextStepButton addAction:^(UIButton *btn) {
            [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:@"您本次选择待开充值记录1个，金额66.30元，请核实" andLeftAct:@"确认开票" leftColor:DPBlueColor andRightAct:@"取消" rightColor:DPLightGrayColor finishBlock:^(NSString *unlock) {
                
            }];
        }];
    }
    return _rechargeInvoiceResultView;
}

- (NSMutableArray *)myRechargeListArray {
    if (!_myRechargeListArray) {
        _myRechargeListArray = [NSMutableArray array];
    }
    return _myRechargeListArray;
}

- (NSMutableArray *)myRechargeSelectedArray {
    if (!_myRechargeSelectedArray) {
        _myRechargeSelectedArray = [NSMutableArray array];
    }
    return _myRechargeSelectedArray;
}

#pragma mark - method
- (void) setupMyRechargeInvoiceListTableView {
    
    [self.rechargeInvoiceListManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.rechargeInvoiceListManager addSection:section];
    
    if (self.myRechargeListArray.count > 0) {
        SeperateItem *seperateItem = [[SeperateItem alloc] init];
        seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
        seperateItem.cellHeight = DPSmallSpacing;
        [section addItem:seperateItem];
        
        for (NSInteger i=0; i<10; i++) {
            MyRechargeInvoiceItem *myRechargeInvoiceItem = [[MyRechargeInvoiceItem alloc] init];
            myRechargeInvoiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:myRechargeInvoiceItem];
        }
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"list_none";
        noDataItem.buttonString = @"暂无相关记录";
        [section addItem:noDataItem];
    }
}

- (void) headerFreshOfMyRechargeList {
    self.invoicePage = 1;
    [self getMyRechargeListWithPage:@"1"];
    [self.rechargeInvoiceListTableView.mj_header endRefreshing];
}

- (void) footerFreshOfMyRechargeList {
    self.invoicePage ++;
    NSString *page = [NSString stringWithFormat:@"%ld",(long)self.invoicePage];
    [self getMyRechargeListWithPage:page];
    [self.rechargeInvoiceListTableView.mj_footer endRefreshing];
}

- (void) getMyRechargeListWithPage:(NSString *)page {
    NSString *rechargeList = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyRechargeInvoiceList,DPToken,page];
    
    DPWeakSelf;
    [self requestDataGetWithString:rechargeList params:nil successBlock:^(id responseObject) {
        NSLog(@"121212");
        NSLog(@"121212");
        NSLog(@"121212");
        NSLog(@"121212");
        
        [weakself setupMyRechargeInvoiceListTableView];
        [weakself.rechargeInvoiceListTableView reloadData];
        
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
