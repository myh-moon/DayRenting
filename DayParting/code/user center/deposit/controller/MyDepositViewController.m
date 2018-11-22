//
//  MyDepositViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyDepositViewController.h"
#import "MyDepositResultViewController.h"
#import "MyDepositListViewController.h" //押金记录
#import "UIViewController+Blur.h"

#import "MyDepositHeaderItem.h"

#import "MyDepositTypeOneItem.h"  //未交押金的情况下
#import "MyDepositTypeOnePayItem.h"
#import "MyDepositTypeOneSubmitItem.h"

//  不能申请退款
#import "MyDepositTypeTwoItem.h"

//可以退款
#import "MyDepositTypeThreeItem.h"

//去用车
#import "MyDepositTypeFourItem.h"

@interface MyDepositViewController ()

@end

@implementation MyDepositViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"用车押金";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"押金记录" forState:0];
    
    self.DPTableView.backgroundColor = DPWhiteColor;
    
    self.DPManager[@"MyDepositHeaderItem"] = @"MyDepositHeaderCell";
    self.DPManager[@"MyDepositTypeOneItem"] = @"MyDepositTypeOneCell";
    self.DPManager[@"MyDepositTypeOnePayItem"] = @"MyDepositTypeOnePayCell";
    self.DPManager[@"MyDepositTypeOneSubmitItem"] = @"MyDepositTypeOneSubmitCell";
    
    self.DPManager[@"MyDepositTypeTwoItem"] = @"MyDepositTypeTwoCell";
    
    self.DPManager[@"MyDepositTypeThreeItem"] = @"MyDepositTypeThreeCell";
    
    self.DPManager[@"MyDepositTypeFourItem"] = @"MyDepositTypeFourCell";
    
    [self setupMyDepositTableView];
}

- (void) setupMyDepositTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    
    //header
    MyDepositHeaderItem *headerItem = [[MyDepositHeaderItem alloc] init];
    headerItem.depositMoneyString = @"2000.00";
    headerItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:headerItem];
    
    DPWeakSelf;
    /*********   未交  *****/
//    //status
//    MyDepositTypeOneItem *oneItem = [[MyDepositTypeOneItem alloc] init];
//    oneItem.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:oneItem];
//
//    //pay
//    MyDepositTypeOnePayItem *onePayItem = [[MyDepositTypeOnePayItem alloc] init];
//    onePayItem.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:onePayItem];
//
//    //action
//    MyDepositTypeOneSubmitItem*oneSubmitItem = [[MyDepositTypeOneSubmitItem alloc] init];
//    oneSubmitItem.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:oneSubmitItem];
    
    
    /***** 不可退还 ******/
    MyDepositTypeTwoItem *twoItem = [[MyDepositTypeTwoItem alloc] init];
    twoItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:twoItem];
    twoItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself showHint:@"不能申请退还"];
    };
    
    /***     可退还 ***/
//    MyDepositTypeThreeItem *threeItem = [[MyDepositTypeThreeItem alloc] init];
//    threeItem.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:threeItem];
//    threeItem.didSelectedBtn = ^(NSInteger tag) {
//        [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:@"提交退押申请后，您将无法再继续使用租车服务" andLeftAct:@"确认" andRightAct:@"不退了" finishBlock:^(NSString *unlock) {
//            [weakself confirmToReturnPaymeny];
//        }];
//    };
    
    
    /****    去用车 ******/
//    MyDepositTypeFourItem *fourItem = [[MyDepositTypeFourItem alloc] init];
//    fourItem.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:fourItem];
//    fourItem.didSelectedBtn = ^(NSInteger tag) {
//        UINavigationController *nav = weakself.navigationController;
//        [nav popViewControllerAnimated:NO];
//        [nav popViewControllerAnimated:NO];
//    };
//    
}

- (void) confirmToReturnPaymeny {
    [self showHint:@"申请退还"];
    
    MyDepositResultViewController *myDepositResultVC = [[MyDepositResultViewController alloc] init];
    [self.navigationController pushViewController:myDepositResultVC animated:YES];
}

- (void)addRightNavAction {
    MyDepositListViewController *myDepositListVC = [[MyDepositListViewController alloc] init];
    [self.navigationController pushViewController:myDepositListVC animated:YES];
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
