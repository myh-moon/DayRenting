//
//  MyOrderDetailResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "MyOrderModel.h"

@interface MyOrderDetailResponse : BaseModel

@property (nonatomic,strong) MyOrderModel *data;

@end
