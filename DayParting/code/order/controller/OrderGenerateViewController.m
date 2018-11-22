//
//  OrderGenerateViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderGenerateViewController.h"
#import "OrderResultViewController.h"
#import "UIViewController+Blur.h"
#import "CarReturnViewController.h" //选择还车点

#import <AMapSearchKit/AMapSearchKit.h>

//model
#import "CarPayMessageResponse.h"
#import "CarPayMessageModel.h"
#import "CarReturnModel.h"

//view
#import "OrderGenerateBottomView.h"

//viewmodel
#import "OrderGenerateTextItem.h"
#import "SeperateItem.h"
#import "OrderGenerateProcessItem.h"
#import "OrderGenerateCostItem.h"
#import "OrderGenerateCostCategoryItem.h"
#import "OrderGenerateCostTotalItem.h"

@interface OrderGenerateViewController ()<AMapSearchDelegate>
@property (nonatomic,strong) RETableViewManager *orderGenerateManager;
@property (nonatomic,strong) UITableView *orderGenerateTableView;
@property (nonatomic,strong) OrderGenerateBottomView *generateView;

@property (nonatomic,strong) NSMutableDictionary *generateDic;

@property (nonatomic,strong) NSMutableArray *generateArray;

@property (nonatomic,strong) AMapSearchAPI *search;

//@property (nonatomic,copy) NSString *hcaddress;
//@property (nonatomic,copy) NSString *hctime;


@end

@implementation OrderGenerateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.title = @"确认订单";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"用车事项" forState:0];
    
    [self.view addSubview:self.orderGenerateTableView];
    [self.view addSubview:self.generateView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.orderGenerateManager = [[RETableViewManager alloc] initWithTableView:self.orderGenerateTableView];
    self.orderGenerateManager[@"OrderGenerateTextItem"] = @"OrderGenerateTextCell";
    self.orderGenerateManager[@"SeperateItem"] = @"SeperateCell";
    self.orderGenerateManager[@"OrderGenerateProcessItem"] = @"OrderGenerateProcessCell";
    self.orderGenerateManager[@"OrderGenerateCostItem"] = @"OrderGenerateCostCell";
    self.orderGenerateManager[@"OrderGenerateCostCategoryItem"] = @"OrderGenerateCostCategoryCell";
    self.orderGenerateManager[@"OrderGenerateCostTotalItem"] = @"OrderGenerateCostTotalCell";
    
    [self setupOrderGenerateTableView];
}

#pragma mark - init
- (UITableView *)orderGenerateTableView {
    if (!_orderGenerateTableView) {
        _orderGenerateTableView = [UITableView newAutoLayoutView];
        _orderGenerateTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 30)];
        _orderGenerateTableView.backgroundColor = DPBackGroundColor;
        _orderGenerateTableView.showsVerticalScrollIndicator = NO;
    }
    return _orderGenerateTableView;
}

- (OrderGenerateBottomView *)generateView {
    if (!_generateView) {
        _generateView = [OrderGenerateBottomView newAutoLayoutView];
        
        DPWeakSelf;
        [_generateView.orderButton addAction:^(UIButton *btn) {
            [weakself confirmPayMessage];
        }];
    }
    return _generateView;
}

- (NSMutableDictionary *)generateDic {
    if (!_generateDic) {
        _generateDic = [NSMutableDictionary dictionary];
    }
    return _generateDic;
}

- (NSMutableArray *)generateArray {
    if (!_generateArray) {
        _generateArray = [NSMutableArray array];
    }
    return _generateArray;
}

#pragma mark - method
- (void)addRightNavAction {
    [self showHint:@"用车事项"];
    
//    [self showMenuViewInView:self.view finishBlock:^(NSString *cate) {
//        if ([cate isEqualToString:@"取消订单"]) {
//
//        }else{//故障上报
//
//        }
//    }];
}

