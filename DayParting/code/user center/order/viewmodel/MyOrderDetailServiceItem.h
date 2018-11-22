//
//  MyOrderDetailServiceItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "MyOrderModel.h"

@interface MyOrderDetailServiceItem : RETableViewItem

@property (nonatomic,copy) NSString *qcaddress;
@property (nonatomic,copy) NSString *hcaddress;
@property (nonatomic,copy) NSString *qctime;  //取车时间
@property (nonatomic,copy) NSString *hctime;  //还车时间


- (instancetype) initWithOrderModel:(MyOrderModel *)model;

@end
