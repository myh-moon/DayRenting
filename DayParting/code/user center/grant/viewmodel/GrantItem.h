//
//  GrantItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"

@interface GrantItem : BaseItem

@property (nonatomic,copy) NSString *step;  //0-第一步。 1-第一步成功，到第二步，2-第二步成功
@property (nonatomic,copy) NSString *score;  //芝麻分
@end
