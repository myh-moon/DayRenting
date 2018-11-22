//
//  CapitalModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CapitalModel : NSObject

 //1-充值，2-提现，3-租车支付，4-系统充值，5-系统扣费，6-冻结，7-解冻，8-押金
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *addtime;  //时间
@property (nonatomic,copy) NSString *money; 
@property (nonatomic,copy) NSString *status; //0-失败，1-成功

@end
