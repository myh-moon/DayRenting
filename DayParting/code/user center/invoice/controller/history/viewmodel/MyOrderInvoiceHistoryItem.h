//
//  MyOrderInvoiceHistoryItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "MyHistoryModel.h"

@interface MyOrderInvoiceHistoryItem : RETableViewItem

@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *type;  //0-电子发票。 1-纸质发票
@property (nonatomic,copy) NSString *pcontent;  //租赁类型（分时租赁，日租）
@property (nonatomic,copy) NSString *money;

- (instancetype) initWithHistoryModel:(MyHistoryModel *)model;

@end
