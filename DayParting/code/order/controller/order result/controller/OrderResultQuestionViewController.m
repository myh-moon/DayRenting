//
//  OrderResultQuestionViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/13.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultQuestionViewController.h"
#import "UIViewController+Blur.h"
#import "UIViewController+DismissKeyboard.h"
#import "UIImage+Color.h"

#import "UIViewController+ImageBrowser.h"
#import "UIViewController+MutipleImageChoice.h"

//item
#import "MyOrderDetailQuestionItem.h"
#import "OrderResultQuestionTypeItem.h"
#import "MyOrderDetailQuestionContactItem.h"
#import "OrderResultQuestionPictureItem.h"

//model
#import "BaseModel.h"

#define MAX_COUNT 6

@interface OrderResultQuestionViewController ()

@property (nonatomic,strong) NSMutableDictionary *questionDic;
@property (nonatomic,strong) NSMutableArray *testImageArray;


@end

@implementation OrderResultQuestionViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:DPWhiteColor] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"车况上报";
    NSArray *tititi = @[@"车况上报",@"故障上报"];
    self.title = tititi[self.condition - 1];
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"MyOrderDetailQuestionItem"] = @"MyOrderDetailQuestionCell";
    self.DPManager[@"OrderResultQuestionTypeItem"] = @"OrderResultQuestionTypeCell";
    self.DPManager[@"MyOrderDetailQuestionContactItem"] = @"MyOrderDetailQuestionContactCell";
    self.DPManager[@"OrderResultQuestionPictureItem"] = @"OrderResultQuestionPictureCell";
    
    [self setupOrderResultQuestionTableView];
    
    [self setupForDismissKeyboard];
}

#pragma mark - init
- (NSMutableDictionary *)questionDic {
    if (!_questionDic) {
        _questionDic = [NSMutableDictionary dictionary];
    }
    return _questionDic;
}

- (NSMutableArray *)testImageArray {
    if (!_testImageArray) {
        _testImageArray = [NSMutableArray arrayWithObject:@"upload_photos"];
    }
    return _testImageArray;
}

#pragma mark - method
- (void) setupOrderResultQuestionTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    MyOrderDetailQuestionItem *titleItem = [[MyOrderDetailQuestionItem alloc] init];
    titleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.condition == 1) {//车况上报
        titleItem.titleString = @"车辆情况上报\n";
        titleItem.contentString = @"您所反馈的信息我们将记录并保存，感谢您的支持";
    }else{
        titleItem.titleString = @"车辆故障报修\n";
        titleItem.contentString = @"很抱歉给您带来不便，我们将及时为您处理";
    }
    [section addItem:titleItem];
    
    DPWeakSelf;
    //type
    OrderResultQuestionTypeItem *typeItem = [[OrderResultQuestionTypeItem alloc] init];
    typeItem.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.condition == 1) {
        typeItem.titleString = @"请选择车辆状况类型";
        typeItem.typeLists = @[@"车辆划痕",@"车身掉漆",@"车身磕碰",@"占用车位",@"车内脏乱",@"物品遗留",@"其他问题"];
        typeItem.placeholderString = @"问题补充…";
    }else{
        typeItem.titleString = @"请选择车辆问题类型";
        typeItem.typeLists = @[@"无法启动",@"刹车故障",@"座椅故障",@"车灯故障",@"油量异常",@"空调故障",@"其他故障"];
        typeItem.placeholderString = @"请尽可能描述您遇到的问题…";
    }
    [section addItem:typeItem];
    typeItem.didEditting = ^(NSString *text) {
        [weakself.questionDic setValue:text forKey:@"content"];
    };
    
    //images
    OrderResultQuestionPictureItem *imagesItem = [[OrderResultQuestionPictureItem alloc] init];
    imagesItem.selectionStyle = UITableViewCellSelectionStyleNone;
    imagesItem.titleString = @"上传车况照片（可选）";
    imagesItem.pictureList = self.testImageArray;
    imagesItem.cellHeight = 180;
    [section addItem:imagesItem];
    @weakify(imagesItem);
    imagesItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag < 10) {//上传照片
            if (weakself.testImageArray.count <= 6 && [weakself.testImageArray.lastObject isKindOfClass:[NSString class]]) {
                [weakself addImageWithMaxSelection:(7-weakself.testImageArray.count) andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
                    if (images.count == 7-weakself.testImageArray.count) {
                        [weakself.testImageArray removeLastObject];
                        [weakself.testImageArray addObjectsFromArray:images];
                    }else{
                        [weakself.testImageArray removeLastObject];
                        [weakself.testImageArray addObjectsFromArray:images];
                        [weakself.testImageArray addObject:@"upload_photos"];
                    }
                    @strongify(imagesItem);
                    if (weakself.testImageArray.count > 3) {
                        imagesItem.cellHeight = 180+115;
                    }else{
                        imagesItem.cellHeight = 180;
                    }
                    imagesItem.pictureList = weakself.testImageArray;
                    [imagesItem reloadRowWithAnimation:UITableViewRowAnimationNone];
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
            if (weakself.testImageArray.count == 5 && [weakself.testImageArray.lastObject isKindOfClass:[UIImage class]]) {
                [weakself.testImageArray addObject:@"upload_photos"];
            }
            @strongify(imagesItem);
            if (weakself.testImageArray.count > 3) {
                imagesItem.cellHeight = 180+115;
            }else{
                imagesItem.cellHeight = 180;
            }
            imagesItem.pictureList = weakself.testImageArray;
            [imagesItem reloadRowWithAnimation:UITableViewRowAnimationNone];
        }
    };
    
    //commit
    MyOrderDetailQuestionContactItem *contactItem = [[MyOrderDetailQuestionContactItem alloc] init];
    contactItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:contactItem];
    
    contactItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 364) {//提交
            
            [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:@"提交车况报修后，车辆将被锁定本次您将无法继续该车辆" andLeftAct:@"确认报修" leftColor:DPLightGrayColor andRightAct:@"再检查一下" rightColor:DPBlueColor finishBlock:^(NSString *unlock) {
                if ([unlock isEqualToString:@"左边"]) {
                    [weakself toSubmitQuestions];
                }
            }];
            
        }else{//联系客服
            NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"13162521916"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    };
}

- (void) toSubmitQuestions {
    
    NSString *questionString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfQuestion,DPToken];

    [self.questionDic setValue:@"1" forKey:@"type"];
    [self.questionDic setValue:self.oid forKey:@"oid"];
    
    DPWeakSelf;
    [self requestDataPostWithString:questionString params:self.questionDic successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        if ([model.status isEqualToString:@"200"]) {
            UINavigationController *nav = self.navigationController;
            [nav popViewControllerAnimated:NO];
            [nav popViewControllerAnimated:NO];
        }else{
            [weakself showHint:model.info];
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
