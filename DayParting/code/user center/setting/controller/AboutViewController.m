//
//  AboutViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AboutViewController.h"
#import "UserAgreementViewController.h" //协议

#import "AboutItem.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关于";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPTableView.backgroundColor = DPWhiteColor;
    self.DPTableView.scrollEnabled  = NO;
    self.DPManager[@"AboutItem"] = @"AboutCell";
    
    [self setupAboutTableView];
}

- (void) setupAboutTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    AboutItem *aboutItem = [[AboutItem alloc] init];
    aboutItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:aboutItem];
    DPWeakSelf;
    aboutItem.didSelectedBtn = ^(NSInteger tag) {
        UserAgreementViewController *userAgreementVC = [[UserAgreementViewController alloc] init];
        userAgreementVC.direction = @"2";
        [weakself.navigationController pushViewController:userAgreementVC animated:YES];
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
