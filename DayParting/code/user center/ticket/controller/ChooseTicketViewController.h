//
//  ChooseTicketViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/9/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPViewController.h"
#import "TicketModel.h"

@interface ChooseTicketViewController : DPViewController

@property (nonatomic,strong) void (^didSelectedItem)(TicketModel *model);

@property (nonatomic,strong) NSString *oid;  //订单号

@property (nonatomic,strong) TicketModel *choosedTicketModel;  //优惠券;  //是否选择过优惠券（若选择过，优惠券列表里会选中已选择的优惠券，若没有选择过，则选中“为选择优惠券”）

@end
