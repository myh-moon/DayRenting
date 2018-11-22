//
//  InvoiceTotalView.h
//  DayParting
//
//  Created by jiamanu on 2018/9/3.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface InvoiceTotalView : BasePopView

@property (nonatomic,strong) UILabel *totalLabel;
@property (nonatomic,strong) UILabel *lineLabel;

@property (nonatomic,strong) UIButton *selectTotalButton;
@property (nonatomic,strong) UIButton *nextStepButton;

@property (nonatomic,strong) void (^didClickBtn)(UIButton *btn);


@end
