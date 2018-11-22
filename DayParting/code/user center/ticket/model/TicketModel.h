//
//  TicketModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicketModel : NSObject

@property (nonatomic,copy) NSString *tid;
@property (nonatomic,copy) NSString *money;  //优惠券金额
@property (nonatomic,copy) NSString *etime;  //结束时间
@property (nonatomic,copy) NSString *stime; //开始时间
@property (nonatomic,copy) NSString *status; 
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *norm;  //使用规则
@property (nonatomic,copy) NSString *condition;  


@end
