//
//  OrderGenerateTextCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "OrderGenerateTextItem.h"

@interface OrderGenerateTextCell : BaseCell

@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *oilLabel;
@property (nonatomic,strong) UILabel *colorLabel;
@property (nonatomic,strong) UILabel *siteLabel;
@property (nonatomic,strong) UILabel *autoLabel;

@property (nonatomic,strong,readwrite) OrderGenerateTextItem *item;

@end
