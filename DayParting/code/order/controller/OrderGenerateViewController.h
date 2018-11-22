//
//  OrderGenerateViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "NetWorkViewController.h"
#import "CarListModel.h"

#import <MAMapKit/MAMapKit.h>
//#import <AMapFoundationKit/AMapFoundationKit.h>

@interface OrderGenerateViewController : NetWorkViewController

@property (nonatomic,strong) CarListModel *carModel;

@property (nonatomic,assign) CLLocationCoordinate2D userCoordinate;
@property (nonatomic,assign) CLLocationCoordinate2D qcCoordinate;


@end
