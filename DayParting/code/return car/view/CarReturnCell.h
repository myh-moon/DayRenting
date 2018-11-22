//
//  CarReturnCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "CarReturnItem.h"

@interface CarReturnCell : BaseCell

@property (nonatomic,strong) UILabel *serviceLabel;
@property (nonatomic,strong) UIButton *chooseButton;

@property (nonatomic,strong,readwrite) CarReturnItem *item;

@end
