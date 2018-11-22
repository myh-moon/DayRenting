//
//  NetWorkViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "NetWorkViewController.h"

@interface NetWorkViewController ()

@end

@implementation NetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)requestDataGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void (^)(id))successBlock andFailBlock:(void (^)(NSError *))failBlock {
    
    [self showHudInView:self.view hint:@"请稍后"];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.validatesDomainName = NO;
    securityPolicy.allowInvalidCertificates = YES;
    session.securityPolicy = securityPolicy;
    
//    //无条件的信任服务器上的证书
//    AFSecurityPolicy *securityPolicy =  [AFSecurityPolicy defaultPolicy];
//    
//    // 客户端是否信任非法证书
//    
//    securityPolicy.allowInvalidCertificates = YES;
//    
//    // 是否在证书域字段中验证域名
//    
//    securityPolicy.validatesDomainName = NO;
//    
//    session.securityPolicy = securityPolicy;
    
    
    
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/htDP", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    DPWeakSelf;
    [session GET:string parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakself hideHud];
        
        if (successBlock) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakself hideHud];
        [weakself showHint:@"请检查网络"];
    }];
}

- (void)requestDataPostWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void (^)(id responseObject))successBlock andFailBlock:(void (^)(NSError *error))failBlock
{
    [self showHudInView:self.view hint:@"请稍后"];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/htDP", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    DPWeakSelf;
    [session POST:string parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakself hideHud];
        
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakself hideHud];
        [weakself showHint:@"请检查网络"];
    }];
}

- (void)requestDataMainGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void (^)(id))successBlock andFailBlock:(void (^)(NSError *))failBlock
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/htDP", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //    DPWeakSelf;
    [session GET:string parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //        [weakself hideHud];
        //        [weakself showHint:@"请检查网络"];
    }];
}


//-(void)requestDataPostImageWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock {
//    [self showHudInView:self.view hint:@"请稍后"];
//    
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
//    securityPolicy.validatesDomainName = NO;
//    securityPolicy.allowInvalidCertificates = YES;
//    session.securityPolicy = securityPolicy;
//    
//    //    //无条件的信任服务器上的证书
//    //    AFSecurityPolicy *securityPolicy =  [AFSecurityPolicy defaultPolicy];
//    //
//    //    // 客户端是否信任非法证书
//    //
//    //    securityPolicy.allowInvalidCertificates = YES;
//    //
//    //    // 是否在证书域字段中验证域名
//    //
//    //    securityPolicy.validatesDomainName = NO;
//    //
//    //    session.securityPolicy = securityPolicy;
//    
//    
//    
//    session.responseSerializer = [AFHTTPResponseSerializer serializer];
//    session.requestSerializer = [AFHTTPRequestSerializer serializer];
//    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/htDP", nil];
//    
//    //设置超时时间
//    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    session.requestSerializer.timeoutInterval = 5.f;
//    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    
//    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//                                                         @"text/html",
//                                                         @"image/jpeg",
//                                                         @"image/png",
//                                                         @"application/octet-stream",
//                                                         @"text/json",
//                                                         nil];
//    
//    DPWeakSelf;
//    [session POST:string parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//        NSData *imageData =UIImageJPEGRepresentation(image,1);
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat =@"yyyy-MM-dd H:mm:ss";
//        NSString *str = [formatter stringFromDate:[NSDate date]];
//        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
//        
//        //上传的参数(上传图片，以文件流的格式)
//        [formData appendPartWithFileData:imageData
//                                    name:@"file"
//                                fileName:fileName
//                                mimeType:@"image/jpeg"];
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [weakself hideHud];
//        if (successBlock) {
//            successBlock(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [weakself hideHud];
//        [weakself showHint:@"请检查网络"];
//    }];
//}



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
