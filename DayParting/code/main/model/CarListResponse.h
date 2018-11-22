//
//  CarListResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "CarListModel.h"

@interface CarListResponse : BaseModel

@property (nonatomic,strong) NSMutableArray *cardata;  //可用车辆列表

@property (nonatomic,copy) NSString *dotname;  //服务点 
@property (nonatomic,copy) NSString *dotAddrs;  //服务点地址
@property (nonatomic,copy) NSString *carnum;  //可用车辆
@property (nonatomic,copy) NSString *positionsnum;  //停车位
@property (nonatomic,copy) NSString *range;  //距离
@property (nonatomic,copy) NSString *lat;  //
@property (nonatomic,copy) NSString *lng;


@property (nonatomic,strong) CarListModel *data; //“现在用车”按钮，返回的数据

@end
