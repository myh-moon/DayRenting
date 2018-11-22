//
//  MyBreakModel.h
//  DayParting
//
//  Created by jiamanu on 2018/11/2.
//  Copyright © 2018 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakModel : NSObject

@property (nonatomic,copy) NSString *handle;
@property (nonatomic,copy) NSString *is_sms; //0-立即处理，其他-正在处理中
@property (nonatomic,copy) NSString *oid;  //决定书编号/订单号
@property (nonatomic,copy) NSString *ID;   //违章id
@property (nonatomic,copy) NSString *wzcontent;  //违章原因
@property (nonatomic,copy) NSString *wztime; //违章时间
@property (nonatomic,copy) NSString *wzaddr;  //违章地点
@property (nonatomic,copy) NSString *wzmoeny;
@property (nonatomic,copy) NSString *wzfj;  // 罚多少钱
@property (nonatomic,copy) NSString *wzkf; //0-不扣分，其他-扣n分
@property (nonatomic,copy) NSString *wznumber;//车牌号

@end

NS_ASSUME_NONNULL_END
