//
//  ChooseTicketViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "ChooseTicketViewController.h"
#import "ExchangeCodeViewController.h"

#import "ChooseTicketItem.h"
#import "ChooseTicketNoItem.h"
#import "SeperateItem.h"
#import "NoDataItem.h"

#import "TicketResponse.h"
#import "TicketModel.h"


@interface ChooseTicketViewController ()

@property (nonatomic,strong) NSMutableArray *ticketArray;

@end

@implementation ChooseTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择优惠券";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"兑换" forState:0];
    
    self.DPManager[@"ChooseTicketItem"] = @"ChooseTicketCell";
    self.DPManager[@"ChooseTicketNoItem"] = @"ChooseTicketNoCell";
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"NoDataItem"] = @"NoDataCell";
    
    [self getAvailableTicketList];
}

#pragma mark - init
- (NSMutableArray *)ticketArray {
    if (!_ticketArray) {
        _ticketArray = [NSMutableArray array];
    }
    return _ticketArray;
}

#pragma mark - method
- (void) setupChooseTicketTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    SeperateItem *seperateItem = [[SeperateItem alloc] init];
    seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem];
    
    DPWeakSelf;
    ChooseTicketNoItem *noChooseItem = [[ChooseTicketNoItem alloc] init];
    noChooseItem.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!self.choosedTicketModel) {
        noChooseItem.selected = YES;
    }else{
        noChooseItem.selected = NO;
    }
    [section addItem:noChooseItem];
    noChooseItem.selectionHandler = ^(id item) {
        if (weakself.didSelectedItem) {
            weakself.didSelectedItem(nil);
        }
        [weakself.navigationController popViewControllerAnimated:YES];
    };
    
    if (self.ticketArray.count > 0) {
        
        for (NSInteger i=0; i<self.ticketArray.count; i++) {
            
            TicketModel *model = self.ticketArray[i];
            
            ChooseTicketItem *chooseItem = [[ChooseTicketItem alloc] initWithTicketModel:model];
            chooseItem.selectionStyle = UITableViewCellSelectionStyleNone;
            if (!self.choosedTicketModel) {
                chooseItem.selected = NO;
            }else{
                if ([model.ID isEqualToString:self.choosedTicketModel.ID]) {
                    chooseItem.selected = YES;
                }else{
                    chooseItem.selected = NO;
                }
            }
            [section addItem:chooseItem];
            
            chooseItem.selectionHandler = ^(id item) {
                if (weakself.didSelectedItem) {
                    weakself.didSelectedItem(model);
                }
                
                [weakself.navigationController popViewControllerAnimated:YES];
            };
        }
    }else{
        NoDataItem *noDataItem = [[NoDataItem alloc] init];
        noDataItem.selectionStyle = UITableViewCellSelectionStyleNone;
        noDataItem.imageString = @"coupon_list_none";
        noDataItem.buttonString = @"暂无可用优惠券";
        [section addItem:noDataItem];
    }
}

- (void) getAvailableTicketList {//获取该订单能使用的优惠券
    NSString *ticketString = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyAvailableTicket,DPToken,self.oid];
    
    DPWeakSelf;
    [self requestDataGetWithString:ticketString params:nil successBlock:^(id responseObject) {
        TicketResponse *response = [TicketResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            for (TicketModel *ticketModel in response.data) {
                [weakself.ticketArray addObject:ticketModel];
            }
            
            [weakself setupChooseTicketTableView];
            [weakself.DPTableView reloadData];
        }else{
            [weakself showHint:response.info];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void)addRightNavAction {
    ExchangeCodeViewController *codeExchangeVC = [[ExchangeCodeViewController alloc] init];
    [self.navigationController pushViewController:codeExchangeVC animated:YES];
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
