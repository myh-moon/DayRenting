//
//  MyOrderInvoiceHistoryDetailViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderInvoiceHistoryDetailViewController.h"
#import "UIViewController+ImageBrowser.h"


#import "SeperateItem.h"
#import "MyOrderInvoiceHistoryDetailCheckItem.h"
#import "MyOrderInvoiceHistoryDetailItem.h"
#import "InvoiceGenerateBaseItem.h"

#import "MyHistoryDetailResponse.h"
#import "MyHistoryModel.h"

@interface MyOrderInvoiceHistoryDetailViewController ()

@end

@implementation MyOrderInvoiceHistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.type isEqualToString:@"1"]) {
        self.title = @"纸质开票详情";
    }else{
        self.title = @"电子开票详情";
    }
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPTableView.backgroundColor = DPBackGroundColor;
    
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"MyOrderInvoiceHistoryDetailCheckItem"] = @"MyOrderInvoiceHistoryDetailCheckCell";
    self.DPManager[@"InvoiceGenerateBaseItem"] = @"InvoiceGenerateBaseCell";
    self.DPManager[@"MyOrderInvoiceHistoryDetailItem"] = @"MyOrderInvoiceHistoryDetailCell";
    
    [self getHistoryInvoiceDetail];
}

- (void) setupMyOrderInvoiceHistoryDetailTableViewWithModel:(MyHistoryModel *)model {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.cellHeight = DPSmallSpacing;
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem1];
    
    //发票已开具
    DPWeakSelf;
    MyOrderInvoiceHistoryDetailCheckItem *checkItem = [[MyOrderInvoiceHistoryDetailCheckItem alloc] initWithHistoryModel:model andTag:@"1"];
    checkItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:checkItem];
    checkItem.selectionHandler = ^(id item) {
        NSString *address = [NSString stringWithFormat:@"%@%@",DPBaseUrl,model.address];
        NSArray *sdsd = [NSArray arrayWithObject:address];

        [weakself showImages:sdsd];
        
//        [weakself downloadInvoiceImageWithString:address];
    };
    
    SeperateItem *seperateItem2 = [[SeperateItem alloc] init];
    seperateItem2.cellHeight = DPSmallSpacing;
    seperateItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem2];
    
    //发票信息
    InvoiceGenerateBaseItem *contentTitleItem = [[InvoiceGenerateBaseItem alloc] init];
    contentTitleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    contentTitleItem.titleString = @"发票信息";
    [section addItem:contentTitleItem];
    
    
    //content
    MyOrderInvoiceHistoryDetailItem *pnameItem = [[MyOrderInvoiceHistoryDetailItem alloc] init];
    pnameItem.titleString = @"发票抬头";
    pnameItem.contentString = model.pname;
    pnameItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:pnameItem];
    
    MyOrderInvoiceHistoryDetailItem *pcontentItem = [[MyOrderInvoiceHistoryDetailItem alloc] init];
    pcontentItem.titleString = @"发票内容";
    pcontentItem.contentString = model.pcontent;
    pcontentItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:pcontentItem];
    
    MyOrderInvoiceHistoryDetailItem *moneyItem = [[MyOrderInvoiceHistoryDetailItem alloc] init];
    moneyItem.titleString = @"发票金额";
    moneyItem.contentString = model.money;
    moneyItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moneyItem];
    
    MyOrderInvoiceHistoryDetailItem *timeItem = [[MyOrderInvoiceHistoryDetailItem alloc] init];
    timeItem.titleString = @"申请时间";
    timeItem.contentString = [NSDate getMDWhmFormatterTime:model.addtime];
    timeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:timeItem];
    
    
    //行程
    SeperateItem *seperateItem3 = [[SeperateItem alloc] init];
    seperateItem3.cellHeight = DPBigSpacing;
    seperateItem3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:seperateItem3];
    
    MyOrderInvoiceHistoryDetailCheckItem *tripItem = [[MyOrderInvoiceHistoryDetailCheckItem alloc] initWithHistoryModel:model andTag:@"2"];
    tripItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:tripItem];
    
    
}

- (void) getHistoryInvoiceDetail {
    NSString *historyDetailString = [NSString stringWithFormat:@"%@%@/%@/%@",DPBaseUrl,DPMyOrderInvoiceHistoryListOfDetail,DPToken,self.ID];
    
    DPWeakSelf;
    [self requestDataGetWithString:historyDetailString params:nil successBlock:^(id responseObject) {
        
        MyHistoryDetailResponse *response = [MyHistoryDetailResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            [weakself setupMyOrderInvoiceHistoryDetailTableViewWithModel:response.data];
            [weakself.DPTableView reloadData];
        }else{
            [weakself showHint:response.info];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void) downloadInvoiceImageWithString:(NSString *)urlString {
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:urlString] options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

    }];
}

- (void) image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        [self showHint:@"保存成功"];
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
