//
//  CarPayMessageModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarPayMessageModel : NSObject

@property (nonatomic,copy) NSString *money;  //总价
@property (nonatomic,copy) NSString *smoney;   //每公里多少钱
//@property (nonatomic,copy) NSString *tsmoney;  //分钟
//@property (nonatomic,copy) NSString *rmoney;  //日租
@property (nonatomic,copy) NSString *ymoney;   //押金
@property (nonatomic,copy) NSString *totlsmoney;  //公里分钟开车计费
@property (nonatomic,copy) NSString *hcmoney;  //附加费
@property (nonatomic,copy) NSString *cmoney;  //优惠券


//@property (nonatomic,copy) NSString *qibufee;  //起步费用
@property (nonatomic,copy) NSString *shichangfee;  //时长费用
@property (nonatomic,copy) NSString *tsmoney;  //日间时长费用
@property (nonatomic,copy) NSString *ytmoney;  //夜间时长费用
@property (nonatomic,copy) NSString *kmmoney;  //里程费用
//@property (nonatomic,copy) NSString *kmoney;  //里程单价
@property (nonatomic,copy) NSString *zunxiangmony;  //尊享服务费用
@property (nonatomic,copy) NSString *cservefee;  //车辆整备费用
@property (nonatomic,copy) NSString *rservefee;  //基础服务费用
@property (nonatomic,copy) NSString *rmoney;  //日租费用
//@property (nonatomic,copy) NSString *cmoney;  //优惠券抵扣金额
//@property (nonatomic,copy) NSString *ymoney;  //押金费用
//@property (nonatomic,copy) NSString *smoney;  //日实付费用

@end
