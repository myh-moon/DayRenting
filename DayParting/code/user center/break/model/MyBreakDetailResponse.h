//
//  MyBreakDetailResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "MyBreakModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDetailResponse : BaseModel

@property (nonatomic,strong) MyBreakModel *data;

@end

NS_ASSUME_NONNULL_END