- (void)layoutConstraints {
    [self.orderGenerateTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.orderGenerateTableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.orderGenerateTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    [self.orderGenerateTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.generateView];
    
    if (IS_IPHONE_X) {
        [self.generateView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.generateView autoSetDimension:ALDimensionHeight toSize:60 + DangerArea];
    }else{
        [self.generateView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.generateView autoSetDimension:ALDimensionHeight toSize:60];
    }
    
}

- (void) setupOrderGenerateTableView {
    
    [self.orderGenerateManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.orderGenerateManager addSection:section];
    
    //text
    OrderGenerateTextItem *textItem = [[OrderGenerateTextItem alloc] initWithCarDetailModel:self.carModel];
    textItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:textItem];
    
    //seperate
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem1.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem1];

    //process
    OrderGenerateProcessItem *processItem = [[OrderGenerateProcessItem alloc] init];
    processItem.bname = self.carModel.bname;
    processItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:processItem];
    
    DPWeakSelf;
    @weakify(processItem);
    processItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 109) {//选择还车点
            CarReturnViewController *carReturnVC = [[CarReturnViewController alloc] init];
            carReturnVC.qcCoordinate = weakself.qcCoordinate;
            [weakself.navigationController pushViewController:carReturnVC animated:YES];
            
            //block
            [carReturnVC setDidSelectedCell:^(CarReturnModel *returnModel) {
                
                [weakself.generateDic setValue:returnModel.range forKey:@"mileage"];
                [weakself.generateDic setValue:returnModel.address forKey:@"hcaddress"];
                [weakself.generateDic setValue:returnModel.name forKey:@"hcnet"];
                [weakself.generateDic setValue:returnModel.ID forKey:@"depotid"];
                
                //两个经纬度的实际距离
                AMapDistanceSearchRequest *request = [[AMapDistanceSearchRequest alloc] init];
                request.origins = @[
                                    [AMapGeoPoint locationWithLatitude:self.qcCoordinate.latitude longitude:self.qcCoordinate.longitude]];
                
                request.destination = [AMapGeoPoint locationWithLatitude:[returnModel.lat floatValue] longitude:[returnModel.lng floatValue]];
                request.type = 1;

                weakself.search = [[AMapSearchAPI alloc] init];
                weakself.search.delegate = weakself;
                [weakself.search AMapDistanceSearch:request];
                
                //cell显示
                @strongify(processItem);
                processItem.hcaddress = returnModel.name;
                
            }];
            
        }else if (tag == 110){//同取车点
            [weakself.generateDic setValue:@"0" forKey:@"mileage"];
            [weakself.generateDic setValue:weakself.carModel.address forKey:@"hcaddress"];
            [weakself.generateDic setValue:weakself.carModel.bname forKey:@"hcnet"];
            [weakself.generateDic setValue:weakself.carModel.ID forKey:@"depotid"];
            
            //两个经纬度的实际距离
            [weakself.generateDic setValue:@"0" forKey:@"hckm"];
            
            //计算费用
            if (weakself.generateDic[@"hckm"] && weakself.generateDic[@"qctime"]) {
                [weakself generatePayMessages];
            }
            
            //cell显示
            @strongify(processItem);
            processItem.hcaddress = weakself.carModel.bname;
            
        }if (tag == 111) {//选择时间
            [weakself showDatePickerViewInView:self.view finishBlock:^(NSString *date) {
                
                //当前时间
                NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"yyyy/MM/dd HH:mm"];
                NSString *currentDate=[dateFormat stringFromDate:[NSDate date]];
                
                //保存参数
                [weakself.generateDic setValue:currentDate forKey:@"qctime"];
                [weakself.generateDic setValue:date forKey:@"hctime"];
                
                //还车时间
                NSString *qcti = [currentDate substringFromIndex:5];
                NSString *hcti = [date substringFromIndex:5];
                @strongify(processItem);
                processItem.hctime = [NSString stringWithFormat:@"%@ - %@",qcti,hcti];
                
                //计算费用
                if (weakself.generateDic[@"hckm"] && weakself.generateDic[@"qctime"]) {
                    [weakself generatePayMessages];
                }
                
            }];
        }
    };
    
//    RACSignal *dateSignal = [RACSignal combineLatest:@[RACObserve(processItem, hctime),RACObserve(processItem, hcaddress)] reduce:^id(NSString *date,NSString *address){
//
//        if (date && address) {
//            if (![date containsString:@"选择"] && ![address containsString:@"选择"]) {
//                [weakself generatePayMessages];
//            }
//        }
//
//        return @"date";
//    }];

