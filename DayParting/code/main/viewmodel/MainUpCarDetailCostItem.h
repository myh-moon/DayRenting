//
//  MainUpCarDetailCostItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "CarListModel.h"

@interface MainUpCarDetailCostItem : RETableViewItem

@property (nonatomic,copy) NSString *tsmoney;  //分钟
@property (nonatomic,copy) NSString *smoney;  //公里

- (instancetype) initWithCarDetailModel:(CarListModel *)carModel;

@end
