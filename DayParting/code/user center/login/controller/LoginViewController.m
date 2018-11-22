//
//  LoginViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginCodeViewController.h"
#import "UserAgreementViewController.h" //协议
#import "UIViewController+DismissKeyboard.h"
#import "UIImage+Color.h"


#import "LoginItem.h"
#import "BaseModel.h"



@interface LoginViewController ()

@property (nonatomic,strong) RETableViewManager *loginManager;
@property (nonatomic,strong) UITableView *loginTableView;

@property (nonatomic,strong) NSMutableDictionary *loginDic;


@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    
    //字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:DPWhiteColor,NSFontAttributeName:DPFont7}];
    
    //状态栏字体颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    //字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:DPBlackColor,NSFontAttributeName:DPFont7}];
    
    //状态栏字体颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
    [self.leftNavButton setImage:[UIImage imageNamed:@"back_white"] forState:0];

    self.loginManager = [[RETableViewManager alloc] initWithTableView:self.loginTableView];
    
    [self.view addSubview:self.loginTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.loginManager[@"LoginItem"] = @"LoginCell";
    
    [self setupLoginTableView];
    
    [self setupForDismissKeyboard];
}

#pragma mark - init
- (UITableView *)loginTableView {
    if (!_loginTableView) {
        _loginTableView = [UITableView newAutoLayoutView];
        _loginTableView.backgroundColor = DPWhiteColor;
        _loginTableView.showsVerticalScrollIndicator = NO;
    }
    return _loginTableView;
}

- (NSMutableDictionary *)loginDic {
    if (!_loginDic) {
        _loginDic = [NSMutableDictionary dictionary];
    }
    return _loginDic;
}

#pragma mark - method
- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.loginTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        if (IS_IPHONE_X) {
            [self.loginTableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:-88];
        }else{
            [self.loginTableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:-64];
        }
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void) setupLoginTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.loginManager addSection:section];
    
    DPWeakSelf;
    LoginItem *loginItem = [[LoginItem alloc] init];
    loginItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:loginItem];

    @weakify(loginItem);
    loginItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 57) {//返回
            [weakself.navigationController popViewControllerAnimated:YES];
        }else if (tag == 58){ //协议
            UserAgreementViewController *userAgreementVC = [[UserAgreementViewController alloc] init];
            userAgreementVC.direction = @"3";
            [weakself.navigationController pushViewController:userAgreementVC animated:YES];
        }else if (tag == 59){//获取验证码
            //判断手机号的规范
            NSString *regex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
            NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
            BOOL isMatch = [pred evaluateWithObject:weakself.loginDic[@"phone"]];
            if(isMatch) {  //有效手机号
                
                [weakself showHint:@"验证码已发送"];
                
                LoginCodeViewController *loginCodeVC = [[LoginCodeViewController alloc] init];
                loginCodeVC.phone = weakself.loginDic[@"phone"];
                [weakself.navigationController pushViewController:loginCodeVC animated:YES];
            }else{//无效手机号
                [weakself showHint:@"请输入正确手机号"];
            }
        }
    };
    
    loginItem.didEditting = ^(NSString *text) {
        [weakself.loginDic setValue:text forKey:@"phone"];
        [weakself.loginDic setValue:@"1" forKey:@"type"];
    };
}

#pragma mark - method
//获取验证码
- (void) getCode {
    
    LoginCodeViewController *loginCodeVC = [[LoginCodeViewController alloc] init];
    loginCodeVC.phone = self.loginDic[@"phone"];
    [self.navigationController pushViewController:loginCodeVC animated:YES];
    
    return;
    
    NSString *codeString = [NSString stringWithFormat:@"%@%@",DPBaseUrl,DPLoginOfGetCode];
    
    DPWeakSelf;
    [self requestDataPostWithString:codeString params:self.loginDic successBlock:^(id responseObject) {
        BaseModel *codeModel = [BaseModel mj_objectWithKeyValues:responseObject];
        
        if ([codeModel.status isEqualToString:@"200"]) {
            LoginCodeViewController *loginCodeVC = [[LoginCodeViewController alloc] init];
            loginCodeVC.phone = weakself.loginDic[@"phone"];
            [weakself.navigationController pushViewController:loginCodeVC animated:YES];
        }else{
            [weakself showHint:codeModel.info];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void)addLeftNavAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
