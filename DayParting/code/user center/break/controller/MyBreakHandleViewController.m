//
//  MyBreakHandleViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakHandleViewController.h"
#import "UIViewController+MutipleImageChoice.h" //s选择图片
#import "UIViewController+DismissKeyboard.h"
#import "UIViewController+ImageBrowser.h"

#import "SeperateItem.h"
#import "MyBreakDeailNumberItem.h"
#import "InvoiceGenerateBaseItem.h"
#import "MyBreakDeailTextItem.h"
#import "MyBreakDetailPayWayItem.h"
#import "MyBreakDetailPayCommitItem.h"
#import "MyBreakDetailHeaderItem.h"
#import "MyBreakDetailPictureItem.h"
#import "MyBreakDetailSubmitItem.h"

#import "MyBreakDetailResponse.h"
#import "MyBreakModel.h"

@interface MyBreakHandleViewController ()

@property (nonatomic,strong) NSMutableArray *testImageArray;
@property (nonatomic,strong) NSMutableDictionary *handleTextDic;

@end

@implementation MyBreakHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.handleString isEqualToString:@"1"]) {
        self.title = @"线上缴费";
    }else{
        self.title = @"自行处理";
    }
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"缴费帮助" forState:0];
    
    self.DPTableView.backgroundColor = DPBackGroundColor;
    
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"MyBreakDeailNumberItem"] = @"MyBreakDeailNumberCell";
    self.DPManager[@"InvoiceGenerateBaseItem"] = @"InvoiceGenerateBaseCell";
    self.DPManager[@"MyBreakDeailTextItem"] = @"MyBreakDeailTextCell";
    self.DPManager[@"MyBreakDetailPayWayItem"] = @"MyBreakDetailPayWayCell";
    self.DPManager[@"MyBreakDetailPayCommitItem"] = @"MyBreakDetailPayCommitCell";
    self.DPManager[@"MyBreakDetailHeaderItem"] = @"MyBreakDetailHeaderCell";
    self.DPManager[@"MyBreakDetailPictureItem"] = @"MyBreakDetailPictureCell";
    self.DPManager[@"MyBreakDetailSubmitItem"] = @"MyBreakDetailSubmitCell";
    
    [self getDetailOfMyBreak];
    
    [self setupForDismissKeyboard];
}

#pragma mark - init
- (NSMutableArray *)testImageArray {
    if (!_testImageArray) {
        _testImageArray = [NSMutableArray arrayWithObject:@"upload_photo"];
    }
    return _testImageArray;
}

- (NSMutableDictionary *)handleTextDic {
    if (!_handleTextDic) {
        _handleTextDic = [NSMutableDictionary dictionary];
    }
    return _handleTextDic;
}

