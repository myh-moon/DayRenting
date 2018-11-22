//
//  MyOrderDetailServiceCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailServiceItem.h"

@interface MyOrderDetailServiceCell : BaseCell

@property (nonatomic,strong) UILabel *startPointLabel;
@property (nonatomic,strong) UILabel *startTimeLabel;
@property (nonatomic,strong) UILabel *startServiceLabel;

@property (nonatomic,strong) UIImageView *dotImageView;

@property (nonatomic,strong) UILabel *endPointLabel;
@property (nonatomic,strong) UILabel *endTimeLabel;
@property (nonatomic,strong) UILabel *endServiceLabel;

@property (nonatomic,strong,readwrite) MyOrderDetailServiceItem *item;



@end
