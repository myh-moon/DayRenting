//
//  OrderGenerateProcessCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"

#import "OrderGenerateProcessItem.h"

@interface OrderGenerateProcessCell : BaseCell

@property (nonatomic,strong) UIImageView *serviceImageView;
@property (nonatomic,strong) UIImageView *returnImageView;
@property (nonatomic,strong) UIImageView *timeImageView;
@property (nonatomic,strong) UIImageView *dottedImageView1;

@property (nonatomic,strong) UIButton *serviceButton;  //取车
@property (nonatomic,strong) UILabel *serviceLabel1;
@property (nonatomic,strong) UILabel *serviceLabel2;


@property (nonatomic,strong) UIButton *returnButton;  //还车
//@property (nonatomic,strong) UITextField *returnTextField;
@property (nonatomic,strong) UIButton *returnPointButton;  //还车点
@property (nonatomic,strong) UIButton *returnImageButton;

@property (nonatomic,strong) UIButton *timeButton;  //时间
@property (nonatomic,strong) UIButton *timePointButton;
@property (nonatomic,strong) UILabel *timeLabel2;


@property (nonatomic,strong,readwrite) OrderGenerateProcessItem *item;

@end
