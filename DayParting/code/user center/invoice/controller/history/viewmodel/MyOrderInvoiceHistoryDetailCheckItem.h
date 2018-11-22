//
//  MyOrderInvoiceHistoryDetailCheckItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "MyHistoryModel.h"

@interface MyOrderInvoiceHistoryDetailCheckItem : RETableViewItem

@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,copy) NSString *timeString;
//@property (nonatomic,copy) NSString *tag;  //1-开具发票。2-总共行程

- (instancetype) initWithHistoryModel:(MyHistoryModel *)model andTag:(NSString *)tag;

@end
