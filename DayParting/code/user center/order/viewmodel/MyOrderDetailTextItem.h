//
//  MyOrderDetailTextItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "MyOrderModel.h"

@interface MyOrderDetailTextItem : RETableViewItem

@property (nonatomic,copy) NSString *carImageString;
@property (nonatomic,copy) NSString *carCodeString;
@property (nonatomic,copy) NSString *carNameString;
@property (nonatomic,copy) NSString *colorString;
@property (nonatomic,copy) NSString *siteString;
@property (nonatomic,copy) NSString *autoString;

- (instancetype) initWithOrderModel:(MyOrderModel *)model;

@end
