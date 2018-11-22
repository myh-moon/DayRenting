//
//  MyOrderDetailViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailViewController.h"
#import "MyOrderDetailQuestionViewController.h"

#import "MyOrderDetailTextItem.h"
#import "SeperateItem.h"
#import "MyOrderDetailServiceItem.h"
#import "MyOrderDetailItem.h"
#import "MyOrderDetailCostItem.h"

#import "MyOrderDetailResponse.h"
#import "MyOrderModel.h"

@interface MyOrderDetailViewController ()

@end

@implementation MyOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单详情";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPTableView.backgroundColor = DPBackGroundColor;
    
    self.DPManager[@"MyOrderDetailTextItem"] = @"MyOrderDetailTextCell";
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"MyOrderDetailServiceItem"] = @"MyOrderDetailServiceCell";
    self.DPManager[@"MyOrderDetailItem"] = @"MyOrderDetailCell";
    self.DPManager[@"MyOrderDetailCostItem"] = @"MyOrderDetailCostCell";
    
    [self getMyOrderDetailMessages];
}

- (void) setupMyOrderDetailTableViewWithModel:(MyOrderModel *)orderModel {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    //message
    MyOrderDetailTextItem *messageItem = [[MyOrderDetailTextItem alloc] initWithOrderModel:orderModel];
    messageItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:messageItem];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem1.cellHeight = 12;
    [section addItem:seperateItem1];
    
    //service
    MyOrderDetailServiceItem *serviceItem = [[MyOrderDetailServiceItem alloc] initWithOrderModel:orderModel];
    serviceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:serviceItem];
    
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem2.cellHeight = 12;
    [section addItem:seperateItem2];
    
    //订单号
    MyOrderDetailItem *numberItem = [[MyOrderDetailItem alloc] init];
    numberItem.titleString = @"订单号";
    numberItem.contentString = orderModel.oid;
    numberItem.selectionStyle = UITableViewCellSelectionStyleNone;
    numberItem.cellHeight = 45;
    [section addItem:numberItem];
    
    //起步价
    MyOrderDetailItem *originalItem = [[MyOrderDetailItem alloc] init];
    originalItem.titleString = @"起步价";
    originalItem.contentString = [NSString stringWithFormat:@"%@元",orderModel.qibufee];
    originalItem.cellHeight = 45;
    originalItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:originalItem];
    
    if ([orderModel.shichangfee isEqualToString:@"0"]) {//日租
        MyOrderDetailItem *dayItem = [[MyOrderDetailItem alloc] init];
        dayItem.titleString = @"日租费用";
        dayItem.contentString = [NSString stringWithFormat:@"%@元",orderModel.rmoney];
        dayItem.cellHeight = 45;
        dayItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:dayItem];
    }else{//时租
        //计算时长
        //时长费（141分钟）
        MyOrderDetailCostItem *timeItem = [[MyOrderDetailCostItem alloc] init];
        timeItem.selectionStyle = UITableViewCellSelectionStyleNone;
        //计算时间间隔
        NSDate* date = [NSDate dateWithTimeIntervalSince1970:[orderModel.qctime doubleValue]];
        NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[orderModel.hctime doubleValue]];
        NSTimeInterval seconds = [date2 timeIntervalSinceDate:date];
        timeItem.titleString = [NSString stringWithFormat:@"时长费（%.f分钟） \n",seconds/60];
        timeItem.contentString = [NSString stringWithFormat:@"%@元",orderModel.shichangfee];
        timeItem.moneyString1 = orderModel.tsmoney;
        timeItem.moneyString2 = orderModel.ytmoney;
        timeItem.cellHeight = 100;
        [section addItem:timeItem];
        
        //里程费（44公里）
        MyOrderDetailCostItem *mileageItem = [[MyOrderDetailCostItem alloc] init];
        mileageItem.selectionStyle = UITableViewCellSelectionStyleNone;
        mileageItem.titleString = [NSString stringWithFormat:@"里程费（%@公里）",orderModel.mileage];
        mileageItem.contentString = [NSString stringWithFormat:@"%@元",orderModel.kmmoney];
        mileageItem.moneyString1 = orderModel.kmoney;
        mileageItem.moneyString2 = @"";
        mileageItem.cellHeight = 75;
        [section addItem:mileageItem];
    }

    //尊享服务费
    MyOrderDetailItem *chargeItem = [[MyOrderDetailItem alloc] init];
    chargeItem.titleString = @"尊享服务费";
    chargeItem.contentString = [NSString stringWithFormat:@"%@元",orderModel.zunxiangmony];
    chargeItem.cellHeight = 45;
    chargeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:chargeItem];
    
    //基础服务费
    MyOrderDetailItem *commonItem = [[MyOrderDetailItem alloc] init];
    commonItem.titleString = @"基础服务费";
    commonItem.contentString = [NSString stringWithFormat:@"%@元",orderModel.rservefee];
    commonItem.cellHeight = 45;
    commonItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:commonItem];
    
    //优惠券
    if (![orderModel.cmoney isEqualToString:@"0.00"]) {
        MyOrderDetailItem *ticketItem = [[MyOrderDetailItem alloc] init];
        ticketItem.titleString = @"优惠券";
        ticketItem.contentString = [NSString stringWithFormat:@"- %@元",orderModel.cmoney];
        ticketItem.selectionStyle = UITableViewCellSelectionStyleNone;
        ticketItem.cellHeight = 45;
        [section addItem:ticketItem];
    }
    
    //支付方式
    MyOrderDetailItem *payItem = [[MyOrderDetailItem alloc] init];
    payItem.titleString = @"支付方式";
    NSArray *ppp = @[@"微信支付",@"支付宝支付",@"银行卡支付",@"余额支付"];
    payItem.contentString = ppp[[orderModel.types integerValue] - 1];
    payItem.selectionStyle = UITableViewCellSelectionStyleNone;
    payItem.cellHeight = 45;
    [section addItem:payItem];
    
    //合计
    MyOrderDetailItem *allItem = [[MyOrderDetailItem alloc] init];
    allItem.titleString = [NSString stringWithFormat:@"合计（%@元）",orderModel.money];
    allItem.contentString = orderModel.smoney;
    allItem.selectionStyle = UITableViewCellSelectionStyleNone;
    allItem.showSeperate = @"3";
    allItem.cellHeight = 60;
    [section addItem:allItem];
    
    SeperateItem *seperateItem9 = [[SeperateItem alloc] init];
    seperateItem9.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem9.cellHeight = 40;
    [section addItem:seperateItem9];
}

