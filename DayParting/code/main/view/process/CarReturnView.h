//
//  CarReturnView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface CarReturnView : BasePopView

@property (nonatomic,strong) UILabel *blueLabel;
@property (nonatomic,strong) UILabel *serviceLabel;
@property (nonatomic,strong) UILabel *addressLabel;

@property (nonatomic,strong) UILabel *lineLabel;

@property (nonatomic,strong) UILabel *availableLabel;  //可用车位
//@property (nonatomic,strong) UILabel *occupyLabel;  //已停车辆
@property (nonatomic,strong) UILabel *businessLabel;   //营业时间


@end
