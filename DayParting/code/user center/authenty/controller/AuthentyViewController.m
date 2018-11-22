//
//  AuthentyViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyViewController.h"

#import "UIViewController+MutipleImageChoice.h"
#import "UIViewController+Blur.h"

#import "AuthentyProcessItem.h"
#import "AuthentyProcessFirstItem.h"
#import "AuthentyProcessSecondItem.h"
#import "AuthentyProcessThirdItem.h"

#import "UserResponse.h"
#import "UserModel.h"

#import "AuthentyResponse.h"
#import "AuthentyModel.h"
#import "IDCardModel.h"

@interface AuthentyViewController ()

@property (nonatomic,strong) NSMutableDictionary *authentyDic;

@property (nonatomic,strong) NSString *step;

@property (nonatomic,strong) NSString *sideSrc;  //反面照片url
@property (nonatomic,strong) NSString *frontSrc; //正面照片url

@end

@implementation AuthentyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"实名认证";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"AuthentyProcessItem"] = @"AuthentyProcessCell";
    self.DPManager[@"AuthentyProcessFirstItem"] = @"AuthentyProcessFirstCell";
    self.DPManager[@"AuthentyProcessSecondItem"] = @"AuthentyProcessSecondCell";
    self.DPManager[@"AuthentyProcessThirdItem"] = @"AuthentyProcessThirdCell";
    
//    [self setupAuthentyTableView];
    [self getUserCenterMessages];
}

#pragma mark - getter
- (NSMutableDictionary *)authentyDic {
    if (!_authentyDic) {
        _authentyDic = [NSMutableDictionary dictionary];
    }
    return _authentyDic;
}

#pragma mark - method
- (void) setupAuthentyTableView {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    AuthentyProcessItem *processItem = [[AuthentyProcessItem alloc] init];
    processItem.stepString = self.step;
    processItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:processItem];
    
    if ([self.step isEqualToString:@"1"]) {
        //身份认证
        AuthentyProcessFirstItem *firstItem = [[AuthentyProcessFirstItem alloc] init];
        firstItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:firstItem];
        firstItem.didSelectedBtn = ^(NSInteger tag) {
            if (tag == 3434) {//正面
                [weakself addImageWithMaxSelection:1 andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
                    weakself.sideSrc = @"http://www.jiamanu.cn/Template/Default/Css/201806/images/sy_xs_tu.png";
                    weakself.frontSrc = @"http://www.jiamanu.cn/Template/Default/Css/201806/images/sy_xs_tu.png";

//                    [weakself uploadImageWithType:@"idcard" andSide:@"1" andImage:images[0]];
                }];
                
            }else if (tag == 3435){//反面
                [weakself addImageWithMaxSelection:1 andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
                    [weakself uploadImageWithType:@"idcard" andSide:@"0" andImage:images[0]];
                }];

            }else{
                weakself.step = @"2";
                
                [weakself setupAuthentyTableView];
                [weakself.DPTableView reloadData];
//                if (weakself.authentyDic[@"realname"] && weakself.authentyDic[@"idcard"] &&weakself.authentyDic[@"idfront"]) {
//                    [weakself showAuthentyViewInView:weakself.view andName:weakself.authentyDic[@"realname"] andIDCard:weakself.authentyDic[@"idcard"] finishBlock:^(NSString *unlock) {
//                        [weakself confirmAuthentyMessage];
//                    }];
//                }
                
            }
        };
        
        //监控照片上传结果
        RACSignal *imgSignal = [RACSignal combineLatest:@[RACObserve(self,sideSrc),RACObserve(self, frontSrc)] reduce:^(NSString *side,NSString *front){
            firstItem.sideString = side;//反面

            firstItem.frontString = front;//正面

            return @"3";
        }];
        
        [imgSignal subscribeNext:^(id x) {
            
        }];
        
    }else if ([self.step isEqualToString:@"2"]){
        //面部识别
        AuthentyProcessSecondItem *secondItem = [[AuthentyProcessSecondItem alloc] init];
        secondItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:secondItem];
        secondItem.didSelectedBtn = ^(NSInteger tag) {
            if (tag == 3434) {
                [weakself addImageWithMaxSelection:1 andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
                        [weakself uploadImageWithType:@"usertop" andSide:@"0" andImage:images[0]];
                }];
            }else{
                
                if (!weakself.authentyDic[@"usertop"]) {
                    [weakself showHint:@"请先采集头像"];
                }else{

                    [weakself showCommonBlurInView:weakself.view andRemindImage:@"invoice_remind" andRemindString:@"提交认证审核后，您将无法修改" andLeftAct:@"确认提交" leftColor:DPBlueColor andRightAct:@"取消" rightColor:DPLightGrayColor finishBlock:^(NSString *unlock) {
                        if ([unlock isEqualToString:@"左边"]) {
                            weakself.step = @"3";
                            [weakself setupAuthentyTableView];
                            [weakself.DPTableView reloadData];
                        }
                    }];
                }
            }
        };
    }else{
        //认证完成
        AuthentyProcessThirdItem *thirdItem = [[AuthentyProcessThirdItem alloc] init];
        thirdItem.remindString = @"已成功提交身份认证信息";
        thirdItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:thirdItem];
        thirdItem.didSelectedBtn = ^(NSInteger tag) {
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
}

