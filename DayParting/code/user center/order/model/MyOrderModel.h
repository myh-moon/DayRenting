//
//  MyOrderModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/29.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyOrderModel : NSObject

@property (nonatomic,copy) NSString *number;  //code
@property (nonatomic,copy) NSString *car_name;  //name
@property (nonatomic,copy) NSString *jtime;  //计费时间（开始时间）
@property (nonatomic,copy) NSString *qcaddress;//取车点
@property (nonatomic,copy) NSString *qctime;
@property (nonatomic,copy) NSString *hctime;  //还车时间 （结束时间）
@property (nonatomic,copy) NSString *hcaddress;
@property (nonatomic,copy) NSString *hcnet;  //还车服务点
@property (nonatomic,copy) NSString *money;  //总共金额
@property (nonatomic,copy) NSString *statusname;  
@property (nonatomic,copy) NSString *addtime;
@property (nonatomic,copy) NSString *oid;  //订单号
@property (nonatomic,copy) NSString *hcdot;//还车点名字
@property (nonatomic,copy) NSString *status;  //状态=码 2-去支付，3-已完成 4-已取消
@property (nonatomic,copy) NSString *servicenum; //订单疑问字段 0-可以提交疑问，1-不能再次提交


//详情字段
@property (nonatomic,copy) NSString *img;//图片
@property (nonatomic,copy) NSString *color;// 颜色
@property (nonatomic,copy) NSString *sites;//座位
@property (nonatomic,copy) NSString *carname;  //name
@property (nonatomic,copy) NSString *qibufee;  //起步费用
@property (nonatomic,copy) NSString *shichangfee;  //时长费用
@property (nonatomic,copy) NSString *tsmoney;  //日间时长费用
@property (nonatomic,copy) NSString *ytmoney;  //夜间时长费用
@property (nonatomic,copy) NSString *kmmoney;  //里程费用
@property (nonatomic,copy) NSString *kmoney;  //里程单价
@property (nonatomic,copy) NSString *zunxiangmony;  //尊享服务费用
@property (nonatomic,copy) NSString *cservefee;  //车辆整备费用
@property (nonatomic,copy) NSString *rservefee;  //基础服务费用
@property (nonatomic,copy) NSString *rmoney;  //日租费用
@property (nonatomic,copy) NSString *cmoney;  //优惠券抵扣金额
@property (nonatomic,copy) NSString *ymoney;  //押金费用
@property (nonatomic,copy) NSString *smoney;  //使用微信支付的日实付费用
@property (nonatomic,copy) NSString *yuepay;  //使用余额支付的实付金额
@property (nonatomic,copy) NSString *mileage;//总里程

//@property (nonatomic,copy) NSString *type;//支付方式 1微信，2支付宝，3银行卡，4余额
@property (nonatomic,copy) NSString *types;//支付方式 1微信，2支付宝，3银行卡，4余额

@property (nonatomic,assign) BOOL selected;  //是否被选中（开发票的时候需要使用，关联item）

@end