//    [dateSignal subscribeNext:^(id x) {
//
//    }];
    
    //seperate
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem2.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem2];
    
    //cost
    OrderGenerateCostItem *costItem = [[OrderGenerateCostItem alloc] init];
    costItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:costItem];
    
    if (self.generateArray.count > 0) {
        
        CarPayMessageModel *payMessageModel = self.generateArray[0];
        if ([payMessageModel.smoney isEqualToString:@"0"]) {
            //日租
            OrderGenerateCostCategoryItem *dayCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
            dayCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
            dayCategoryItem.titleString = @"日租费用";
            dayCategoryItem.moneyString  = [NSString stringWithFormat:@"%@元",payMessageModel.rmoney];
            [section addItem:dayCategoryItem];
           
        }else{
            //时租
            OrderGenerateCostCategoryItem *kiloCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
            kiloCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
            kiloCategoryItem.category = @"1";
            
            //价格
            NSDate *today = [NSDate date];
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"HH:mm"];
            NSString * todayStr=[dateFormat stringFromDate:today];//将日期转换成字符串
            today = [ dateFormat dateFromString:todayStr];//转换成NSDate类型。日期置为方法默认日期
            NSDate *start = [dateFormat dateFromString:@"9:00"];
            NSDate *expire = [dateFormat dateFromString:@"20:00"];
            if ([today laterDate:start] && [today earlierDate:expire]) {
                //白天费用
                kiloCategoryItem.titleString = payMessageModel.tsmoney;
            }else{
                //夜晚费用
                kiloCategoryItem.titleString = payMessageModel.ytmoney;
            }
            //每公里多少钱
            kiloCategoryItem.titleString2 = payMessageModel.smoney;
            
            kiloCategoryItem.moneyString  = payMessageModel.totlsmoney;
            [section addItem:kiloCategoryItem];
        }
        
    }else{
        //4小时之内
        //公里计费
        OrderGenerateCostCategoryItem *kiloCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
        kiloCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
        kiloCategoryItem.category = @"1";
        
        //价格
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"HH:mm"];
        NSString * todayStr=[dateFormat stringFromDate:today];//将日期转换成字符串
        today = [ dateFormat dateFromString:todayStr];//转换成NSDate类型。日期置为方法默认日期
        NSDate *start = [dateFormat dateFromString:@"9:00"];
        NSDate *expire = [dateFormat dateFromString:@"20:00"];
        if ([today laterDate:start] && [today earlierDate:expire]) {
            //白天费用
            kiloCategoryItem.titleString = self.carModel.tsmoney;
        }else{
            //夜晚费用
            kiloCategoryItem.titleString = self.carModel.ytmoney;
        }
        //每公里多少钱
        kiloCategoryItem.titleString2 = self.carModel.smoney;
        
        kiloCategoryItem.moneyString  = @"0元";
        [section addItem:kiloCategoryItem];
        
    }
    
    //尊享服务费
    OrderGenerateCostCategoryItem *serviceCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
    serviceCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
    serviceCategoryItem.titleString = @"尊享服务费";
    if (self.generateArray.count > 0) {
        CarPayMessageModel *payMessageModel = self.generateArray[0];
        serviceCategoryItem.moneyString  = [NSString stringWithFormat:@"%@元",payMessageModel.zunxiangmony];
    }else{
        serviceCategoryItem.moneyString  = @"0元";
    }
    [section addItem:serviceCategoryItem];
    
