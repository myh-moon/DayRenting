//
//  CarMessageView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface CarMessageView : BasePopView

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *returnButton; //去还车
@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *durationLabel;  //用车时长
@property (nonatomic,strong) UILabel *distanceLabel;   //行驶里程
@property (nonatomic,strong) UILabel *costLabel;  //预计费用

@end
