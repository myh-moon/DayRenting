//
//  WechatResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/9/18.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "WechatModel.h"

@interface WechatResponse : BaseModel

@property (nonatomic,strong) WechatModel *data;

@end
