//
//  CarPayMessageResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "CarPayMessageModel.h"

@interface CarPayMessageResponse : BaseModel

@property (nonatomic,strong) CarPayMessageModel *data;

@end
