//
//  LoginCodeViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "LoginCodeViewController.h"
#import "UIViewController+DismissKeyboard.h"

#import "LoginCodeItem.h"

#import "LoginModel.h"

@interface LoginCodeViewController ()

@property (nonatomic,strong) NSMutableDictionary *loginCodeDic;
@property (nonatomic,strong) NSString *statusString; //验证是否输入正确的验证码

@property (nonatomic,strong) NSString *secondString;  //倒计时
@property (nonatomic,strong) NSTimer *loginTimer;

@end

@implementation LoginCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"短信验证码";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.secondString = @"10";
    self.statusString = @"0";
    
    self.DPTableView.backgroundColor = DPWhiteColor;
    
    self.DPManager[@"LoginCodeItem"] = @"LoginCodesCell";
    
    [self setupLoginCodeTableView];
    
    _loginTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(toStartCountdownOfLogin) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_loginTimer forMode:NSRunLoopCommonModes];
    
    
    [self.loginCodeDic setValue:self.phone forKey:@"phone"];
    [self.loginCodeDic setValue:@"1" forKey:@"type"];
//    [self getCodeOfTwice];
}


#pragma mark - init
- (NSMutableDictionary *)loginCodeDic {
    if (!_loginCodeDic) {
        _loginCodeDic = [NSMutableDictionary dictionary];
    }
    return _loginCodeDic;
}

#pragma mark - method
- (void) setupLoginCodeTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    LoginCodeItem *codeItem = [[LoginCodeItem alloc] init];
    codeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    codeItem.secondStr = @"没有收到验证码，重新获取（60s）";
    codeItem.phoneStr = self.phone;
    [section addItem:codeItem];
    
    //action
    codeItem.didSelectedBtn = ^(NSInteger tag) {
        if ([self.secondString isEqualToString:@"0"]) {
            [weakself getCodeOfTwice];
        }
    };
    
    //code
    @weakify(codeItem);
    codeItem.didEditting = ^(NSString *text) {
        @strongify(codeItem);
        codeItem.codeStr = text;
        
        if (text.length >= 4) {
            [weakself.loginCodeDic setValue:[text substringWithRange:NSMakeRange(0, 4)] forKey:@"code"];
            [weakself toLogin];
        }
    };
    
    //倒计时监控
    RACSignal *loginSignal = [RACSignal combineLatest:@[RACObserve(self, secondString)] reduce:^id(NSString *seconds){
        if ([seconds isEqualToString:@"0"]) {
            codeItem.secondStr = @"没有收到验证码，重新获取";
        }else{
            codeItem.secondStr = [NSString stringWithFormat:@"没有收到验证码，重新获取%@s",seconds];
        }
            
        return @"0";
    }];
    
    [loginSignal subscribeNext:^(id x) {
        
    }];
    
    //是否显示提示框
    RACSignal *codeSignal = [RACSignal combineLatest:@[RACObserve(self, statusString)] reduce:^id(NSString *status){
        @strongify(codeItem);
        codeItem.statusStr = status;
        return @"0";
    }];
    [codeSignal subscribeNext:^(id x) {
        
    }
     ];
}

- (void) toLogin {
    
    NSString *loginString = [NSString stringWithFormat:@"%@%@",DPBaseUrl,DPLogin];
    
    DPWeakSelf;
    [self requestDataPostWithString:loginString params:self.loginCodeDic successBlock:^(id responseObject) {
        
        LoginModel *loginModel = [LoginModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:loginModel.status];
        
        if ([loginModel.status isEqualToString:@"403"] || [loginModel.status isEqualToString:@"200"]) {//未认证
            
            [[NSUserDefaults standardUserDefaults] setValue:loginModel.status forKey:@"authenTag"];
            [[NSUserDefaults standardUserDefaults] setValue:loginModel.token forKey:@"token"];
            [[NSUserDefaults standardUserDefaults] setValue:loginModel.phone forKey:@"phone"];

            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            UINavigationController *nav = weakself.navigationController;
            [nav popViewControllerAnimated:NO];
            [nav popViewControllerAnimated: NO];
            
        }else{
            weakself.statusString = @"1";
            
            [weakself performSelector:@selector(sdsdsdsdsd) withObject:nil afterDelay:1];
            
        }
        
        //token
        //        MDAwMDAwMDAwMH6onm4
        
        //        "idcard": 0,
        //        "status": 403,
        //        "info": "请先进行实名认证...",
        //        "token": "MDAwMDAwMDAwMH6onm4"
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//倒计时
 - (void) toStartCountdownOfLogin {
    if (![self.secondString isEqualToString:@"0"]) {
        NSInteger sd = [self.secondString integerValue];
        
        sd--;
        if (sd == 0) {
            self.secondString = @"0";
        }else{
            self.secondString = [NSString stringWithFormat:@"%d",sd];
        }
    }
}

//获取验证码
- (void) getCodeOfTwice {
    NSString *codeString = [NSString stringWithFormat:@"%@%@",DPBaseUrl,DPLoginOfGetCode];
    
    DPWeakSelf;
    [self requestDataPostWithString:codeString params:self.loginCodeDic successBlock:^(id responseObject) {
        BaseModel *codeModel = [BaseModel mj_objectWithKeyValues:responseObject];
        
        if ([codeModel.status isEqualToString:@"200"]) {
            
            weakself.secondString = @"10";
            weakself.loginTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(toStartCountdownOfLogin) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:weakself.loginTimer forMode:NSRunLoopCommonModes];
            
        }else{
            [weakself showHint:codeModel.info];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void) sdsdsdsdsd {
    self.statusString = @"0";
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
