//
//  SecurityViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/11.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "SecurityViewController.h"
#import "ResetPayViewController.h"
#import "ResetFaceViewController.h"

#import "UIViewController+Blur.h"

#import "SettingItem.h"
#import "SeperateItem.h"

@interface SecurityViewController ()

@end

@implementation SecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"安全中心";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"SettingItem"] = @"SettingCell";
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    
    [self setupSecurityTabelView];
}

- (void) setupSecurityTabelView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    SeperateItem *seperateItem = [[SeperateItem alloc] init];
    seperateItem.cellHeight = DPSmallSpacing;
    seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem];
    
    DPWeakSelf;
    //支付密码设置
    SettingItem *payItem = [[SettingItem alloc] init];
    payItem.titleString = @"支付密码设置";
    payItem.actString = @"重置支付密码  ";
    payItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:payItem];
    payItem.selectionHandler = ^(id item) {
        [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:@"重置支付密码，将默认发送短信\n验证码至您已绑定手机号" andLeftAct:@"确认重置" leftColor:DPBlueColor andRightAct:@"取消" rightColor:DPLightGrayColor finishBlock:^(NSString *unlock) {
            if ([unlock isEqualToString:@"左边"]) {
                ResetPayViewController *resetPayVC = [[ResetPayViewController alloc] init];
                resetPayVC.phoneString = @"13162521916";
                resetPayVC.direction = @"重置";
                [weakself.navigationController pushViewController:resetPayVC animated:YES];
            }
        }];
    };
    
    //人脸解锁车辆
    SettingItem *faceItem = [[SettingItem alloc] init];
    faceItem.titleString = @"人脸解锁车辆";
    faceItem.actString = @"重新登记脸部信息  ";
    faceItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:faceItem];
    faceItem.selectionHandler = ^(id item) {
        ResetFaceViewController *resetFaceVC = [[ResetFaceViewController alloc] init];
        [weakself.navigationController pushViewController:resetFaceVC animated:YES];
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
