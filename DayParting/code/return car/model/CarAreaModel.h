//
//  CarAreaModel.h
//  DayParting
//
//  Created by jiamanu on 2018/8/23.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarDepotModel.h"

@interface CarAreaModel : NSObject

@property (nonatomic,strong) CarDepotModel *dot;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *pid;

@end
