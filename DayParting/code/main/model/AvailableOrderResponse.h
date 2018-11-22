//
//  AvailableOrderResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/8/24.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "AvailableOrderModel.h"

@interface AvailableOrderResponse : BaseModel

@property (nonatomic,strong) AvailableOrderModel *data;

@end
