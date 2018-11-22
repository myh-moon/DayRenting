//
//  ResetPayViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/11.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "ResetPayViewController.h"

#import "ResetFirstItem.h"
#import "ResetSecondItem.h"
#import "ResetThirdItem.h"
#import "ResetFourItem.h"

#import "ResetModel.h"

@interface ResetPayViewController ()

@property (nonatomic,strong) NSString *step;//步骤1-2-3-4
@property (nonatomic,strong) NSMutableDictionary *passwordDic;//步骤1-2-3-4

@end

@implementation ResetPayViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self sendPhoneCode];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@支付密码",self.direction];
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.step = @"1";
    
    self.DPManager[@"ResetFirstItem"] = @"ResetFirstCell";
    self.DPManager[@"ResetSecondItem"] = @"ResetSecondCell";
    self.DPManager[@"ResetThirdItem"] = @"ResetThirdCell";
    self.DPManager[@"ResetFourItem"] = @"ResetFourCell";
    
    self.DPTableView.scrollEnabled = NO;
    
    [self setupResetPayTableView];
}

#pragma mark - init
- (NSMutableDictionary *)passwordDic {
    if (!_passwordDic) {
        _passwordDic = [NSMutableDictionary dictionary];
    }
    return _passwordDic;
}

#pragma mark - method

//发送手机验证码
- (void) sendPhoneCode {
    NSString *phoneStr = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPSettingOfSendPhoneCode,DPToken];
    
    NSDictionary *params = @{
                             @"phone" : self.phoneString,
                             @"type" : @"1"
                             };
    
    DPWeakSelf;
    [self requestDataPostWithString:phoneStr params:params successBlock:^(id responseObject) {
        BaseModel *baseModel = [BaseModel mj_objectWithKeyValues:responseObject];
        if ([baseModel.status isEqualToString:@"200"]) {
            [weakself showHint:baseModel.info];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

//验证验证码是否正确
- (void) twiceConfirmPhoneCode {
    
    NSString *twiceStr = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPSettingOfCheckPhoneCode,DPToken];
    
    DPWeakSelf;
    [self requestDataPostWithString:twiceStr params:self.passwordDic successBlock:^(id responseObject) {
        
        ResetModel *resetModel = [ResetModel mj_objectWithKeyValues:responseObject];
        
        if ([resetModel.status isEqualToString:@"200"]) {
            if ([resetModel.data isEqualToString:@"0"]) {
                [weakself showHint:resetModel.info];
                
                [weakself setupResetPayTableView];
                [weakself.DPTableView reloadData];
            }else{
                weakself.step = @"2";
                [weakself setupResetPayTableView];
                [weakself.DPTableView reloadData];
            }
        }else{
            [weakself showHint:resetModel.info];
            
            [weakself setupResetPayTableView];
            [weakself.DPTableView reloadData];
        }
    } andFailBlock:^(NSError *error) {
        [weakself setupResetPayTableView];
        [weakself.DPTableView reloadData];
    }];
}

//设置密码
- (void) setPayPassword {
    NSString *passwordStr = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPSettingOfSetPhoneCode,DPToken];
    
    DPWeakSelf;
    [self requestDataPostWithString:passwordStr params:self.passwordDic successBlock:^(id responseObject) {
        ResetModel *baseModel = [ResetModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:baseModel.info];
        
        if ([baseModel.status isEqualToString:@"200"]) {
            if ([baseModel.data isEqualToString:@"0"]) {
                weakself.step = @"2";
                [weakself setupResetPayTableView];
                [weakself.DPTableView reloadData];
            }else{
                weakself.step = @"4";
                [weakself setupResetPayTableView];
                [weakself.DPTableView reloadData];
            }
        }else{
            [weakself showHint:baseModel.info];
            weakself.step = @"2";
            [weakself setupResetPayTableView];
            [weakself.DPTableView reloadData];
        }
    } andFailBlock:^(NSError *error) {
        weakself.step = @"2";
        [weakself setupResetPayTableView];
        [weakself.DPTableView reloadData];
    }];
}

- (void) setupResetPayTableView {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    if ([self.step isEqualToString:@"1"]) {
        //输入手机验证码
        ResetFirstItem *firstItem = [[ResetFirstItem alloc] init];
        firstItem.phone = self.phoneString;
        firstItem.code = nil;
        firstItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:firstItem];
        
        firstItem.didEditting = ^(NSString *text) {
            //保存参数
            [weakself.passwordDic setValue:text forKey:@"code"];
            [weakself twiceConfirmPhoneCode];
        };
        
    }else if ([self.step isEqualToString:@"2"]){
        //输入密码
        ResetSecondItem *secondItem = [[ResetSecondItem alloc] init];
        secondItem.selectionStyle = UITableViewCellSelectionStyleNone;
        secondItem.textType = @"0";
        secondItem.code = nil;
        [section addItem:secondItem];
        secondItem.didEditting = ^(NSString *text) {
            [weakself.passwordDic setValue:text forKey:@"password"];
            
            weakself.step = @"3";
            [weakself setupResetPayTableView];
            [weakself.DPTableView reloadData];
        };
    }else if ([self.step isEqualToString:@"3"]){
        //再次确认密码
        ResetThirdItem *thirdItem = [[ResetThirdItem alloc] init];
        thirdItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:thirdItem];
        thirdItem.didEditting = ^(NSString *text) {
            [weakself.passwordDic setValue:text forKey:@"nextpwd"];
            [weakself setPayPassword];
        };
    }else if ([self.step isEqualToString:@"4"]){
        ResetFourItem *fourItem = [[ResetFourItem alloc] init];
        fourItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:fourItem];
        
        fourItem.didSelectedBtn = ^(NSInteger tag) {
            [weakself.navigationController popViewControllerAnimated:YES];
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
