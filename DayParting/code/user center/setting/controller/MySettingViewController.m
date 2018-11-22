//
//  MySettingViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MySettingViewController.h"
#import "AboutViewController.h"       //关于
#import "SecurityViewController.h"   //安全中心
#import "UserAgreementViewController.h" //用户协议
#import <UIImage+GIF.h>

#import "SeperateItem.h"
#import "SettingItem.h"
#import "LogOutItem.h"

@interface MySettingViewController ()

@end

@implementation MySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPTableView.backgroundColor = DPBackGroundColor;
    
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"SettingItem"] = @"SettingCell";
    self.DPManager[@"LogOutItem"] = @"LogOutCell";
    
    [self setupMySettingTableViewWithLatestVersion:YES trackUrl:nil];
    
//    [self checkAppUpdate];
}

- (void) setupMySettingTableViewWithLatestVersion:(BOOL)version  trackUrl:(NSString *)trackUrl {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.cellHeight = DPSmallSpacing;
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem1];
    
    DPWeakSelf;
    //安全中心
    SettingItem *securityItem = [[SettingItem alloc] init];
    securityItem.titleString = @"安全中心";
    securityItem.showSeperate = @"3";
    securityItem.actString = @"密码修改  ";
    securityItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:securityItem];
    securityItem.selectionHandler = ^(id item) {
        SecurityViewController *securityVC = [[SecurityViewController alloc] init];
        [weakself.navigationController pushViewController:securityVC animated:YES];
    };
    
    
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.cellHeight = DPMiddleSpacing;
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem2];
    
    //关于
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [NSString stringWithFormat:@"%@  ",[infoDic objectForKey:@"CFBundleShortVersionString"]];
    SettingItem *aboutItem = [[SettingItem alloc] init];
    aboutItem.titleString = @"关于";
    aboutItem.actString = [NSString stringWithFormat:@"版本号 %@",currentVersion];
    aboutItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:aboutItem];
    aboutItem.selectionHandler = ^(id item) {
        AboutViewController *aboutVC = [[AboutViewController alloc] init];
        [weakself.navigationController pushViewController:aboutVC animated:YES];
    };
    
    //用户协议
    SettingItem *userItem = [[SettingItem alloc] init];
    userItem.titleString = @"用户协议";
    userItem.actString = @"";
    userItem.showSeperate = @"3";
    userItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:userItem];
    userItem.selectionHandler = ^(id item) {
        UserAgreementViewController *userAgreementVC = [[UserAgreementViewController alloc] init];
        userAgreementVC.direction = @"1";
        [weakself.navigationController pushViewController:userAgreementVC animated:YES];
    };
    
    SeperateItem *seperateItem3 = [[SeperateItem alloc] init];
    seperateItem3.cellHeight = DPMiddleSpacing;
    seperateItem3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem3];
    
    //清理缓存
    NSUInteger ssss = [SDImageCache sharedImageCache].getSize;
    float displaySize = ssss/1000/1000 + ssss/1000%1000*0.001;
    NSString *huancun = [NSString stringWithFormat:@"%.2fMB",displaySize];
    SettingItem *cleanItem = [[SettingItem alloc] init];
    cleanItem.titleString = @"清理缓存";
    cleanItem.actString = huancun;
    cleanItem.selectionStyle = UITableViewCellSelectionStyleNone;
    cleanItem.ssss = @"1";
    [section addItem:cleanItem];
    cleanItem.selectionHandler = ^(id item) {
        
        UIAlertController *cleanAlertController = [UIAlertController alertControllerWithTitle:@"" message:@"是否清空当前缓存数据" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *act0 = [UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
                //  是否清空当前缓存数据
                [[SDImageCache sharedImageCache] clearMemory];
                [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                
                    [weakself setupMySettingTableViewWithLatestVersion:YES trackUrl:nil];
                    [weakself.DPTableView reloadData];
                }];
        }];
        [cleanAlertController addAction:act0];
        
        UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"取消" style:0 handler:nil];
        [cleanAlertController addAction:act1];
        
        [weakself presentViewController:cleanAlertController animated:YES completion:nil];
        
    };
    
    //给个好评
    SettingItem *evaluateItem = [[SettingItem alloc] init];
    evaluateItem.titleString = @"给个好评";
    evaluateItem.actString = @"";
    evaluateItem.showSeperate = @"3";
    evaluateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:evaluateItem];
    
    SeperateItem *seperateItem4 = [[SeperateItem alloc] init];
    seperateItem4.cellHeight = DPMiddleSpacing;
    seperateItem4.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem4];
    
    //退出
    LogOutItem *logoutItem = [[LogOutItem alloc] init];
    logoutItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:logoutItem];
    logoutItem.selectionHandler = ^(id item) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"phone"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"authenTag"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
         [[NSUserDefaults standardUserDefaults] synchronize];
        [weakself.navigationController popViewControllerAnimated:YES];
    };
}


//检查更新
- (void) checkAppUpdate {
    NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@",@"1382145658"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *appInfoDic;
    if (response) {
        appInfoDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
    }
    NSArray *resultArr = appInfoDic[@"results"];
    if (![resultArr count]) {
//        [self setupVersionTableViewWithLatestVersion:YES trackUrl:nil];
        return ;
    }
    
    NSDictionary *infoDic1 = resultArr[0];
    //需要version,trackViewUrl,trackName
    NSString *latestVersion = infoDic1[@"version"];
    NSString *trackUrl = infoDic1[@"trackViewUrl"];
    //    NSString *trackName = infoDic1[@"trackName"];
    
    //当前版本
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    
    //比较版本号
    NSString *s1 = [currentVersion substringToIndex:1];//当前
    NSString *s2 = [latestVersion substringToIndex:1];//最新
    
    if ([s1 integerValue] == [s2 integerValue]) {//第一位
        NSString *s11 = [currentVersion substringWithRange:NSMakeRange(2,1)];
        NSString *s22 = [latestVersion substringWithRange:NSMakeRange(2,1)];
        if ([s11 intValue] == [s22 intValue]) {
            NSString *s111 = [currentVersion substringFromIndex:4];
            NSString *s222 = [latestVersion substringFromIndex:4];
            if ([s111 integerValue] < [s222 integerValue]) {
                [self setupMySettingTableViewWithLatestVersion:NO trackUrl:trackUrl];
                [self.DPTableView reloadData];
            }
        }else if ([s11 integerValue] < [s22 integerValue]){
            [self setupMySettingTableViewWithLatestVersion:NO trackUrl:trackUrl];
            [self.DPTableView reloadData];
        }
    }else if ([s1 integerValue] < [s2 integerValue]){
        [self setupMySettingTableViewWithLatestVersion:NO trackUrl:trackUrl];
        [self.DPTableView reloadData];
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
