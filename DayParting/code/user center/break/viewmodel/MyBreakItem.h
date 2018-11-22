//
//  MyBreakItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "MyBreakModel.h"

@interface MyBreakItem : BaseItem

@property (nonatomic,copy) NSString *numberString;//决定书编号
@property (nonatomic,copy) NSString *reasonString;  //原因
@property (nonatomic,copy) NSString *timeString;
@property (nonatomic,copy) NSString *addressString;
@property (nonatomic,copy) NSString *result1String;  //罚钱
@property (nonatomic,copy) NSString *result2String; //扣分
@property (nonatomic,copy) NSString *statusString; //j处理状态
//
- (instancetype) initWithModel:(MyBreakModel *)model;

@end
