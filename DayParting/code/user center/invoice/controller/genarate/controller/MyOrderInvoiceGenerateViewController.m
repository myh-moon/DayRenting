//
//  MyOrderInvoiceGenerateViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceGenerateViewController.h"
#import "UIViewController+DismissKeyboard.h"

#import "InvoiceGenerateBaseItem.h"
#import "InvoiceGenerateChooseItem.h"
#import "InvoiceGenerateTypeItem.h"
#import "InvoiceGenerateEditItem.h"
#import "InvoiceGenerateContentItem.h"
#import "InvoiceGenerateSubmitItem.h"

#import "BaseModel.h"

@interface MyOrderInvoiceGenerateViewController ()

@property (nonatomic,strong) NSMutableDictionary *generateDic;

@end

@implementation MyOrderInvoiceGenerateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.generateDic setValue:@"0" forKey:@"type"];
    [self.generateDic setValue:@"2" forKey:@"cate"];
    
    self.title = @"开具电子发票";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"InvoiceGenerateBaseItem"] = @"InvoiceGenerateBaseCell";
    self.DPManager[@"InvoiceGenerateChooseItem"] = @"InvoiceGenerateChooseCell";
    self.DPManager[@"InvoiceGenerateTypeItem"] = @"InvoiceGenerateTypeCell";
    self.DPManager[@"InvoiceGenerateEditItem"] = @"InvoiceGenerateEditCell";
    self.DPManager[@"InvoiceGenerateContentItem"] = @"InvoiceGenerateContentCell";
    self.DPManager[@"InvoiceGenerateSubmitItem"] = @"InvoiceGenerateSubmitCell";
    
    [self setupInvoiceGenerateTableView];
    
    [self setupForDismissKeyboard];
}

#pragma mark - getter
- (NSMutableDictionary *)generateDic {
    if (!_generateDic) {
        _generateDic = [NSMutableDictionary dictionary];
    }
    return _generateDic;
}

#pragma mark - method
- (void) setupInvoiceGenerateTableView {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    InvoiceGenerateBaseItem *titleItem = [[InvoiceGenerateBaseItem alloc] init];
    titleItem.titleString = @"请选择发票类型";
    titleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:titleItem];
    
    //choose type
    InvoiceGenerateChooseItem *chooseTypeItem = [[InvoiceGenerateChooseItem alloc] init];
    chooseTypeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:chooseTypeItem];
    chooseTypeItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 56) {
            weakself.title = @"开具电子发票";
            [weakself.generateDic setValue:@"0" forKey:@"type"];
        }else if(tag == 57){
            weakself.title = @"开具纸质发票";
            [weakself.generateDic setValue:@"1" forKey:@"type"];
        }
        [weakself setupInvoiceGenerateTableView];
        [weakself.DPTableView reloadData];
    };
    
    //content
    InvoiceGenerateBaseItem *contentTitleItem = [[InvoiceGenerateBaseItem alloc] init];
    contentTitleItem.titleString = @"发票详情";
    contentTitleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:contentTitleItem];
    
    /******** electronic invoice **********/
    //抬头类型
    InvoiceGenerateTypeItem *typeItem = [[InvoiceGenerateTypeItem alloc] init];
    typeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:typeItem];
    
    typeItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 38) {//企业
            [weakself.generateDic setValue:@"2" forKey:@"cate"];

        }else{//个人
            [weakself.generateDic setValue:@"1" forKey:@"cate"];
        }
        [weakself setupInvoiceGenerateTableView];
        [weakself.DPTableView reloadData];
    };
    
    //发票抬头
    InvoiceGenerateEditItem *nameItem = [[InvoiceGenerateEditItem alloc] init];
    nameItem.titleString = @"发票抬头";
    nameItem.placeholderString = @"请填写发票抬头";
    nameItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:nameItem];
    nameItem.didEditing = ^(NSString *text) {
        [weakself.generateDic setValue:text forKey:@"pname"];
    };
    
    if ([self.generateDic[@"cate"] isEqualToString:@"2"]) {//企业发票，才有税号
        //税号
        InvoiceGenerateEditItem *taxItem = [[InvoiceGenerateEditItem alloc] init];
        taxItem.titleString = @"税号";
        taxItem.placeholderString = @"填写纳税人识别号";
        taxItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:taxItem];
        taxItem.didEditing = ^(NSString *text) {
            [weakself.generateDic setValue:text forKey:@"companynum"];
        };
    }
    
    //发票内容
    InvoiceGenerateContentItem *contentItem = [[InvoiceGenerateContentItem alloc] init];
    contentItem.titleString = @"发票内容";
    contentItem.contentString = @"*车辆租赁*租车服务费";
    contentItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:contentItem];
    
    //发票金额
    InvoiceGenerateContentItem *moneyItem = [[InvoiceGenerateContentItem alloc] init];
    moneyItem.titleString = @"发票金额";
    moneyItem.contentString = self.money;
    moneyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moneyItem];
    
    //更多
    
    //纸质发票，多余的内容
    if ([self.generateDic[@"type"] isEqualToString:@"1"]) {
        InvoiceGenerateBaseItem *wayItem = [[InvoiceGenerateBaseItem alloc] init];
        wayItem.titleString = @"接收方式";
        wayItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:wayItem];
        
        //收件人
        InvoiceGenerateEditItem *addresseeItem = [[InvoiceGenerateEditItem alloc] init];
        addresseeItem.titleString = @"收件人";
        addresseeItem.placeholderString = @"请填写收件人";
        addresseeItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:addresseeItem];
        addresseeItem.didEditing = ^(NSString *text) {
            [weakself.generateDic setValue:text forKey:@"kname"];
        };
        
        //联系电话
        InvoiceGenerateEditItem *phoneItem = [[InvoiceGenerateEditItem alloc] init];
        phoneItem.titleString = @"联系电话";
        phoneItem.placeholderString = @"填写联系电话";
        phoneItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:phoneItem];
        phoneItem.didEditing = ^(NSString *text) {
            [weakself.generateDic setValue:text forKey:@"num"];
        };
        
