//
//  LoginModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"

@interface LoginModel : BaseModel

@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *phone;  //手机号
@property (nonatomic,copy) NSString *realname;  //真实姓名
@property (nonatomic,copy) NSString *idcard;  //身份证号

@end
