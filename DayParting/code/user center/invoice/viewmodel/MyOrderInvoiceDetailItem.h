//
//  MyOrderInvoiceDetailItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/30.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "MyOrderModel.h"

@interface MyOrderInvoiceDetailItem : BaseItem

@property (nonatomic,assign) BOOL selectedInvoice;  //1-选中该行程，其他是未选中

@property (nonatomic,copy) NSString *nameString;
@property (nonatomic,copy) NSString *moneyString;
@property (nonatomic,copy) NSString *qctimeString;
@property (nonatomic,copy) NSString *qcnetString;
@property (nonatomic,copy) NSString *hctimeString;
@property (nonatomic,copy) NSString *hcnetString;

- (instancetype) initWithOrderModel:(MyOrderModel *)model;

@end
