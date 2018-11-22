//
//  WechatModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"

@interface WechatModel : BaseModel

@property (nonatomic,copy) NSString *partnerid;
@property (nonatomic,copy) NSString *noncestr;
@property (nonatomic,copy) NSString *package;
@property (nonatomic,copy) NSString *prepayid;
@property (nonatomic,copy) NSString *sign;
@property (nonatomic,copy) NSString *timestamp;

@end
