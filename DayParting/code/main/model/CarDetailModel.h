//
//  CarDetailModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "CarListModel.h"

@interface CarDetailModel : BaseModel

@property (nonatomic,strong) CarListModel *carinfo; //详情

@end
