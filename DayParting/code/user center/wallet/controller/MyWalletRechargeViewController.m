//
//  MyWalletRechargeViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletRechargeViewController.h"
#import <WXApi.h>
#import "UIViewController+DismissKeyboard.h"
#import "MyWalletRechargeResultViewController.h" //充值结果

#import "WechatModel.h"

#import "MyWalletRechargeItem.h"
#import "MyWalletRechargeWayItem.h"
#import "MyWalletRechargeSubmitItem.h"
#import "MyWalletRechargeMoneyItem.h"

@interface MyWalletRechargeViewController ()

@property (nonatomic,strong) NSMutableDictionary *rechargeDic;

@end

@implementation MyWalletRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"余额充值";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.DPTableView.backgroundColor = DPWhiteColor;
    
    self.DPManager[@"MyWalletRechargeItem"] = @"MyWalletRechargeCell";
    self.DPManager[@"MyWalletRechargeWayItem"] = @"MyWalletRechargeWayCell";
    self.DPManager[@"MyWalletRechargeSubmitItem"] = @"MyWalletRechargeSubmitCell";
    self.DPManager[@"MyWalletRechargeMoneyItem"] = @"MyWalletRechargeMoneyCell";
    
    [self setupRechargeTableView];
    
    //是否安装微信
    if ([WXApi isWXAppSupportApi]){
        //监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getRechargeResult:) name:@"ZJRecharge" object:nil];
    }
    
    [self setupForDismissKeyboard];
}

#pragma mark - init
- (NSMutableDictionary *)rechargeDic {
    if (!_rechargeDic) {
        _rechargeDic = [NSMutableDictionary dictionary];
    }
    return _rechargeDic;
}

#pragma mark - method
- (void) setupRechargeTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    MyWalletRechargeItem *moneyItem = [[MyWalletRechargeItem alloc] init];
    moneyItem.money = @"50";
    moneyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moneyItem];
    
    //选择充值金额
    MyWalletRechargeMoneyItem *chooseMoneyItem = [[MyWalletRechargeMoneyItem alloc] init];
    chooseMoneyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    chooseMoneyItem.rechargeMoney = @"50";
    [section addItem:chooseMoneyItem];
    chooseMoneyItem.didSelectedBtn = ^(NSInteger tag) {
        NSArray *aaa = @[@"50",@"100",@"200",@"500",@"800",@"1000"];
        moneyItem.money = aaa[tag - 10];
    };
    moneyItem.didEditting = ^(NSString *text) {
        [weakself.rechargeDic setValue:text forKey:@"smoney"];
        chooseMoneyItem.rechargeMoney = text;
    };
    
    //监控选择的金额
    RACSignal *chooseMoneySignal = [RACSignal combineLatest:@[RACObserve(moneyItem, money)] reduce:^id(NSString *money){
        
        [weakself.rechargeDic setValue:money forKey:@"smoney"];
        
        return @"money";
    }];

    [chooseMoneySignal subscribeNext:^(id x) {

    }];
    
    //支付方式
    MyWalletRechargeWayItem *wayItem = [[MyWalletRechargeWayItem alloc] init];
    wayItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:wayItem];
    
    
    //立即充值
    MyWalletRechargeSubmitItem *submitItem = [[MyWalletRechargeSubmitItem alloc] init];
    submitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:submitItem];
    submitItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself rechargeMoneyWithMoney:@"0.01"];
    };
}

- (void) rechargeMoneyWithMoney:(NSString *)money {
    NSString *rechargeString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyWalletOfRecharge,DPToken];
    
    NSDictionary *pa = @{@"smoney" : money};

//    self.rechargeDic
    [self requestDataPostWithString:rechargeString params:pa successBlock:^(id responseObject) {
        
        WechatModel *model = [WechatModel mj_objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"200"]) {
            
            // 调起微信支付
            PayReq *reqPay = [[PayReq alloc] init];
            reqPay.partnerId = model.partnerid;
            reqPay.prepayId = model.prepayid;
            reqPay.nonceStr = model.noncestr;
            reqPay.timeStamp = [model.timestamp intValue];
            reqPay.package = model.package;
            reqPay.sign = model.sign;
            
            [[NSUserDefaults standardUserDefaults] setObject:@"recharge" forKey:@"type"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [WXApi sendReq:reqPay];
        }
    
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void)getRechargeResult:(NSNotification *)notification {
    
    
    
//    if ([notification.object isEqualToString:@"success"]){
////        [self.navigationController popViewControllerAnimated:YES];
//
//
//
//    }else
        if([notification.object isEqualToString:@"cancel"]){
        
        UIAlertController *cancelAlertController = [UIAlertController alertControllerWithTitle:@"" message:@"取消支付" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [cancelAlertController addAction:act];
        
        [self presentViewController:cancelAlertController animated:YES completion:nil];
        
    }else{
        MyWalletRechargeResultViewController *myWalletRechargeResultVC = [[MyWalletRechargeResultViewController alloc] init];
        if ([notification.object isEqualToString:@"success"]) {
            myWalletRechargeResultVC.result = @"充值成功";
            if (self.didBack) {
                self.didBack(YES);
            }
        }else{
            myWalletRechargeResultVC.result = @"充值失败";
        }
        [self.navigationController pushViewController:myWalletRechargeResultVC animated:YES];
    }
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"type"];
}

/**
 销毁广播
 */
-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
