//
//  MyHistoryDetailResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/9/18.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "MyHistoryModel.h"

@interface MyHistoryDetailResponse : BaseModel

@property (nonatomic,strong)  MyHistoryModel *data;

@end
