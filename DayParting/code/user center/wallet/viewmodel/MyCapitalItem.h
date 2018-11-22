//
//  MyCapitalItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "CapitalModel.h"

@interface MyCapitalItem : RETableViewItem

@property (nonatomic,copy) NSString *nameString;
@property (nonatomic,copy) NSString *timeString;
@property (nonatomic,copy) NSString *moneyString;
@property (nonatomic,copy) NSString *statusString;

- (instancetype) initWithCapitalModel:(CapitalModel *)model;

@end
