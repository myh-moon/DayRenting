//
//  CarReturnViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "CarReturnViewController.h"
#import "CarReturnPointsViewController.h"
#import <AMapSearchKit/AMapSearchKit.h>

#import "CarReturnItem.h"

//model
#import "CarReturnResponse.h"
#import "CarAreaModel.h"
#import "CarDepotModel.h"
#import "CarReturnModel.h"

@interface CarReturnViewController ()<AMapSearchDelegate>

@property (nonatomic,strong) NSMutableArray *returnCarList;
@property (nonatomic,strong) AMapSearchAPI *search;

@end

@implementation CarReturnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择还车点";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"全部网点" forState:0];
    
    self.DPManager[@"CarReturnItem"] = @"CarReturnCell";
    
    [self setupCarReturnTableView];
    
    [self getListOfReturnCar];
}

#pragma mark - init
- (NSMutableArray *)returnCarList {
    if (!_returnCarList) {
        _returnCarList = [NSMutableArray array];
    }
    return _returnCarList;
}


#pragma mark -method
- (void) setupCarReturnTableView {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 44;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    UIButton *headerButton = [UIButton buttonWithType:0];
    headerButton.frame = CGRectMake(0, 0, DPWindowWidth, 44);
    [headerButton setTitle:@"请注意，更改还车点后，费用可能会产生变化" forState:0];
    [headerButton setTitleColor:DPLightGrayColor9 forState:0];
    headerButton.titleLabel.font = DPFont3;
    headerButton.backgroundColor = DPWhiteColor;
    headerButton.userInteractionEnabled = NO;
    headerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    headerButton.contentEdgeInsets = UIEdgeInsetsMake(0, DPMiddleSpacing, 0, 0);
    section.headerView  = headerButton;
    
    
    if (self.returnCarList.count > 0) {
        for (NSInteger i=0; i<self.returnCarList.count; i++) {
            CarReturnModel *returnModel = self.returnCarList[i];
            
            CarReturnItem *returnItem = [[CarReturnItem alloc] initWithCarReturnModel:returnModel];
            returnItem.selectionStyle = UITableViewCellSelectionStyleNone;
            [section addItem:returnItem];
            
            DPWeakSelf;
            returnItem.selectionHandler = ^(id item) {
                
                if ([weakself.direction isEqualToString:@"2"]) {
                    
                    [weakself confirmToChangeReturnAddressWithAddress:returnModel];
                    
                }else{
                    if (weakself.didSelectedCell) {
                        weakself.didSelectedCell(returnModel);
                    }
                    [weakself.navigationController popViewControllerAnimated:YES];
                }
            };
        }
    }
}

//列表
- (void) getListOfReturnCar {
    NSString *returnString = [NSString stringWithFormat:@"%@%@/%f/%f",DPBaseUrl,DPCarDetailsOfReturnPoints,self.userCoordinate.latitude,self.userCoordinate.longitude];

    DPWeakSelf;
    [self requestDataGetWithString:returnString params:nil successBlock:^(id responseObject) {
        
        CarReturnResponse *response = [CarReturnResponse mj_objectWithKeyValues:responseObject];
       
        if ([response.status isEqualToString:@"200"]) {
            CarAreaModel *areaModel =  response.area[0];
            
             CarDepotModel *dePotModel = areaModel.dot;
            
            for (CarReturnModel *returnModel in dePotModel.depot) {
                [weakself.returnCarList addObject:returnModel];
            }
            
            [weakself setupCarReturnTableView];
            [weakself.DPTableView reloadData];
            
        }else{
            [weakself showHint:response.info];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
    
}

//更改还车点
- (void) confirmToChangeReturnAddressWithAddress:(CarReturnModel *)returnModel {
    NSString *changeString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfChangeReturnAddress,DPToken];
    
    NSDictionary *params = @{
                             @"oid" : self.oid,
                             @"hcaddress" : returnModel.address
                             };
    
    DPWeakSelf;
    [self requestDataPostWithString:changeString params:params successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"200"]) {
            weakself.didSelectedCell(returnModel);
            [weakself.navigationController popViewControllerAnimated:YES];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void)addRightNavAction {
//    CarReturnPointsViewController *carReturnPointsVC = [[CarReturnPointsViewController alloc] init];
//    [self.navigationController pushViewController:carReturnPointsVC animated:YES];
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
