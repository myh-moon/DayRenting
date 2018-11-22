//
//  MyOrderItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "MyOrderModel.h"

@interface MyOrderItem : RETableViewItem

@property (nonatomic,copy) NSString *number;
@property (nonatomic,copy) NSString *car_name;
@property (nonatomic,copy) NSString *qctime;
@property (nonatomic,copy) NSString *qcaddress;  //取车服务点
@property (nonatomic,copy) NSString *hcaddress;  //还车地址
@property (nonatomic,copy) NSString *hctime;
@property (nonatomic,copy) NSString *money;
@property (nonatomic,copy) NSString *smoney;
@property (nonatomic,copy) NSString *status;

- (instancetype) initWithOrderModel:(MyOrderModel *)model;

@end
