//
//  BaseItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"

@interface BaseItem : RETableViewItem

@property (nonatomic,copy) NSString *showSeperate;  //默认是左边15，2-左右15，3-无，4-整条显示
@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@property (nonatomic,strong) void (^didEditting)(NSString *text);

@end
