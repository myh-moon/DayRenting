//
//  MyOrderDetailCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailItem.h"

@interface MyOrderDetailCell : BaseCell

@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *contentLabel;

@property (nonatomic,strong,readwrite)MyOrderDetailItem *item;

@end
