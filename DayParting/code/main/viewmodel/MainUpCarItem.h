//
//  MainUpCarItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "CarListModel.h"

@interface MainUpCarItem : BaseItem

@property (nonatomic,strong) CarListModel *carListModel;

@property (nonatomic,copy) NSString *img;   //图片
@property (nonatomic,copy) NSString *car_code;//车牌
@property (nonatomic,copy) NSString *car_name;  //车辆名称
@property (nonatomic,copy) NSString *oilmass;  //油量
@property (nonatomic,copy) NSString *color;  //颜色
@property (nonatomic,copy) NSString *sites;  //座位

- (instancetype) initWithCarModel:(CarListModel *)model;

@end