#pragma mark - method
- (void) setupMyBreakHandleTableViewWithModel:(MyBreakModel *)model {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    SeperateItem *seperateItem1 = [[SeperateItem alloc] init];
    seperateItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    seperateItem1.cellHeight = DPSmallSpacing;
    [section addItem:seperateItem1];
    
    //决定书编号
    MyBreakDeailNumberItem *numberItem = [[MyBreakDeailNumberItem alloc] init];
    numberItem.numberStr = model.oid;
    numberItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:numberItem];
    
    //违章信息
    InvoiceGenerateBaseItem *generateItem = [[InvoiceGenerateBaseItem alloc] init];
    generateItem.titleString = @"违章信息";
    generateItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:generateItem];
    
    //车牌号码
    MyBreakDeailTextItem *licenseTextItem = [[MyBreakDeailTextItem alloc] init];
    licenseTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    licenseTextItem.titleString = @"车牌号码";
    licenseTextItem.contentString = model.wznumber;
    licenseTextItem.cellHeight = 50;
    [section addItem:licenseTextItem];
    
    //违章代码
    MyBreakDeailTextItem *codeTextItem = [[MyBreakDeailTextItem alloc] init];
    codeTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    codeTextItem.titleString = @"违章代码";
    codeTextItem.contentString = @"未返回";
    codeTextItem.cellHeight = 50;
    [section addItem:codeTextItem];
    
    //违章行为
    MyBreakDeailTextItem *detailTextItem = [[MyBreakDeailTextItem alloc] init];
    detailTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    detailTextItem.titleString = @"违章行为";
    detailTextItem.contentString = model.wzcontent;
    detailTextItem.cellHeight = 50;
    [section addItem:detailTextItem];
    
    //违章时间
    MyBreakDeailTextItem *timeTextItem = [[MyBreakDeailTextItem alloc] init];
    timeTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    timeTextItem.titleString = @"违章时间";
    timeTextItem.contentString = [NSDate getAnotherYMDhmsFormatterTime:model.wztime];
    timeTextItem.cellHeight = 50;
    [section addItem:timeTextItem];
    
    //违章地点
    MyBreakDeailTextItem *addressTextItem = [[MyBreakDeailTextItem alloc] init];
    addressTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    addressTextItem.titleString = @"违章地点";
    addressTextItem.contentString = model.wzaddr;
    addressTextItem.cellHeight = 50;
    addressTextItem.showSeperate = @"0";
    [section addItem:addressTextItem];
    
    //处罚结果
    InvoiceGenerateBaseItem *handleResultItem = [[InvoiceGenerateBaseItem alloc] init];
    handleResultItem.titleString = @"处罚结果";
    handleResultItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:handleResultItem];
    
    //违章扣分
    MyBreakDeailTextItem *deductionTextItem = [[MyBreakDeailTextItem alloc] init];
    deductionTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    deductionTextItem.titleString = @"违章扣分";
    if ([model.wzkf isEqualToString:@"0"]) {
        deductionTextItem.contentString = @"不扣分";
    }else{
        deductionTextItem.contentString = [NSString stringWithFormat:@"扣%@分",model.wzkf];
    }
    deductionTextItem.cellHeight = 50;
    [section addItem:deductionTextItem];
    
    //罚款金额
    MyBreakDeailTextItem *moneyTextItem = [[MyBreakDeailTextItem alloc] init];
    moneyTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    moneyTextItem.titleString = @"罚款金额";
    moneyTextItem.contentString = model.wzfj;
    moneyTextItem.cellHeight = 50;
    [section addItem:moneyTextItem];
    
    //滞纳金
    MyBreakDeailTextItem *lateFeeTextItem = [[MyBreakDeailTextItem alloc] init];
    lateFeeTextItem.selectionStyle = UITableViewCellSelectionStyleNone;
    lateFeeTextItem.titleString = @"滞纳金";
    lateFeeTextItem.contentString = @"未返回";
    lateFeeTextItem.cellHeight = 50;
    lateFeeTextItem.showSeperate = @"0";
    [section addItem:lateFeeTextItem];
    
    DPWeakSelf;
    if ([self.handleString isEqualToString:@"1"]) {
        //支付方式
        InvoiceGenerateBaseItem *payMethodItem = [[InvoiceGenerateBaseItem alloc] init];
        payMethodItem.titleString = @"选择支付方式";
        payMethodItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:payMethodItem];
        
        //微信支付
        MyBreakDetailPayWayItem *wechatItem = [[MyBreakDetailPayWayItem alloc] init];
        wechatItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:wechatItem];
        
        //立即缴费
        MyBreakDetailPayCommitItem *commitItem = [[MyBreakDetailPayCommitItem alloc] init];
        commitItem.moneyString = @"未返回";
        commitItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:commitItem];
        DPWeakSelf;
        commitItem.didSelectedBtn = ^(NSInteger tag) {
            [weakself showHint:@"立即缴费"];
        };
    }else if ([self.handleString isEqualToString:@"2"]){
        
        // 请上传已处理违章材料
        MyBreakDetailHeaderItem *headerItem = [[MyBreakDetailHeaderItem alloc] init];
        headerItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:headerItem];
        
        //发票照片
        MyBreakDetailPictureItem *pictureItem = [[MyBreakDetailPictureItem alloc] init];
        pictureItem.selectionStyle = UITableViewCellSelectionStyleNone;
        pictureItem.pictureList = weakself.testImageArray;
        [section addItem:pictureItem];
        
        @weakify(pictureItem);
        pictureItem.didSelectedBtn = ^(NSInteger tag) {
            if (tag < 5) {//上传照片
                if (weakself.testImageArray.count <= 3 && [weakself.testImageArray.lastObject isKindOfClass:[NSString class]]) {
                    [weakself addImageWithMaxSelection:(4-weakself.testImageArray.count) andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
                        if (images.count == 4-weakself.testImageArray.count) {
                            [weakself.testImageArray removeLastObject];
                            [weakself.testImageArray addObjectsFromArray:images];
                        }else{
                            [weakself.testImageArray removeLastObject];
                            [weakself.testImageArray addObjectsFromArray:images];
                            [weakself.testImageArray addObject:@"upload_photo"];
                        }
                        @strongify(pictureItem);
                        pictureItem.pictureList = weakself.testImageArray;
                    }];
                }
            }else if (tag < 30){//查看大图
                NSMutableArray *asas = [NSMutableArray array];
                [asas addObjectsFromArray:weakself.testImageArray];
                if ([asas.lastObject isKindOfClass:[NSString class]]) {
                    [asas removeLastObject];
                    [weakself showImages:asas currentIndex:(tag-20)];
                }else{
                    [weakself showImages:asas currentIndex:(tag - 20)];
                }
            }else{
                //删除按钮删除照片
                [weakself.testImageArray removeObjectAtIndex:(tag - 40)];
                if (weakself.testImageArray.count == 2 && [weakself.testImageArray.lastObject isKindOfClass:[UIImage class]]) {
                    [weakself.testImageArray addObject:@"upload_photo"];
                }
                @strongify(pictureItem);
                 pictureItem.pictureList = weakself.testImageArray;
            }
        };
        
        pictureItem.didEditting = ^(NSString *text) {
            [weakself.handleTextDic setValue:text forKey:@"content"];
        };
        
        //提交材料
        MyBreakDetailSubmitItem *submitItem = [[MyBreakDetailSubmitItem alloc] init];
        submitItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:submitItem];
        submitItem.didSelectedBtn = ^(NSInteger tag) {
            if (tag == 21) {//提交材料
                [weakself showHint:@"提交材料"];
            }else{//线上缴费
                weakself.title = @"线上缴费";
                weakself.handleString = @"1";
                [weakself setupMyBreakHandleTableViewWithModel:model];
                [weakself.DPTableView reloadData];
                
                [weakself.DPTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
            }
        };
    }
}

- (void) getDetailOfMyBreak {
    NSString *breakDetailString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyBreakDetail,DPToken];
    
    NSDictionary *param = @{@"id" : self.ID};
    
    DPWeakSelf;
    [self requestDataPostWithString:breakDetailString params:param successBlock:^(id responseObject) {
        
        MyBreakDetailResponse *response = [MyBreakDetailResponse mj_objectWithKeyValues:responseObject];
        if ([response.status isEqualToString:@"200"]) {
            [weakself setupMyBreakHandleTableViewWithModel:response.data];
            [weakself.DPTableView reloadData];
        }else{
            [weakself showHint:response.info];
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
