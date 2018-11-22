//
//  CarStatusView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface CarStatusView : BasePopView

@property (nonatomic,strong) UILabel *wantCarLabel;  //取车
@property (nonatomic,strong) UILabel *useCarLabel;  //用车
@property (nonatomic,strong) UILabel *payLabel;  //支付

//@property (nonatomic,strong) UISlider *statusSlider; //进度



@property (nonatomic,strong) UILabel *line1;
@property (nonatomic,strong) UILabel *line2;
@property (nonatomic,strong) UILabel *line3;
@property (nonatomic,strong) UILabel *line4;
@property (nonatomic,strong) UIImageView *imagePoint1;
@property (nonatomic,strong) UIImageView *imagePoint2;
@property (nonatomic,strong) UIImageView *imagePoint3;

@end