//        //联系邮箱
//        InvoiceGenerateEditItem *emailItem = [[InvoiceGenerateEditItem alloc] init];
//        emailItem.titleString = @"电子邮箱";
//        emailItem.placeholderString = @"填写联系邮箱";
//        emailItem.selectionStyle = UITableViewCellSelectionStyleNone;
//        [section addItem:emailItem];
        
        //地址
        InvoiceGenerateEditItem *addressItem = [[InvoiceGenerateEditItem alloc] init];
        addressItem.titleString = @"所在地区";
        addressItem.placeholderString = @"填写邮寄地址";
        addressItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:addressItem];
        addressItem.didEditing = ^(NSString *text) {
            [weakself.generateDic setValue:text forKey:@"address"];
        };
    }
    
    //提交
    InvoiceGenerateSubmitItem *submitItem = [[InvoiceGenerateSubmitItem alloc] init];
    submitItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:submitItem];
    submitItem.selectionHandler = ^(id item) {
        [weakself showHint:@"提交"];
        [weakself commitInvoice];
    };
    
}

- (void) commitInvoice {
    NSString *generateString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyOrderInvoiceGenerate,DPToken];
    
    //'cate' ->   1个人；2公司（普票）
//    [self.generateDic setValue:@"1" forKey:@"cate"];
//    [self.generateDic setValue:@"上海童汇信息科技有限公司" forKey:@"pname"]; //发票抬头
//    [self.generateDic setValue:@"" forKey:@"address"]; //写实际地址
//    [self.generateDic setValue:@"" forKey:@"kname"];
//    [self.generateDic setValue:@"" forKey:@"num"];
//    [self.generateDic setValue:@"91310230MA1K1GUD3A" forKey:@"companynum"];  //税号

    
//    [self.generateDic setValue:self.money forKey:@"money"];
    
    [self.generateDic setValue:@"12.00" forKey:@"money"];
    [self.generateDic setValue:@"*车辆租赁*租车服务费" forKey:@"pcontent"];  //发票说明
    [self.generateDic setValue:self.oids forKey:@"oids"];

    DPWeakSelf;
    [self requestDataPostWithString:generateString params:self.generateDic successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
        
        if ([model.status isEqualToString:@"200"]) {
            
            UINavigationController *nav = weakself.navigationController;
            [nav popViewControllerAnimated:NO];
            [nav popViewControllerAnimated:NO];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
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
