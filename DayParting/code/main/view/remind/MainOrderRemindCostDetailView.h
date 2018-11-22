//
//  MainOrderRemindCostDetailView.h
//  DayParting
//
//  Created by jiamanu on 2018/9/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface MainOrderRemindCostDetailView : BasePopView

@property (nonatomic,strong) UIButton *cancelButton;  //取消按钮
@property (nonatomic,strong) UILabel *rentMoneyLabel;  //租金

@property (nonatomic,strong) UILabel *lineLabel1;

@property (nonatomic,strong) UILabel *baseLabel;  //起步价
@property (nonatomic,strong) UILabel *baseMoneyLabel;  //起步价

@property (nonatomic,strong) UILabel *shichangLabel;  //时长
@property (nonatomic,strong) UILabel *shichangMoneyLabel;  //时长费用

@property (nonatomic,strong) UILabel *lichengLabel;  //里程
@property (nonatomic,strong) UILabel *lichengMoneyLabel;  //里程费用


@property (nonatomic,strong) UILabel *serviceLabel;  //尊享服务费
@property (nonatomic,strong) UILabel *serviceMoneyLabel;  

@property (nonatomic,strong) UILabel *lineLabel2;

@property (nonatomic,strong) UIButton *ruleButton;  //计价规则
@property (nonatomic,strong) UIButton *questionButton;  //订单疑问
@property (nonatomic,strong) UILabel *lineLabel3;


@end
