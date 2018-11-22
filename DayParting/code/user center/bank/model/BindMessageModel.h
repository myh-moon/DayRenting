//
//  BindMessageModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"

@interface BindMessageModel : BaseModel

@property (nonatomic,copy) NSString *tel;  //手机号
@property (nonatomic,copy) NSString *member;  //持卡人
@property (nonatomic,copy) NSString *idcard; //身份证号

@end
