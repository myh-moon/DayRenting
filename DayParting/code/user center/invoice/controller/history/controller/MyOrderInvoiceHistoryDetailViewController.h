//
//  MyOrderInvoiceHistoryDetailViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPViewController.h"

@interface MyOrderInvoiceHistoryDetailViewController : DPViewController

@property (nonatomic,strong) NSString *ID;  //发票id
@property (nonatomic,strong) NSString *type;  //发票类型 //0-电子发票。 1-纸质发票

@end
