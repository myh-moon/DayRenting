//
//  MainUpCarDetailTextItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "CarListModel.h"

@interface MainUpCarDetailTextItem : BaseItem

@property (nonatomic,copy) NSString *car_code;
@property (nonatomic,copy) NSString *car_name;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *oil;
@property (nonatomic,assign) NSInteger oilClass; 
@property (nonatomic,copy) NSString *color;
@property (nonatomic,copy) NSString *sites;
@property (nonatomic,copy) NSString *autos;  

- (instancetype) initWithCarDetailModel:(CarListModel *)carModel;

@end
