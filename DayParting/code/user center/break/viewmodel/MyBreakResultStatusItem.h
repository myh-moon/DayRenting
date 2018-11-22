//
//  MyBreakResultStatusItem.h
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakResultStatusItem : BaseItem

@property (nonatomic,copy) NSString *status; //违章处理状态 2-//正在核实材料 3-核实资料失败 4-违章已处理完成

@end

NS_ASSUME_NONNULL_END