//    车辆整备费
//    OrderGenerateCostCategoryItem *outfitCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
//    outfitCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
//    outfitCategoryItem.titleString = @"车辆整备费";
//    outfitCategoryItem.moneyString  = @"20.00元";
//    [section addItem:outfitCategoryItem];
    
    //基础服务费
    OrderGenerateCostCategoryItem *baseCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
    baseCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
    baseCategoryItem.titleString = @"基础服务费";

    if (self.generateArray.count > 0) {
        CarPayMessageModel *payMessageModel = self.generateArray[0];
        baseCategoryItem.moneyString  = [NSString stringWithFormat:@"%@元",payMessageModel.rservefee];
    }else{
        baseCategoryItem.moneyString  = @"0元";
    }
    [section addItem:baseCategoryItem];
    
    //还车附加费
    if (self.generateArray.count > 0) {
        CarPayMessageModel *payMessageModel = self.generateArray[0];
        if (![payMessageModel.hcmoney isEqualToString:@"0"]) {
            OrderGenerateCostCategoryItem *additionalCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
            additionalCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
            additionalCategoryItem.titleString = @"还车附加费";
            additionalCategoryItem.moneyString = [NSString stringWithFormat:@"%@元",payMessageModel.hcmoney];
            [section addItem:additionalCategoryItem];
        }
        
        [weakself.generateDic setValue:payMessageModel.hcmoney forKey:@"hcmoney"];
    }
    
    //租车押金
    if (self.generateArray.count > 0) {
        
        CarPayMessageModel *payMessageModel = self.generateArray[0];
        if (![payMessageModel.ymoney isEqualToString:@"0"]) {
            OrderGenerateCostCategoryItem *depositCategoryItem = [[OrderGenerateCostCategoryItem alloc] init];
            depositCategoryItem.selectionStyle = UITableViewCellSelectionStyleNone;
            depositCategoryItem.titleString = @"租车押金";
            depositCategoryItem.category = @"2";
            depositCategoryItem.moneyString = [NSString stringWithFormat:@"%@  ",payMessageModel.ymoney];
            [section addItem:depositCategoryItem];
        }
    }
    
    //total
    OrderGenerateCostTotalItem *totalItem = [[OrderGenerateCostTotalItem alloc] init];
    totalItem.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.generateArray.count > 0) {
        CarPayMessageModel *payMessageModel = self.generateArray[0];
        totalItem.allMoney = [NSString stringWithFormat:@"%@",payMessageModel.money];
    }else{
        totalItem.allMoney  = @"0";
    }
    [section addItem:totalItem];
}

//生成订单详情
- (void) generatePayMessages {
    NSString *payString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfPayMessages,DPToken];
    
    [self.generateDic setValue:self.carModel.car_code forKey:@"number"];
    [self.generateDic setValue:self.carModel.ID forKey:@"aid"];
    
    if (!self.generateDic[@"hckm"]) {
        [self.generateDic setValue:@"0" forKey:@"hckm"];
    }
    
    DPWeakSelf;
    [self requestDataPostWithString:payString params:self.generateDic successBlock:^(id responseObject) {
        
        [weakself.generateArray removeAllObjects];
        
        CarPayMessageResponse *response = [CarPayMessageResponse mj_objectWithKeyValues:responseObject];
        
        [weakself.generateArray addObject:response.data];
        
        [weakself setupOrderGenerateTableView];
        [weakself.orderGenerateTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//提交订单
- (void) confirmPayMessage {
    NSString *confirmMessage = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfConfirmPayMessages,DPToken];
    
    //参数
    if (self.generateArray.count > 0) {
        CarPayMessageModel *payMessageModel = self.generateArray[0];
        [self.generateDic setValue:payMessageModel.money forKey:@"money"];
        [self.generateDic setValue:payMessageModel.ymoney forKey:@"ymoney"];
        [self.generateDic setValue:@"1" forKey:@"type"];
        [self.generateDic setValue:self.carModel.bname forKey:@"qcaddress"];
    }
    
    DPWeakSelf;
    [self requestDataPostWithString:confirmMessage params:self.generateDic successBlock:^(id responseObject) {
        
        BaseModel *confirmModel = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:confirmModel.info];
        if ([confirmModel.status isEqualToString:@"200"]) {
            
            UINavigationController *nav = weakself.navigationController;
            [nav popViewControllerAnimated:NO];

            OrderResultViewController *orderResultVC = [[OrderResultViewController alloc] init];
            orderResultVC.direction = @"1";
            orderResultVC.userCoordinate = weakself.userCoordinate;
            [nav pushViewController:orderResultVC animated:NO];
        }
    } andFailBlock:^(NSError *error) {
    }];
}

#pragma mark - delegate
- (void)onDistanceSearchDone:(AMapDistanceSearchRequest *)request response:(AMapDistanceSearchResponse *)response{
    NSArray *asas = response.results;
    AMapDistanceResult *result = [AMapDistanceResult mj_objectWithKeyValues:asas[0]];

    float lll = result.distance * 0.001;

    NSString *distances = [NSString stringWithFormat:@"%.3f",lll];

    [self.generateDic setValue:distances forKey:@"hckm"];
    
    //计算费用
    if (self.generateDic[@"hckm"] && self.generateDic[@"qctime"]) {
        [self generatePayMessages];
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
