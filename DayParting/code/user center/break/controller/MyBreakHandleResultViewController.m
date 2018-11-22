//
//  MyBreakHandleResultViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakHandleResultViewController.h"
#import "MyBreakHandleViewController.h"

#import "MyBreakResultStatusItem.h"

@interface MyBreakHandleResultViewController ()

@end

@implementation MyBreakHandleResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"处理结果查询";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"缴费帮助" forState:0];
    
    self.DPTableView.backgroundColor = DPBackGroundColor;
    self.DPManager[@"MyBreakResultStatusItem"] = @"MyBreakResultStatusCell";
    
    [self setupMyBreakHandleResultTableView];
}

- (void) setupMyBreakHandleResultTableView {
    RETableViewSection *section = [[RETableViewSection alloc] init];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    //status
    MyBreakResultStatusItem *statusItem = [[MyBreakResultStatusItem alloc] init];
    statusItem.selectionStyle = UITableViewCellSelectionStyleNone;
    statusItem.status = @"3";
    if ([statusItem.status isEqualToString:@"2"]) {
        statusItem.cellHeight = 760;
    }else if ([statusItem.status isEqualToString:@"3"]){
        statusItem.cellHeight = 860;
    }else if ([statusItem.status isEqualToString:@"4"]){
        statusItem.cellHeight = 940;
    }
    [section addItem:statusItem];
    
    DPWeakSelf;
    @weakify(statusItem);
    statusItem.didSelectedBtn = ^(NSInteger tag) {
        @strongify(statusItem);
        if (tag == 331) {
            if ([statusItem.status isEqualToString:@"4"]) {
                //我已了解
                [weakself.navigationController popViewControllerAnimated:YES];
            }else{
                //重新提交材料
                [weakself showHint:@"重新提交材料"];
            }
        }else if (tag == 332){
            //去线上缴费
            UINavigationController *nav = weakself.navigationController;
            [nav popViewControllerAnimated:NO];
            
            MyBreakHandleViewController *myBreakHandleVC = [[MyBreakHandleViewController alloc] init];
            myBreakHandleVC.ID = weakself.ID;
            myBreakHandleVC.handleString = @"1";
            [nav pushViewController:myBreakHandleVC animated:NO];
        }
    };
    
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
