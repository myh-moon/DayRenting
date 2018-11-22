//
//  MyWalletListViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletListViewController.h"

#import "MyOrderInvoiceViewController.h" //开具发票
#import "MyCardViewController.h" //我的信用卡
#import "MyWalletRechargeViewController.h" //充值
#import "ResetPayViewController.h" //设置支付密码
#import "MyTicketListViewController.h" //优惠券列表
#import "MyDepositViewController.h" //押金
#import "MyCapitalListViewController.h" //收支明细
#import "MyGrantViewController.h" //授权

#import "UIViewController+Blur.h"

#import "SeperateItem.h"
#import "MyWalletBalanceItem.h"
#import "MyWalletItem.h"
#import "MyWalletRemindItem.h"

#import "WalletResponse.h"
#import "WalletModel.h"

@interface MyWalletListViewController ()

@end

@implementation MyWalletListViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的钱包";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"收支明细" forState:0];
    
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"MyWalletBalanceItem"] = @"MyWalletBalanceCell";
    self.DPManager[@"MyWalletItem"] = @"MyWalletCell";
    self.DPManager[@"MyWalletRemindItem"] = @"MyWalletRemindCell";
    
    [self setupMyWalletListTableViewWithResponse:nil];
    
    [self getMyWalletMessage];
}

#pragma mark - method
- (void) setupMyWalletListTableViewWithResponse:(WalletResponse *)response {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    //balance
    MyWalletBalanceItem *balanceItem = [[MyWalletBalanceItem alloc] init];
    balanceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    balanceItem.balance = response.balance ? response.balance : @"--.--";
    [section addItem:balanceItem];
    balanceItem.didSelectedBtn = ^(NSInteger tag) {//充值
        
#pragma mark - checkpwd 还需要一种状态
        if ([response.checkpwd isEqualToString:@"0"]) {//未设置支付密码
            //跳转至设置密码页面
            [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:@"设置支付密码，将默认发送短信\n验证码至您已绑定手机号" andLeftAct:@"确认设置" leftColor:DPBlueColor andRightAct:@"取消" rightColor:DPLightGrayColor finishBlock:^(NSString *unlock) {
                
                if ([unlock isEqualToString:@"左边"]) {
                    ResetPayViewController *resetPayVC = [[ResetPayViewController alloc] init];
                    resetPayVC.phoneString = @"13162521916";
                    resetPayVC.direction = @"设置";
                    [weakself.navigationController pushViewController:resetPayVC animated:YES];
                }
            }];
            
        }else{
            //未交押金，
            //
            UIAlertController *reAlertController = [UIAlertController alertControllerWithTitle:@"请注意" message:@"您所充值的金额将在免押用车或预交押金后，方可使用" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *act0 = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:nil];
            [reAlertController addAction:act0];
            
            UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"继续充值" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                MyWalletRechargeViewController *myWallectRechargeVC = [[MyWalletRechargeViewController alloc] init];
                [weakself.navigationController pushViewController:myWallectRechargeVC animated:YES];
                
                myWallectRechargeVC.didBack = ^(BOOL refresh) {
                    if (refresh) {
                        [weakself getMyWalletMessage];
                    }
                };
            }];
            [reAlertController addAction:act1];
            
            [weakself presentViewController:reAlertController animated:YES completion:nil];
        }
    };
    
    //ticket
    MyWalletItem *ticketItem = [[MyWalletItem alloc] init];
    ticketItem.titleString = @"优惠券";
    ticketItem.cotentString = response.ticketnum ? [NSString stringWithFormat:@"%@张优惠券可用",response.ticketnum] : @"";
    ticketItem.selectionStyle = UITableViewCellSelectionStyleNone;
    ticketItem.showSeperate = @"2";
    [section addItem:ticketItem];
    ticketItem.selectionHandler = ^(id item) {
        MyTicketListViewController *myTicketListVC = [[MyTicketListViewController alloc] init];
        [weakself.navigationController pushViewController:myTicketListVC animated:YES];
    };
    
    //Credit Card
    MyWalletItem *cardItem = [[MyWalletItem alloc] init];
    cardItem.titleString = @"信用卡";
    cardItem.cotentString = response.bankinfo.count > 0 ? @"已绑定信用卡，享免押" : @"去绑定" ;
//    @"已绑定信用卡，享免押";
    cardItem.selectionStyle = UITableViewCellSelectionStyleNone;
    cardItem.showSeperate = @"2";
    [section addItem:cardItem];
    cardItem.selectionHandler = ^(id item) {
        MyCardViewController *myCardVC = [[MyCardViewController alloc] init];
        [weakself.navigationController pushViewController:myCardVC animated:YES];
    };
    
    //deposit
    MyWalletItem *depositItem = [[MyWalletItem alloc] init];
    depositItem.titleString = @"用车押金";
    depositItem.cotentString = @"未交押金";
    depositItem.selectionStyle = UITableViewCellSelectionStyleNone;
    depositItem.showSeperate = @"2";
    [section addItem:depositItem];
    depositItem.selectionHandler = ^(id item) {
        MyDepositViewController *myDepositVC = [[MyDepositViewController alloc] init];
        [weakself.navigationController pushViewController:myDepositVC animated:YES];
    };
    
    
    //invoice
    MyWalletItem *invoiceItem = [[MyWalletItem alloc] init];
    invoiceItem.titleString = @"开具发票";
    invoiceItem.cotentString = @"";
    invoiceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:invoiceItem];
    invoiceItem.selectionHandler = ^(id item) {
        MyOrderInvoiceViewController *myOrderInvoiceVC = [[MyOrderInvoiceViewController alloc] init];
        [weakself.navigationController pushViewController:myOrderInvoiceVC animated:YES];
    };
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem1.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem1];
    
    MyWalletRemindItem *remindItem = [[MyWalletRemindItem alloc] init];
    remindItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:remindItem];
    remindItem.selectionHandler = ^(id item) {
        MyGrantViewController *myGrantVC = [[MyGrantViewController alloc] init];
        [weakself.navigationController pushViewController:myGrantVC animated:YES];
    };
}

- (void) getMyWalletMessage {
    NSString *walletString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyWallet,DPToken];
    
    DPWeakSelf;
    [self requestDataGetWithString:walletString params:nil successBlock:^(id responseObject) {
        
        WalletResponse *response = [WalletResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            [weakself setupMyWalletListTableViewWithResponse:response];
            [weakself.DPTableView reloadData];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
    
}

//消费明细
- (void)addRightNavAction {
    MyCapitalListViewController *myCapitalListVC = [[MyCapitalListViewController alloc] init];
    [self.navigationController pushViewController:myCapitalListVC animated:YES];
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
