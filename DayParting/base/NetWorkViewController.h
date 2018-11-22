//
//  NetWorkViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseViewController.h"

@interface NetWorkViewController : BaseViewController

//post
-(void)requestDataPostWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;

//get
-(void)requestDataGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;

//- (void)toLoginifNotLoginFromController:(UIViewController *)controller;;

//首页请求，因为是多个请求，MBProgressHUD需要在主线程内，所以去掉hud
-(void)requestDataMainGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;


//- (void) uploadImageWithType:(NSString *)type andSide:(NSString *)side andImage:(UIImage *)img successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;

@end
