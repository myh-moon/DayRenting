//
//  CarListModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarListModel : NSObject

@property (nonatomic,copy) NSString *img;   //图片
@property (nonatomic,copy) NSString *car_code;
@property (nonatomic,copy) NSString *car_name;  //车辆名称
@property (nonatomic,copy) NSString *oilmass;  //油量
@property (nonatomic,copy) NSString *color;  //颜色
@property (nonatomic,copy) NSString *sites;  //座位
@property (nonatomic,copy) NSString *carmodelid;  //id
@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *lng;

//详情字段
@property (nonatomic,copy) NSString *smoney;  //公里计费
@property (nonatomic,copy) NSString *rmoney;   //日租
@property (nonatomic,copy) NSString *tsmoney;  //白天分钟
@property (nonatomic,copy) NSString *ytmoney;  //夜间分钟


//生成订单字段
@property (nonatomic,copy) NSString *bname;  //取车服务点
@property (nonatomic,copy) NSString *address;  //取车详细地址


//现在用车 - 最近订单
//@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *netid;
@property (nonatomic,copy) NSString *carnum;
@property (nonatomic,copy) NSString *range;
@property (nonatomic,copy) NSString *tel;

@end
