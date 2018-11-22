//
//  MyCardViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardViewController.h"
#import "MyCardAddViewController.h"

#import "MyCardMessageItem.h"
#import "MyCardAddItem.h"
#import "MyCardRemindItem.h"

#import "WalletResponse.h"
#import "WalletModel.h"

@interface MyCardViewController ()

@end

@implementation MyCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的信用卡";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"免押规则" forState:0];
    
    self.DPManager[@"MyCardAddItem"] = @"MyCardAddCell";
    self.DPManager[@"MyCardMessageItem"] = @"MyCardMessageCell";
    self.DPManager[@"MyCardRemindItem"] = @"MyCardRemindCell";
    
    [self setupMyCardTableViewWithModel:nil];
    
    [self getMyBankMessage];
}

- (void) setupMyCardTableViewWithModel:(WalletModel *)model {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    if (!model) {
        //未添加信用卡时
        MyCardAddItem *addItem = [[MyCardAddItem alloc] init];
        addItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:addItem];
        addItem.selectionHandler = ^(id item) {
            MyCardAddViewController *myCardAddVC = [[MyCardAddViewController alloc] init];
            [weakself.navigationController pushViewController:myCardAddVC animated:YES];
            
            myCardAddVC.didSubmitBank = ^(NSString *bank) {
                if ([bank isEqualToString:@"1"]) {
                    [weakself getMyBankMessage];
                }
            };
        };
        
        //提示
        MyCardRemindItem *remindItem = [[MyCardRemindItem alloc] init];
        remindItem.titleString = @"您尚未绑定信用卡";
        remindItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:remindItem];
    }else{
            //已有信用卡时
            MyCardMessageItem *messageItem = [[MyCardMessageItem alloc] initWithBankModel:model];
            messageItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:messageItem];
        
            //提示
            MyCardRemindItem *remindItem = [[MyCardRemindItem alloc] init];
            remindItem.titleString = @"解除信用卡绑定";
            remindItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:remindItem];
            remindItem.selectionHandler = ^(id item) {
//                [weakself unbindCardWithCardNumber:model.card];
                [weakself showHint:@"如需解绑，请联系客服"];
            };
    }
}


- (void) getMyBankMessage {
    NSString *walletString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyWallet,DPToken];
    
    DPWeakSelf;
    [self requestDataGetWithString:walletString params:nil successBlock:^(id responseObject) {
        
        WalletResponse *response = [WalletResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"] && response.bankinfo.count > 0) {
            WalletModel *model = [WalletModel mj_objectWithKeyValues:response.bankinfo[0]];
            [weakself setupMyCardTableViewWithModel:model];
            [weakself.DPTableView reloadData];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

///解绑
- (void)unbindCardWithCardNumber:(NSString *)card {
    NSString *unbindString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyWalletOfCardUnbind,DPToken];
    
    NSDictionary *param = @{@"card" : card};
    
    DPWeakSelf;
    [self requestDataPostWithString:unbindString params:param successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:model.info];
        
        if ([model.status isEqualToString:@"200"]) {
            [weakself getMyBankMessage];
        }
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
