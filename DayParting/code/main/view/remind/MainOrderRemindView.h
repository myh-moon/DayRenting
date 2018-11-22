//
//  MainOrderRemindView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeCycleProgress.h"
#import "ZXYCircleProgress.h"

@interface MainOrderRemindView : UIButton

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) TimeCycleProgress *cycleProgressView;
@property (nonatomic,strong) UIButton *countdownButton;  //倒计时按钮


@property (nonatomic,strong) ZXYCircleProgress *circleProgressView;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *actButton;

@end
