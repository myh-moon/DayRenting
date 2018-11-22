//
//  LoginCodeItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"

@interface LoginCodeItem : BaseItem

@property (nonatomic,copy) NSString *codeStr; //验证码
@property (nonatomic,copy) NSString *secondStr; //倒计时
@property (nonatomic,copy) NSString *statusStr; //是否显示黄色提示框
@property (nonatomic,copy) NSString *phoneStr; //手机号

@property (nonatomic,strong) void (^didEditting)(NSString *text);

@end
