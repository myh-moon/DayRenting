//
//  AvailableOrderModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/24.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AvailableOrderModel : NSObject

@property (nonatomic,copy) NSString *oid;
@property (nonatomic,copy) NSString *ymoney;
@property (nonatomic,copy) NSString *addtime; //订单生成时间（倒计时半小时的参考时间）
@property (nonatomic,copy) NSString *unlocktime;  //开锁时间

@property (nonatomic,copy) NSString *checkpwd; //用户是否设置过余额支付密码

@property (nonatomic,copy) NSString *ticketnum;  //优惠券可用张数
//@property (nonatomic,copy) NSString *balance;  //账户余额
@property (nonatomic,copy) NSString *useryue;  //账户余额
@property (nonatomic,copy) NSString *money;  //应付金额
@property (nonatomic,copy) NSString *shichangfee;  //时长费用
@property (nonatomic,copy) NSString *tsmoney;  //日间时长费用
@property (nonatomic,copy) NSString *ytmoney;  //夜间时长费用
@property (nonatomic,copy) NSString *smoney;   //微信实付款（不同接口字段表示不同意思，请注意）
@property (nonatomic,copy) NSString *kmmoney;  //里程费用
@property (nonatomic,copy) NSString *zunxiangmony;  //尊享服务费用
@property (nonatomic,copy) NSString *kmoney;  //每公里多少钱
@property (nonatomic,copy) NSString *mileage;  //开车总里程
@property (nonatomic,copy) NSString *yuepay;  //当只需要账户余额支付时，需要支付的金钱


@property (nonatomic,copy) NSString *status;  //订单状态 1-预定成功，2-还车成功但未支付
@property (nonatomic,copy) NSString *car_name;
@property (nonatomic,copy) NSString *car_code;
@property (nonatomic,copy) NSString *qcaddress;   //取车服务点
@property (nonatomic,copy) NSString *upaddress;  //取车详细地址
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *color;
@property (nonatomic,copy) NSString *sites; 
@property (nonatomic,copy) NSString *oilmass;  //油量

@property (nonatomic,copy) NSString *ordercycle; //过期时间
@property (nonatomic,copy) NSString *jtime; //检查车辆的10分钟是否结束
@property (nonatomic,copy) NSString *hctime; //还车时间
@property (nonatomic,copy) NSString *qctime; //取车时间


@property (nonatomic,copy) NSString *hcaddress;   //还车点
@property (nonatomic,copy) NSString *yhcaddress;   //预还车具体地址
@property (nonatomic,copy) NSString *hcnet;   //预计还车服务点

@property (nonatomic,copy) NSString *hclat;   //还车点
@property (nonatomic,copy) NSString *hclng;   //还车点
@property (nonatomic,copy) NSString *lat;   //取车点
@property (nonatomic,copy) NSString *lng;   //取车点


//@property (nonatomic,copy) NSString *money;  //总价
//@property (nonatomic,copy) NSString *smoney;   //每公里多少钱
////@property (nonatomic,copy) NSString *tsmoney;  //分钟
////@property (nonatomic,copy) NSString *rmoney;  //日租
//@property (nonatomic,copy) NSString *ymoney;   //押金
//@property (nonatomic,copy) NSString *totlsmoney;  //公里分钟开车计费
//@property (nonatomic,copy) NSString *hcmoney;  //附加费
//@property (nonatomic,copy) NSString *cmoney;  //优惠券
//
//
////@property (nonatomic,copy) NSString *qibufee;  //起步费用
//@property (nonatomic,copy) NSString *shichangfee;  //时长费用
//@property (nonatomic,copy) NSString *tsmoney;  //日间时长费用
//@property (nonatomic,copy) NSString *ytmoney;  //夜间时长费用
//@property (nonatomic,copy) NSString *kmmoney;  //里程费用
////@property (nonatomic,copy) NSString *kmoney;  //里程单价
//@property (nonatomic,copy) NSString *zunxiangmony;  //尊享服务费用
//@property (nonatomic,copy) NSString *cservefee;  //车辆整备费用
//@property (nonatomic,copy) NSString *rservefee;  //基础服务费用
//@property (nonatomic,copy) NSString *rmoney;  //日租费用
////@property (nonatomic,copy) NSString *cmoney;  //优惠券抵扣金额
////@property (nonatomic,copy) NSString *ymoney;  //押金费用
////@property (nonatomic,copy) NSString *smoney;  //日实付费用


@end
