//
//  ResetFaceViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "ResetFaceViewController.h"

#import "ResetFaceFirstItem.h"
#import "ResetFaceSecondItem.h"

@interface ResetFaceViewController ()
@property (nonatomic,strong) NSString *step;

@end

@implementation ResetFaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置人脸解锁";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.step = @"1";
    
    self.DPManager[@"ResetFaceFirstItem"] = @"ResetFaceFirstCell";
    self.DPManager[@"ResetFaceSecondItem"] = @"ResetFaceSecondCell";
    
    self.DPTableView.scrollEnabled = NO;
    
    [self setupResetFaceTableView];
    
}

- (void) setupResetFaceTableView {
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    if ([self.step isEqualToString:@"1"]) {
        //输入手机验证码
        ResetFaceFirstItem *firstItem = [[ResetFaceFirstItem alloc] init];
        firstItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:firstItem];
        
        firstItem.didSelectedBtn = ^(NSInteger tag) {
            weakself.step = @"2";
            [weakself setupResetFaceTableView];
            [weakself.DPTableView reloadData];
        };
        
    }else if ([self.step isEqualToString:@"2"]){
        //输入密码
        ResetFaceSecondItem *secondItem = [[ResetFaceSecondItem alloc] init];
        secondItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:secondItem];
        secondItem.didSelectedBtn = ^(NSInteger tag) {
            weakself.step = @"1";
            [weakself setupResetFaceTableView];
            [weakself.DPTableView reloadData];
        };
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
