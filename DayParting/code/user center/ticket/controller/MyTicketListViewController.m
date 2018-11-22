//
//  MyTicketListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyTicketListViewController.h"
#import "ExchangeCodeViewController.h"

#import "TicketChooseView.h"
#import "MyTicketItem.h"
#import "NoDataItem.h"

#import "TicketResponse.h"
#import "TicketModel.h"

@interface MyTicketListViewController ()

@property (nonatomic,strong) RETableViewManager *myTicketManager;

@property (nonatomic,strong) TicketChooseView *ticketChooseView;
@property (nonatomic,strong) UITableView *myTicketTableView;

@property (nonatomic,assign) NSInteger pageTicket;
@property (nonatomic,strong) NSMutableArray *myTicketArray;
@property (nonatomic,strong) NSString *type;

@end

@implementation MyTicketListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"优惠券";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"兑换" forState:0];
    

    [self.view addSubview:self.ticketChooseView];
    [self.view addSubview:self.myTicketTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.myTicketManager = [[RETableViewManager alloc] initWithTableView:self.myTicketTableView];
    self.myTicketManager[@"MyTicketItem"] = @"MyTicketCell";
    self.myTicketManager[@"NoDataItem"] = @"NoDataCell";
//    [self setupMyTicketListTableView];
    
    _pageTicket = 1;
    self.type = @"0";
    
    [self getTicketListWithPage:@"1"];
}

#pragma mark - init
- (TicketChooseView *)ticketChooseView {
    if (!_ticketChooseView) {
        _ticketChooseView = [TicketChooseView newAutoLayoutView];
        _ticketChooseView.backgroundColor = DPWhiteColor;
        
        DPWeakSelf;
        _ticketChooseView.didSelectedBtn = ^(NSInteger tag) {
            weakself.type = [NSString stringWithFormat:@"%ld",tag - 24];
            [weakself getTicketListWithPage:@"1"];
        };
    }
    return _ticketChooseView;
}

- (UITableView *)myTicketTableView {
    if (!_myTicketTableView) {
        _myTicketTableView = [UITableView newAutoLayoutView];
        _myTicketTableView.backgroundColor = DPWhiteColor;
        _myTicketTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, DPMiddleSpacing)];
        
        DPWeakSelf;
        _myTicketTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakself.pageTicket = 1;
            [weakself getTicketListWithPage:@"1"];
            [weakself.myTicketTableView.mj_header endRefreshing];
        }];
        
        _myTicketTableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            weakself.pageTicket ++;
            NSString *page = [NSString stringWithFormat:@"%ld",(long)weakself.pageTicket];
            [weakself getTicketListWithPage:page];
            
            [weakself.myTicketTableView.mj_footer endRefreshing];
        }];
        
    }
    return _myTicketTableView;
}

- (NSMutableArray *)myTicketArray {
    if (!_myTicketArray) {
        _myTicketArray = [NSMutableArray array];
    }
    return _myTicketArray;
}

#pragma mark - method
- (void)layoutConstraints {
    [self.ticketChooseView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.ticketChooseView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.ticketChooseView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    [self.ticketChooseView autoSetDimension:ALDimensionHeight toSize:60];
    
    [self.myTicketTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.myTicketTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.ticketChooseView withOffset:1];
}

- (void) setupMyTicketListTableView {
    [self.myTicketManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.myTicketManager addSection:section];
    
    if (self.myTicketArray.count > 0) {
        for (NSInteger i = 0; i < self.myTicketArray.count; i++) {
            TicketModel *model = self.myTicketArray[i];
            MyTicketItem *ticketItem = [[MyTicketItem alloc] initWithTicketModel:model];
            ticketItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:ticketItem];
        }
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"coupon_list_none";
        noDataItem.buttonString = @"暂无可用优惠券";
        [section addItem:noDataItem];
    }
}

- (void) getTicketListWithPage:(NSString *)page{
    NSString *ticketString = [NSString stringWithFormat:@"%@%@/%@/%@/%@",DPBaseUrl,DPMyTicketList,DPToken,page,self.type];
    
    DPWeakSelf;
    [self requestDataGetWithString:ticketString params:nil successBlock:^(id responseObject) {
        TicketResponse *response = [TicketResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            
            if ([page isEqualToString:@"1"]) {
                [weakself.myTicketArray removeAllObjects];
            }
            
            for (TicketModel *ticketModel in response.data) {
                [weakself.myTicketArray addObject:ticketModel];
            }
            
            [weakself setupMyTicketListTableView];
            [weakself.myTicketTableView reloadData];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void)addRightNavAction {
    ExchangeCodeViewController *exchangeCodeVC = [[ExchangeCodeViewController alloc] init];
    [self.navigationController pushViewController:exchangeCodeVC animated:YES];
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
