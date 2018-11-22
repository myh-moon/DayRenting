//
//  WalletResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "WalletModel.h"

@interface WalletResponse : BaseModel

@property (nonatomic,copy) NSString *balance;  //账户余额
@property (nonatomic,copy) NSString *ticketnum;  //可用优惠券数量
@property (nonatomic,strong) NSArray *bankinfo;

@property (nonatomic,copy) NSString *checkpwd; //是否设置过余额支付密码

//@property (nonatomic,strong) WalletModel *bankinfo;  //银行卡信息

@end