#pragma mark - method
- (void)addRightNavAction {
    [self showHint:@"订单疑问"];
    
    MyOrderDetailQuestionViewController *myOrderDetailQuestionVC = [[MyOrderDetailQuestionViewController alloc] init];
    myOrderDetailQuestionVC.oid = self.oid;
    [self.navigationController pushViewController:myOrderDetailQuestionVC animated:YES];
    
    DPWeakSelf;
    myOrderDetailQuestionVC.didBack = ^(NSString *back) {
        [weakself getMyOrderDetailMessages];
    };
}

//获取订单详情
- (void) getMyOrderDetailMessages {
    NSString *orderDetailString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyOrderDetail,DPToken];
    
    NSDictionary *param = @{@"oid" : self.oid};
    
    DPWeakSelf;
    [self requestDataPostWithString:orderDetailString params:param successBlock:^(id responseObject) {
        
        MyOrderDetailResponse *response = [MyOrderDetailResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            
            //订单疑问
            if ([response.data.servicenum isEqualToString:@"0"]) {
                weakself.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
                [weakself.rightNavButton setTitle:@"订单疑问" forState:0];
            }else{
                weakself.navigationItem.rightBarButtonItem = nil;
            }
            
            [weakself setupMyOrderDetailTableViewWithModel:response.data];
            [weakself.DPTableView reloadData];
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
