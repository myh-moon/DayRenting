//
//  AuthentyDriverViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyDriverViewController.h"
#import "AuthentyDriverResultViewController.h"

#import "UIViewController+MutipleImageChoice.h"
//#import "UIViewController+ImagePicker.h"

#import "AuthentyDriverItem.h"

#import "AuthentyResponse.h"
#import "AuthentyModel.h"

@interface AuthentyDriverViewController ()

@property (nonatomic,strong) NSDictionary *driverDic;

@end

@implementation AuthentyDriverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"驾照认证";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    self.DPManager[@"AuthentyDriverItem"] = @"AuthentyDriverCell";
    
    [self setupAuthentyDriverTableView];
}

#pragma mark - getter
- (NSDictionary *)driverDic {
    if (!_driverDic) {
        _driverDic = [NSMutableDictionary dictionary];
    }
    return _driverDic;
}

#pragma mark - method
- (void) setupAuthentyDriverTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    AuthentyDriverItem *driverItem = [[AuthentyDriverItem alloc] init];
    driverItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:driverItem];
    
    DPWeakSelf;
    driverItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 3434) {
//            [weakself showAlertOfImageChoiceWith:^(UIImage *img) {
//                [weakself uploadDriverImageWithType:@"driverinfo" andSide:@"0" andImage:img];
//            }];
            [weakself addImageWithMaxSelection:1 andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
                [weakself uploadDriverImageWithType:@"driverinfo" andSide:@"0" andImage:images[0]];
            }];
            
        }else if (tag == 3435){
//            [weakself showAlertOfImageChoiceWith:^(UIImage *img) {
//                [weakself uploadDriverImageWithType:@"driverinfo" andSide:@"1" andImage:img];
//            }];
            [weakself addImageWithMaxSelection:1 andMutipleChoise:YES andFinishBlock:^(NSArray *images) {
                [weakself uploadDriverImageWithType:@"driverinfo" andSide:@"1" andImage:images[0]];
            }];
        }else{
            if (weakself.driverDic[@"driverf"] && weakself.driverDic[@"drivers"]) {
                [weakself confirmAuthentyDriverMessage];
            }else{
                [weakself showHint:@"请上传驾照主页或副业照片"];
            }
        }
    };
}

- (void) uploadDriverImageWithType:(NSString *)type andSide:(NSString *)side andImage:(UIImage *)img{
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

        if ([response.status isEqualToString:@"200"]) {
            [weakself showHint:response.path.infos];

            if ([side isEqualToString:@"0"]) {
                [weakself.driverDic setValue:response.path.src forKey:@"driverf"];
            }else{
                [weakself.driverDic setValue:response.path.src forKey:@"drivers"];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakself showHint:@"上传失败"];
        [weakself hideHud];
    }];
}

//第一步确认身份证信息
- (void) confirmAuthentyDriverMessage {
    NSString *confimString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyAuthentyOfConfirmDriverCard,DPToken];
    
    DPWeakSelf;
    [self requestDataPostWithString:confimString params:weakself.driverDic successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:model.info];
        
        if ([model.status isEqualToString:@"200"]) {
            AuthentyDriverResultViewController *authentyDriverResultVC = [[AuthentyDriverResultViewController alloc] init];
            
            UINavigationController *nav = weakself.navigationController;
            [nav popViewControllerAnimated:NO];
            [nav pushViewController:authentyDriverResultVC animated:NO];
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
