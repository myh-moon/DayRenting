//
//  AppDelegate.m
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <WXApi.h>
#import <WXApiObject.h>
#import "sys/utsname.h"


#import <CommonCrypto/CommonDigest.h>

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置状态栏的文字颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    //设置textfield的光标颜色
    [[UITextField appearance] setTintColor:DPBlueColor];
    
    //设置tableview的分割线颜色
    [[UITableView appearance] setSeparatorColor:UIColorFromRGB(0xe1e1e1)];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window.rootViewController = mainNav;
    
    //注册高德地图
    [AMapServices sharedServices].apiKey = @"5b7848881212152d00974b7176bd1fa0";
     [AMapServices sharedServices].enableHTTPS = YES;
    
    //注册微信AppID
    [WXApi registerApp:@"wxdcb98381198ab49c"];
    
    [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"authenty"];
    [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"orderTag"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //// 启动图片延时: 4秒
    [NSThread sleepForTimeInterval:3];
    
    self.window.backgroundColor = DPWhiteColor;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

//重写
- (void)onResp:(BaseResp *)resp{

    NSString * strMsg = [NSString stringWithFormat:@"errorCode: %d",resp.errCode];
    
    NSString * strTitle;
    
    //判断是微信消息的回调 --> 是支付回调回来的还是消息回调回来的.
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        strTitle = [NSString stringWithFormat:@"发送媒体消息的结果"];
    }
    
    NSString * wxPayResult;
    
    //判断是否是微信支付回调
    if ([resp isKindOfClass:[PayResp class]]) {
        //支付返回的结果, 实际支付结果需要去微信服务器端查询
        strTitle = [NSString stringWithFormat:@"支付结果"];
        switch (resp.errCode) {
            case WXSuccess: {
                strMsg = @"支付结果:";
                //                NSLog(@"支付成功: %d",resp.errCode);
                wxPayResult = @"success";
                break;
            }
            case WXErrCodeUserCancel: {
                strMsg = @"用户取消了支付";
                //                NSLog(@"用户取消支付: %d",resp.errCode);
                wxPayResult = @"cancel";
                break;
            }
            default:
            {
                strMsg = [NSString stringWithFormat:@"支付失败! code: %d  errorStr: %@",resp.errCode,resp.errStr];
                //                NSLog(@":支付失败: code: %d str: %@",resp.errCode,resp.errStr);
                wxPayResult = @"faile";
                break;
            }
        }
        
        if ( [[[NSUserDefaults standardUserDefaults] objectForKey:@"type"] isEqualToString:@"recharge"]) {
            //全局广播
            NSNotification * notification = [NSNotification notificationWithName:@"ZJRecharge" object:wxPayResult];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
        }else{
            //全局广播
            NSNotification * notification = [NSNotification notificationWithName:@"ZJPay" object:wxPayResult];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
        }
    }
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
