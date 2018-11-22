//
//  MyOrderDetailQuestionViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyOrderDetailQuestionViewController.h"

#import "UIViewController+DismissKeyboard.h"

#import "MyOrderDetailQuestionItem.h"
#import "MyOrderDetailQuestionTypeItem.h"
#import "MyOrderDetailQuestionReasonItem.h"
#import "MyOrderDetailQuestionContactItem.h"

#import "BaseModel.h"

@interface MyOrderDetailQuestionViewController ()

@property (nonatomic,strong) NSMutableDictionary *questionDic;

@end

@implementation MyOrderDetailQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单疑问";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    [self.questionDic setValue:@"4" forKey:@"type"];
    
    self.DPManager[@"MyOrderDetailQuestionItem"] = @"MyOrderDetailQuestionCell";
    self.DPManager[@"MyOrderDetailQuestionTypeItem"] = @"MyOrderDetailQuestionTypeCell";
    self.DPManager[@"MyOrderDetailQuestionReasonItem"] = @"MyOrderDetailQuestionReasonCell";
    self.DPManager[@"MyOrderDetailQuestionContactItem"] = @"MyOrderDetailQuestionContactCell";
    
    [self setupMyOrderDetailQuestionTableView];
    
    [self setupForDismissKeyboard];
}

#pragma mark - getter
- (NSMutableDictionary *)questionDic {
    if (!_questionDic) {
        _questionDic = [NSMutableDictionary dictionary];
    }
    return _questionDic;
}

- (void) setupMyOrderDetailQuestionTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    MyOrderDetailQuestionItem *titleItem = [[MyOrderDetailQuestionItem alloc] init];
    titleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    titleItem.titleString = @"订单疑问原因\n";
    titleItem.contentString = @"请选择订单异议原因，我们会及时为您处理";
    [section addItem:titleItem];
    
    DPWeakSelf;
    //未及时结束计费
    MyOrderDetailQuestionTypeItem *typeItem1 = [[MyOrderDetailQuestionTypeItem alloc] init];
    typeItem1.typeString = @"未及时结束计费";
    typeItem1.showSelected = @"0";
    typeItem1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:typeItem1];
    
    //优惠券使用问题
    MyOrderDetailQuestionTypeItem *typeItem2 = [[MyOrderDetailQuestionTypeItem alloc] init];
    typeItem2.typeString = @"优惠券使用问题";
    typeItem2.showSelected = @"0";
    typeItem2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:typeItem2];
    
    
//    多收尊享服务费
    MyOrderDetailQuestionTypeItem *typeItem3 = [[MyOrderDetailQuestionTypeItem alloc] init];
    typeItem3.typeString = @"多收尊享服务费";
    typeItem3.showSelected = @"0";
    typeItem3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:typeItem3];

    //其他原因
    MyOrderDetailQuestionTypeItem *typeItem4 = [[MyOrderDetailQuestionTypeItem alloc] init];
    typeItem4.typeString = @"其他原因";
    typeItem4.showSelected = @"1";
    typeItem4.selectionStyle = UITableViewCellSelectionStyleNone;
    typeItem4.showSeperate = @"3";
    [section addItem:typeItem4];
    
    //编辑原因
    MyOrderDetailQuestionReasonItem *reasonItem = [[MyOrderDetailQuestionReasonItem alloc] init];
    reasonItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:reasonItem];
    reasonItem.didEditing = ^(NSString *text) {
        [weakself.questionDic setValue:text forKey:@"content"];
    };
    
//事件
    @weakify(typeItem1);
    @weakify(typeItem2);
    @weakify(typeItem3);
    @weakify(typeItem4);
    typeItem1.selectionHandler = ^(id item) {
        @strongify(typeItem1);
        @strongify(typeItem2);
        @strongify(typeItem3);
        @strongify(typeItem4);

        typeItem1.showSelected = @"1";
        typeItem2.showSelected = @"0";
        typeItem3.showSelected = @"0";
        typeItem4.showSelected = @"0";
        
        [weakself.questionDic setValue:@"1" forKey:@"type"];
    };
    
    typeItem2.selectionHandler = ^(id item) {
        @strongify(typeItem1);
        @strongify(typeItem2);
        @strongify(typeItem3);
        @strongify(typeItem4);
        
        typeItem1.showSelected = @"0";
        typeItem2.showSelected = @"1";
        typeItem3.showSelected = @"0";
        typeItem4.showSelected = @"0";
        
        [weakself.questionDic setValue:@"2" forKey:@"type"];

    };
    
    typeItem3.selectionHandler = ^(id item) {
        @strongify(typeItem1);
        @strongify(typeItem2);
        @strongify(typeItem3);
        @strongify(typeItem4);
        
        typeItem1.showSelected = @"0";
        typeItem2.showSelected = @"0";
        typeItem3.showSelected = @"1";
        typeItem4.showSelected = @"0";
        
        [weakself.questionDic setValue:@"3" forKey:@"type"];

    };
    
    typeItem4.selectionHandler = ^(id item) {
        @strongify(typeItem1);
        @strongify(typeItem2);
        @strongify(typeItem3);
        @strongify(typeItem4);
        
        typeItem1.showSelected = @"0";
        typeItem2.showSelected = @"0";
        typeItem3.showSelected = @"0";
        typeItem4.showSelected = @"1";
        
        [weakself.questionDic setValue:@"4" forKey:@"type"];
        
    };
    
//    RACSignal *reasonSignal = [RACSignal combineLatest:@[RACObserve(typeItem4, showSelected)] reduce:^id(NSString *show){
//      
//        if ([show isEqualToString:@"1"]) {
//            reasonItem
//        }else{
//            
//        }
//        
//        return @"wq";
//    }];
//    
//    [reasonSignal subscribeNext:^(id x) {
//        
//    }];
    
    
    //提交
    MyOrderDetailQuestionContactItem *contactItem = [[MyOrderDetailQuestionContactItem alloc] init];
    contactItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:contactItem];
    
    contactItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 364) {//提交
            [weakself submitQuestions];
        }else{//联系客服
            [weakself showHint:@"联系客服"];
        }
    };
}

- (void) submitQuestions {
    NSString *questionString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyOrderDetailOfQuestion,DPToken];
    
//    type  1 未及时结束计费  2 优惠券使用问题  3 多收尊享服务费  为 4 的时候是用户填写，
    [self.questionDic setValue:self.oid forKey:@"oid"];

    DPWeakSelf;
    [self requestDataPostWithString:questionString params:self.questionDic successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        if ([model.status isEqualToString:@"200"]) {
            
            if (weakself.didBack) {
                weakself.didBack(@"back");
                [weakself.navigationController popViewControllerAnimated: YES];
            }
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
