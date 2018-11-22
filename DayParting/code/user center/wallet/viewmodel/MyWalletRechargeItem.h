//
//  MyWalletRechargeItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"

@interface MyWalletRechargeItem : RETableViewItem

@property (nonatomic,copy) NSString *money;

@property (nonatomic,strong) void (^didEditting)(NSString *text);


@end
