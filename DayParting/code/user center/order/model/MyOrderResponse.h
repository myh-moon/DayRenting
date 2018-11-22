//
//  MyOrderResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"

@interface MyOrderResponse : BaseModel

@property (nonatomic,strong) NSMutableArray *nofinish;   //待支付订单
@property (nonatomic,strong) NSMutableArray *b;   //已完成订单
@property (nonatomic,strong) NSMutableArray *c;   //已取消订单

@end
