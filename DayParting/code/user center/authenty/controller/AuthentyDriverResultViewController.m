//
//  AuthentyDriverResultViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyDriverResultViewController.h"

#import "AuthentyProcessThirdItem.h"

@interface AuthentyDriverResultViewController ()

@end

@implementation AuthentyDriverResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"驾照认证进度";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"AuthentyProcessThirdItem"] = @"AuthentyProcessThirdCell";
    
    [self setupAuthentyDriverResultTableView];
}

- (void) setupAuthentyDriverResultTableView  {
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    AuthentyProcessThirdItem *resultItem = [[AuthentyProcessThirdItem alloc] init];
    resultItem.selectionStyle = UITableViewCellSelectionStyleNone;
    resultItem.remindString = @"已成功提交驾照认证信息";
    [section addItem:resultItem];
    resultItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself.navigationController popViewControllerAnimated:YES];
    };
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
