//
//  MyHistoryModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyHistoryModel : NSObject

@property (nonatomic,copy) NSString *addtime;
@property (nonatomic,copy) NSString *type;  //0-电子发票。 1-纸质发票
@property (nonatomic,copy) NSString *pcontent;  //租赁类型（分时租赁，日租）
@property (nonatomic,copy) NSString *money;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *address;  //电子发票地址


//历史发票详情额外需要的字段
@property (nonatomic,copy) NSString *pname;  //抬头
@property (nonatomic,copy) NSString *companynum;  //公司抬头税号
@property (nonatomic,copy) NSString *kname; //快递地址
@property (nonatomic,copy) NSString *num;//快递单号
@property (nonatomic,copy) NSString *cate; // 1个人；2公司（普票）
@property (nonatomic,copy) NSString *oids; //多个订单号
@end