- (void) uploadImageWithType:(NSString *)type andSide:(NSString *)side andImage:(UIImage *)img{
    [self showHudInView:self.view hint:@"正在上传,请稍后"];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    
    NSString *uploadString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyAuthentyOfUploadImage,DPToken];
    
    NSDictionary *params = @{
               @"paper" : type,
               @"aspect" : side
               };

    DPWeakSelf;
    [session POST:uploadString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //获取原图片宽高比
        CGFloat sourceImageAspectRatio = img.size.width/img.size.height;
        //先调整分辨率
        CGSize defaultSize = CGSizeMake(1024, 1024/sourceImageAspectRatio);
        UIImage *newImage = [self newSizeImage:defaultSize image:img];
        
        NSData *imageData =UIImageJPEGRepresentation(newImage,0.7);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat =@"yyyy-MM-dd H:mm:ss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakself hideHud];
        
        AuthentyResponse *response = [AuthentyResponse mj_objectWithKeyValues:responseObject];
        [weakself showHint:response.info];
        
        if ([response.status isEqualToString:@"200"]) {
            
            if ([type isEqualToString:@"idcard"]) {
                IDCardModel *cardModel = response.path.idcardArr;
                if ([side isEqualToString:@"1"]) {//反面
                    [weakself.authentyDic setValue:cardModel.name forKey:@"realname"];
                    [weakself.authentyDic setValue:cardModel.num forKey:@"idcard"];
                    [weakself.authentyDic setValue:response.path.src forKey:@"idside"];
                    
                    weakself.sideSrc = response.path.src;
                    
                }else{//正面
                    [weakself.authentyDic setValue:response.path.src forKey:@"idfront"];
                    
                    weakself.frontSrc = response.path.src;
                }
            }else if ([type isEqualToString:@"usertop"]){//脸部识别
                [weakself.authentyDic setValue:@"success" forKey:@"usertop"];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakself showHint:@"上传失败"];
        [weakself hideHud];
    }];
}

//第一步确认身份证信息
- (void) confirmAuthentyMessage {
    NSString *confimString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyAuthentyOfConfirmIDCard,DPToken];
    
    DPWeakSelf;
    [self requestDataPostWithString:confimString params:weakself.authentyDic successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:model.info];
        
        if ([model.status isEqualToString:@"200"]) {
            weakself.step = @"2";
            
            [weakself setupAuthentyTableView];
            [weakself.DPTableView reloadData];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}


#pragma mark 调整图片分辨率/尺寸（等比例缩放）
- (UIImage *)newSizeImage:(CGSize)size image:(UIImage *)sourceImage {
    CGSize newSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    
    CGFloat tempHeight = newSize.height / size.height;
    CGFloat tempWidth = newSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    } else if (tempHeight > 1.0 && tempWidth < tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [sourceImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)back {
    
    //第一步第二步的时候，返回提示
    if ([self.step isEqualToString:@"1"] || [self.step isEqualToString:@"2"]) {
        UIAlertController *remindAlertController = [UIAlertController alertControllerWithTitle:@"确定返回？" message:@"若返回成功，则相关信息不会保存" preferredStyle:UIAlertControllerStyleAlert];
        
        DPWeakSelf;
        UIAlertAction *act0 = [UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }];
        [remindAlertController addAction:act0];
        
        UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"取消" style:0 handler:nil];
        [remindAlertController addAction:act1];
        
        [self presentViewController:remindAlertController animated:YES completion:nil];
    }
}


- (void) getUserCenterMessages {
    NSString *centerString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyUserCenterMessages,DPToken];
    
    DPWeakSelf;
    [self requestDataGetWithString:centerString params:nil successBlock:^(id responseObject) {
        
        UserResponse *response = [UserResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
//            if (!response.data) {
//                weakself.step = @"1";
//            }else{
//                weakself.step = @"2";
//            }
            weakself.step = @"1";
            [weakself setupAuthentyTableView];
            [weakself.DPTableView reloadData];
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
