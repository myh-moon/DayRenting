//
//  MyOrderDetailTextCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailTextItem.h"

@interface MyOrderDetailTextCell : BaseCell

@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *colorLabel;
@property (nonatomic,strong) UILabel *siteLabel;
@property (nonatomic,strong) UILabel *autoLabel;

@property (nonatomic,strong,readwrite) MyOrderDetailTextItem *item;

@end
