//
//  MyCardAddViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardAddViewController.h"
#import "BankListViewController.h"
#import "UIViewController+DismissKeyboard.h"
#import "UIViewController+Blur.h"

#import "SeperateItem.h"
#import "MyCardTextItem.h"
#import "MyCardSubmitItem.h"
#import "MyCardFixedItem.h"
#import "MyCardValidItem.h"
#import "MyCardCodeItem.h"
#import "MyCardChooseItem.h"

#import "BindMessageModel.h"


@interface MyCardAddViewController ()

@property (nonatomic,strong) NSMutableDictionary *bindDic;
@property (nonatomic,strong) NSTimer *bankTimer;
@property (nonatomic,strong) NSString *values;

@end

@implementation MyCardAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加信用卡";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.values = @"获取验证码";
    
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"MyCardChooseItem"] = @"MyCardChooseCell";
    self.DPManager[@"MyCardTextItem"] = @"MyCardTextCell";
    self.DPManager[@"MyCardSubmitItem"] = @"MyCardSubmitCell";
    self.DPManager[@"MyCardFixedItem"] = @"MyCardFixedCell";
    self.DPManager[@"MyCardCodeItem"] =@"MyCardCodeCell";
    self.DPManager[@"MyCardValidItem"] = @"MyCardValidCell";
    
    [self setupForDismissKeyboard];
    
    [self getUserMessage];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_bankTimer invalidate];
}

#pragma mark - getter
- (NSMutableDictionary *)bindDic {
    if (!_bindDic) {
        _bindDic = [NSMutableDictionary dictionary];
    }
    return _bindDic;
}

#pragma mark - method
- (void) setupCardAddTableViewWithModel:(BindMessageModel *)messageModel {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    //发卡银行
    MyCardChooseItem *bankItem = [[MyCardChooseItem alloc] init];
    bankItem.bankName = @"";
    bankItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:bankItem];
    bankItem.selectionHandler = ^(id item) {
        BankListViewController *bankListVC = [[BankListViewController alloc] init];
        [weakself.navigationController pushViewController:bankListVC animated:YES];
    };
    
    //卡号
    MyCardTextItem *numberItem = [[MyCardTextItem alloc] init];
    numberItem.titleString = @"信用卡号";
    numberItem.placeholderString = @"输入信用卡号";
    numberItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:numberItem];
    
    //有效期
    MyCardValidItem *validItem = [[MyCardValidItem alloc] init];
    validItem.contentString = @"选择信用卡有效期";
    validItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:validItem];
    
    @weakify(validItem);
    validItem.selectionHandler = ^(id item) {
        [weakself showBankValidDatePickerViewInView:weakself.view finishBlock:^(NSString *date) {
            @strongify(validItem);
            validItem.contentString = date;
        }];
    };
    
    //安全码
    MyCardTextItem *codeItem = [[MyCardTextItem alloc] init];
    codeItem.titleString = @"安全码";
    codeItem.placeholderString = @"输入卡背面安全码";
    codeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    codeItem.showSeperate = @"3";
    [section addItem:codeItem];
    
    SeperateItem *seperateItem = [[SeperateItem alloc] init];
    seperateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem];
    
    //持卡人
    MyCardFixedItem *personItem = [[MyCardFixedItem alloc] init];
    personItem.titleString = @"持卡人";
    personItem.contentString = messageModel.member;
    personItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:personItem];
    
    //身份证号
    MyCardFixedItem *IDItem = [[MyCardFixedItem alloc] init];
    IDItem.titleString = @"身份证号";
    IDItem.contentString = messageModel.idcard;
    IDItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:IDItem];
    
    //手机号
    MyCardTextItem *phoneItem = [[MyCardTextItem alloc] init];
    phoneItem.titleString = @"手机号";
    phoneItem.contentString = messageModel.tel;
    phoneItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:phoneItem];
    phoneItem.didEditting = ^(NSString *text) {
        [weakself.bindDic setValue:text forKey:@"phone"];
    };
    
    //验证码
    MyCardCodeItem *vertificationItem = [[MyCardCodeItem alloc] init];
    vertificationItem.titleString = @"验证码";
    vertificationItem.placeholderString = @"输入短信验证码";
    vertificationItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:vertificationItem];
    
    vertificationItem.didSelectedBtn = ^(NSInteger tag) {
        if ([weakself.values isEqualToString:@"获取验证码"]) {
            [weakself sendCodeWithPhone:messageModel.tel];
        }else{
            [weakself showHint:@"倒计时未结束，请稍后再试"];
        }
    };
    
    RACSignal *timeSignal = [RACSignal combineLatest:@[RACObserve(self, values)] reduce:^id(NSString *tt){
        
        vertificationItem.time = tt;
        
        return @"1";
    }];
    
    [timeSignal subscribeNext:^(id x) {
        
    }];
    
    //submit
    MyCardSubmitItem *submitItem = [[MyCardSubmitItem alloc] init];
    submitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:submitItem];
    submitItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself goToBindCard];
    };
}

//获取基本信息
- (void) getUserMessage {
    NSString *messageString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyCardOfBindMessage,DPToken];
    
    DPWeakSelf;
    [self requestDataGetWithString:messageString params:nil successBlock:^(id responseObject) {
        
        BindMessageModel *model = [BindMessageModel mj_objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"200"]) {
            
            [weakself setupCardAddTableViewWithModel:model];
            [weakself.DPTableView reloadData];
            
        }else{
            if (weakself.didSubmitBank) {
                weakself.didSubmitBank(@"0");
                [weakself.navigationController popViewControllerAnimated:YES];
            }
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//绑定信用卡
- (void) goToBindCard {
    NSString *bindString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyCardOfBind,DPToken];
    
    
    //    card          银行卡号
//    bank_name     开户行
//    time          银行卡有效期 (y-m-d)
//    safe_code     银行卡安全码
//    tel           持卡人电话
//    idcode        持卡人身份证
    
    [self.bindDic setValue:@"" forKey:@"card"];
    [self.bindDic setValue:@"" forKey:@"bank_name"];
    [self.bindDic setValue:@"" forKey:@"time"];
    [self.bindDic setValue:@"" forKey:@"safe_code"];
    [self.bindDic setValue:@"" forKey:@"tel"];
    [self.bindDic setValue:@"" forKey:@"idcode"];

    DPWeakSelf;
    [self requestDataPostWithString:bindString params:self.bindDic successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
        
        if ([model.status isEqualToString:@"200"]) {
            if (weakself.didSubmitBank) {
                weakself.didSubmitBank(@"1");
                [weakself.navigationController popViewControllerAnimated:YES];
            }
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

//发送验证码
- (void) sendCodeWithPhone:(NSString *)phone {
    self.values = @"60s";
    _bankTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTheCountDownWithTimeOfBank) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_bankTimer forMode:NSRunLoopCommonModes];
    
    return;
    
    NSString *phoneStr = @"";
    NSDictionary *params = @{
                             @"type" : @"1",
                             @"phone" : phone
                             };
    
    DPWeakSelf;
    [self requestDataPostWithString:phone params:params successBlock:^(id responseObject) {
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//倒计时
- (void) startTheCountDownWithTimeOfBank {
    NSInteger ss = 0;
    if (![self.values isEqualToString:@"获取验证码"]) {
        ss = [[self.values substringToIndex:self.values.length-1] integerValue];
    }
    
    if (ss > 0) {//倒计时未结束
        ss --;
        self.values = [NSString stringWithFormat:@"%lds",(long)ss];
    }else{//倒计时结束
        self.values = @"获取验证码";
        [_bankTimer invalidate];
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
