//
//  OrderResultViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "NetWorkViewController.h"

@interface OrderResultViewController : NetWorkViewController

@property (nonatomic,strong) NSString *direction;  //1-生成订单 2-首页进入

@property (nonatomic,assign) CLLocationCoordinate2D userCoordinate;
@property (nonatomic,assign) CLLocationCoordinate2D qcCoordinate;

@end
