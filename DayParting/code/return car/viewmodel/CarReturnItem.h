//
//  CarReturnItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "CarReturnModel.h"

@interface CarReturnItem : RETableViewItem

@property (nonatomic,copy) NSString *service;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *distance;


- (instancetype) initWithCarReturnModel:(CarReturnModel *)returnModel;

@end
