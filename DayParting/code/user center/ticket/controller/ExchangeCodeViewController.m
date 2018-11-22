//
//  ExchangeCodeViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/19.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "ExchangeCodeViewController.h"
#import "UIViewController+DismissKeyboard.h"

#import "ExchangeCodeItem.h"
#import "ExchangeItem.h"


@interface ExchangeCodeViewController ()

@end

@implementation ExchangeCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"兑换优惠券";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPTableView.backgroundColor = DPWhiteColor;
    self.DPManager[@"ExchangeCodeItem"] = @"ExchangeCodeCell";
    self.DPManager[@"ExchangeItem"] = @"ExchangeCell";

    [self setupExchangeCodeTableView];
    
    [self setupForDismissKeyboard];
}

- (void) setupExchangeCodeTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    ExchangeCodeItem *codeItem = [[ExchangeCodeItem alloc] init];
    codeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:codeItem];
    
    @weakify(codeItem);
    codeItem.didEditting = ^(NSString *text) {
        @strongify(codeItem);
        codeItem.codeString = text;
    };
    
    DPWeakSelf;
    ExchangeItem *exchangeItem = [[ExchangeItem alloc] init];
    exchangeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:exchangeItem];
    exchangeItem.didSelectedBtn = ^(NSInteger tag) {
        [weakself showHint:@"请输入正确的兑换口令/兑换码"];
    };
    
    @weakify(exchangeItem);
    RACSignal *codeSignal = [RACSignal combineLatest:@[RACObserve(codeItem,codeString)] reduce:^id(NSString *code){
        @strongify(exchangeItem);
        if (code.length > 0) {
            exchangeItem.selected = YES;
        }else{
            exchangeItem.selected = NO;
        }
        return @"code";
    }];
    
    [codeSignal subscribeNext:^(id x) {
        
    }];
    
    
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
