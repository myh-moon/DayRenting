//
//  UserModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/10.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,copy) NSString *toppic;  //用户头像
@property (nonatomic,copy) NSString *name;  //用户名
@property (nonatomic,copy) NSString *socre;  //用户积分
@property (nonatomic,assign) BOOL is_realname;  //是否实名认证
@property (nonatomic,assign) BOOL is_driver;  //是否驾照认证
@property (nonatomic,assign) BOOL Isidcard;  //是否身份认证Isidcard。//false-身份认证第一步，true-身份认证第二步

@property (nonatomic,strong) NSArray *ticketlist;  //积分列表

@end
