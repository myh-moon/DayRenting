//
//  CarReturnViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPViewController.h"
#import <MAMapKit/MAMapKit.h>
//#import <AMapFoundationKit/AMapFoundationKit.h>
#import "CarReturnModel.h"

@interface CarReturnViewController : DPViewController

@property (nonatomic,assign) CLLocationCoordinate2D qcCoordinate;  //取车点
@property (nonatomic,assign) CLLocationCoordinate2D userCoordinate; //当前位置

@property (nonatomic,strong) void (^didSelectedCell)(CarReturnModel *returnModel);

@property (nonatomic,strong) NSString *direction;  //1-生成预定订单时选择还车点 2-更改还车点
@property (nonatomic,strong) NSString *oid;  //1-生成预定订单时选择还车点 2-更改还车点

@end
