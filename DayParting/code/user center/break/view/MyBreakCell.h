//
//  MyBreakCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakItem.h"

@interface MyBreakCell : BaseCell

@property (nonatomic,strong) UIView *breakBackView;
@property (nonatomic,strong) UILabel *numberLabel;  //决定书编号
@property (nonatomic,strong) UIButton *checkNumberButton;
@property (nonatomic,strong) UILabel *reasonLabel;  //违章原因
@property (nonatomic,strong) UILabel *timeLabel;  //违章时间
@property (nonatomic,strong) UILabel *addressLabel;  //违章地点
@property (nonatomic,strong) UILabel *lineLabel; //分割线

@property (nonatomic,strong) UILabel *resultLabel;  //处理结果

@property (nonatomic,strong) UIButton *actButton;  //处理状态

@property (nonatomic,strong,readwrite) MyBreakItem *item;

@end
